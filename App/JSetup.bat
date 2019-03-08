@echo off
cd /d %~dp0

::预设值
color f0
mode 61,21
set JSver=1.0.8
set mainbat=%~0
set temp=%temp%\JFsoft\JSetup
title 

::配置信息
if not exist "%temp%" md "%temp%"
if not exist "%appdata%\JFsoft\JSetup\" md "%appdata%\JFsoft\JSetup\"

::读取最近文件
if exist "%appdata%\JFsoft\JSetup\Latest.txt" for /f "delims=" %%a in ('type "%appdata%\JFsoft\JSetup\Latest.txt"') do set LatestInfoFile=%%a

::读取视觉配置
call Tool\VisionSet.bat -readset

::被调用
if exist %1 (set InfoFile="%~1"&call JSI.bat -read&call Editor.bat)

:menu
if not exist "%LatestInfoFile%" set LatestInfoFile=（无）
cd %~dp0
mode 61,21
color %JS_背景颜色%%JS_文字颜色%
cls
echo.        │
echo. ← [0] │ JFsoft Setup tool                          %JSver%
echo.────┴─────────────────────────
echo.
echo.              JSetup，订制作您的专属软件安装包！
echo.
echo.                      [1] 开设新工程  
echo.
echo.                      [2] 读取最近工程               ×[21] 
echo.                           └%LatestInfoFile:~-26%
echo.
echo.                      [3] 读取其他工程
echo.
echo.                      [4] 高级选项 ^>
echo.
echo.
echo. 键入数字选项并回车...
echo.──────────────────────────────
set next=
set /p next=
if "%next%"=="0" goto :eof
if "%next%"=="1" call Editor.bat -new
if "%next%"=="2" if exist "%LatestInfoFile%" (call :readinfo1)
if "%next%"=="21" del /q /f /s "%appdata%\JFsoft\JSetup\Latest.txt"
if "%next%"=="3" call :readinfo
if "%next%"=="4" goto :menu-more

cls
start /b /i cmd /c "%~0"&exit

:menu-more
cd %~dp0

:UI预设
if /i "%processor_architecture%"=="x86" if not exist "%windir%\SysWoW64\" set UI_processor_architecture=    32位模式
if /i "%processor_architecture%"=="x86" if exist "%windir%\SysWoW64\"     set UI_processor_architecture=32位兼容模式
if /i "%processor_architecture%"=="AMD64" set UI_processor_architecture=    64位模式

mode 61,21
color %JS_背景颜色%%JS_文字颜色%
cls
echo.        │
echo. ← 回车│ 高级选项                            %UI_processor_architecture%
echo.────┴─────────────────────────
echo.
echo.                     [1] 清理临时文件
echo.
echo.             个性化：[2] 屏幕拉取模式
echo.                     [3] 窗口配色
echo.
echo.               支持：[4] 帮助信息
echo.                     [5] 检查更新、反馈
echo.                     [6] 关于 JSetup
echo.
echo.                     [d] 卸载(管理员)
echo.
echo.
echo. 键入数字选项并回车...
echo.──────────────────────────────
set next=
set /p next=
if "%next%"=="" goto :menu
if "%next%"=="0" goto :menu
if "%next%"=="1" del /q /f /s "%temp%" >nul 2>nul&rd /q /s "%temp%" >nul 2>nul&md "%temp%"
if "%next%"=="2" call Tool/EditSetting.bat
if "%next%"=="3" call Tool\VisionSet.bat
if "%next%"=="4" mode 80,25&color f0&cls&more Tool\Help.txt&pause
if "%next%"=="5" start iexplore "http://www.jfapp.net/jsetup"
if "%next%"=="6" mode 80,25&color f0&cls&more Tool\About.txt&pause
if /i "%next%"=="d" JSetupInfo\卸载1.bat&exit
cls
goto :menu-more

:readinfo
cd %~dp0
color %JS_背景颜色%%JS_文字颜色%
cls
echo.        │
echo. ← 回车│ 读取旧工程
echo.────┴─────────────────────────
echo.
echo.
echo.
echo.        ━━━━━━━━━━━━━━━━━━━━━━
echo.
echo.               请拖入 工程文件(.jsi) 加载。          
echo.
echo.        ━━━━━━━━━━━━━━━━━━━━━━
echo.
echo.       tip:还可以把文件拖到程序快捷方式即可打开哟！
echo.
echo.
echo.请把文件拖入框内并回车...
echo.──────────────────────────────
set InfoFile=
set /p InfoFile=
cls
if defined PageFile set PageFile=%PageFile:"=%
if "%PageFile%"==""  goto :eof
if "%PageFile%"=="0" goto :eof

:readinfo1
if defined LatestInfoFile if not defined InfoFile set InfoFile=%LatestInfoFile:"=%
call JSI.bat -read
call Editor.bat
goto :eof
