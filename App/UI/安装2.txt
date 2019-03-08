@echo off
cd /d %~dp0..

::运行时需要启用延迟变量

::读取安装信息
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b
set 安装路径=%programfiles%\%默认安装路径%

::读取注册表-已安装应用路径
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\%公司名%\%软件名%"') do set 注册表_%%a=%%c>nul
if exist "%注册表_InstallDir%" set 注册表_InstallDir=%注册表_InstallDir:"=%&set 安装路径=%注册表_InstallDir%

:设置
if "%软件位数%"=="32 64" set UI_软件位数=
if "%软件位数%"=="32" set UI_软件位数=32bit
if "%软件位数%"=="64" set UI_软件位数=64bit
if "%安装窗口标题%"=="" title 安装 %公司名% %软件名% %软件版本% %UI_软件位数%
if not "%安装窗口标题%"=="" title %安装窗口标题%

:阅读条款
if not defined 条款文本 goto :设置安装路径
if defined 条款显示     goto :阅读条款显示
if not defined 条款显示 goto :设置安装路径

:阅读条款显示
mode 81,25
color %背景颜色%%文字颜色%
cls
echo.───────────────────────────────────────
echo.
echo.                      在下一步之前，您需要阅读这些信息。
echo.
echo.                              请按 空格 向下翻
echo.───────────────────────────────────────
pause>nul
more "%条款文本%"
echo.───────────────────────────────────────
echo.键入数字编号并回车：      [回车]已阅读       [0]取消

set next=
set /p next=
if "%next%"=="0" goto :eof
goto :设置安装路径

:设置安装路径

::检测已存在版本
if exist "%注册表_InstallDir%\JSetupinfo\Info.jsi" for /f "eol=: tokens=1,2 delims=;" %%a in ('type "%注册表_InstallDir%\JSetupinfo\Info.jsi"') do (
  if "%%a"=="软件版本" set 旧软件版本=%%b
  if "%%a"=="软件位数" set 旧软件位数=%%b
  if "%软件位数%"=="32 64" set UI_旧软件位数=32/64bit
  if "%软件位数%"=="32" set UI_旧软件位数=32bit
  if "%软件位数%"=="64" set UI_旧软件位数=64bit
  )

if not exist "%注册表_InstallDir%\JSetupinfo\Info.jsi" for /f "eol=: tokens=1,2 delims=;" %%a in ('type "%安装文件夹%\JSetupinfo\Info.jsi"') do (
  if "%%a"=="软件版本" set 旧软件版本=%%b
  if "%%a"=="软件位数" set 旧软件位数=%%b
  if "%软件位数%"=="32 64" set UI_旧软件位数=32/64bit
  if "%软件位数%"=="32" set UI_旧软件位数=32bit
  if "%软件位数%"=="64" set UI_旧软件位数=64bit
  )

mode 81,25
color %背景颜色%%文字颜色%
cls
echo.
echo.
echo.    %软件名% 正准备安装 ... 
echo.
echo.───────────────────────────────────────
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.             ____________________________________________________
if not defined 安装路径锁定 echo.             [1] 安装路径：%安装路径%
if defined 安装路径锁定     echo.                 安装路径：%安装路径%
echo.             ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
echo.                    -应用信息: Ver. %软件版本% %UI_软件位数%
if defined 旧软件版本 (echo.                    -旧应用:   Ver. %旧软件版本% %UI_旧软件位数%)
echo.
if defined 条款文本 (echo.                    -在继续安装前，我确认已阅读这些[2]信息。&echo.)
echo.───────────────────────────────────────
if not defined 旧软件版本 echo.键入数字编号并回车：      [回车]开始安装     [0]取消
if defined 旧软件版本     echo.键入数字编号并回车：      [回车]开始更新     [0]取消

set next=
set /p next=
if "%next%"=="0" goto :eof
if "%next%"==""  goto :setup
if "%next%"=="1" if not defined 安装路径锁定 goto :setother
if "%next%"=="2" goto :阅读条款显示

goto :设置安装路径

:setother
set next=
set /p next=路径:
if not defined next goto :设置安装路径

set 安装路径=%next:"=%
if "%安装路径:~-1%"=="\" set 安装路径=%安装路径:~0,-1%
goto :设置安装路径

:setup
mode 81,25
color %背景颜色%%文字颜色%
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                               正在卸载您的旧应用...

set 安装文件夹=%安装路径:"=%

::删除旧应用
if exist "%注册表_InstallDir%\JSetupinfo\卸载2.bat" start "" /i /min /wait cmd /c "%注册表_InstallDir%\JSetupinfo\卸载2.bat" -y
if exist "%安装文件夹%\JSetupinfo\卸载2.bat"        start "" /i /min /wait cmd /c "%安装文件夹%\JSetupinfo\卸载2.bat" -y

::删除已存在文件
del /q /f /s "%安装文件夹%\*.*" >nul 2>nul
rd /q /s "%安装文件夹%" >nul 2>nul

mode 81,25
color %背景颜色%%文字颜色%
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                               正在安装您的应用...

::创建文件夹
md "%安装文件夹%" >nul

::复制文件
xcopy "." "%安装文件夹%\" /e /v /q /y >nul

::创建快捷方式(vbs)
if "%快捷1_开关%"=="y" set jsnum=1&call :创建快捷方式
if "%快捷2_开关%"=="y" set jsnum=2&call :创建快捷方式
if "%快捷3_开关%"=="y" set jsnum=3&call :创建快捷方式

::写入注册表（可选）
reg add HKEY_LOCAL_MACHINE\SOFTWARE\%公司名%\%软件名% /v InstallDir /t REG_SZ /d "%安装文件夹%" /f>nul

::安装时运行（可选）
if defined 安装时运行 (start "" "%安装文件夹%\%安装时运行%")

:finish
mode 81,25
color %背景颜色%%文字颜色%
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                                 应用准备就绪！
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

if defined 安装后打开 (call :立即运行) else (set 立即运行=2)
if defined 新特征文件 (call :查看新特征) else (set 查看新特征=2)

if "%立即运行%"=="" (start "" "%安装文件夹%\%安装后打开%")
if "%查看新特征%"=="" (start "" "%安装文件夹%\%新特征文件%")

exit
::------------------------------------------------------------------

:立即运行
if defined 安装后打开强制 (set 立即运行=&goto :eof)
set 立即运行=
set /p 立即运行=                 -- [回车]立即运行   [空格并回车]稍后
if "%立即运行%"=="" goto :eof
if not "%立即运行%"=="" goto :eof
goto :立即运行

:查看新特征
set 查看新特征=
set /p 查看新特征=               -- [回车]查看版本新特征   [空格并回车]稍后
if "%查看新特征%"=="" goto :eof
if not "%查看新特征%"=="" goto :eof
goto :查看新特征

:创建快捷方式
echo.!快捷%jsnum%_位置!|find "Desktop">nul&&   set Do_快捷_位置=Desktop&call :创建快捷方式-go
echo.!快捷%jsnum%_位置!|find "StartMenu">nul&& set Do_快捷_位置=StartMenu&call :创建快捷方式-go
echo.!快捷%jsnum%_位置!|find "StartUp">nul&&   set Do_快捷_位置=StartUp&call :创建快捷方式-go

goto :eof

:创建快捷方式-go
md "%temp%\JSetup\" >nul 2>nul

1>%temp%\JSetup\ink.vbs  echo Set WshShell = WScript.CreateObject("WScript.Shell")
1>>%temp%\JSetup\ink.vbs echo Str = WshShell.SpecialFolders("%Do_快捷_位置%")
1>>%temp%\JSetup\ink.vbs echo Set Ink = WshShell.CreateShortcut(Str ^& "\!快捷%jsnum%_名称!.lnk")
1>>%temp%\JSetup\ink.vbs echo Ink.TargetPath = "%安装文件夹%\!快捷%jsnum%_目标!"
1>>%temp%\JSetup\ink.vbs echo Ink.Arguments = "!快捷%jsnum%_参数!"
1>>%temp%\JSetup\ink.vbs echo Ink.WindowStyle = "!快捷%jsnum%_窗口!"
1>>%temp%\JSetup\ink.vbs echo Ink.IconLocation = "%安装文件夹%\!快捷%jsnum%_图标!"
1>>%temp%\JSetup\ink.vbs echo Ink.Description = "!快捷%jsnum%_描述!"
1>>%temp%\JSetup\ink.vbs echo Ink.WorkingDirectory = Str
1>>%temp%\JSetup\ink.vbs echo Ink.Save
wscript -e:vbs "%temp%\JSetup\ink.vbs"
del /q /f /s "%temp%\JSetup\ink.vbs" >nul 2>nul
goto :eof


