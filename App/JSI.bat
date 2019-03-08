@echo off
cd %~dp0

if /i "%~1"=="-read" call :read

if /i "%~1"=="-save" call :save
if /i "%~1"=="-othersave" call :othersave
if /i "%~1"=="-setupout" call :setupout

if /i "%~1"=="" echo.抱歉，不要单独开启...&pause>nul
goto :eof

:save
if not exist "%InfoFile%" (goto :outinfo2)

set JsiOut=%InfoFile%
call :go
echo.已经保存好了！
pause>nul
goto :eof

:othersave
set random1=%random%
md "%temp%\%random1%\"
set JsiOut=%temp%\%random1%\%软件名%%软件版本%_%软件位数%Info.jsi

call :go
start "" "%temp%\%random1%\"
goto :eof

:setupout
set JsiOut=%临时文件夹%\JSetupInfo\Info.jsi
call :go
goto :eof

:go
set JSIver=jsi3

1>"%JsiOut%"  echo ::JSetup %JSIver%
1>>"%JsiOut%" echo 公司名;%公司名%
1>>"%JsiOut%" echo 软件名;%软件名%
1>>"%JsiOut%" echo 软件版本;%软件版本%
1>>"%JsiOut%" echo 默认安装路径;%默认安装路径%
1>>"%JsiOut%" echo 默认安装路径锁定;%默认安装路径锁定%

1>>"%JsiOut%" echo 快捷1_开关;%快捷1_开关%
1>>"%JsiOut%" echo 快捷1_位置;%快捷1_位置%
1>>"%JsiOut%" echo 快捷1_名称;%快捷1_名称%
1>>"%JsiOut%" echo 快捷1_目标;%快捷1_目标%
1>>"%JsiOut%" echo 快捷1_参数;%快捷1_参数%
1>>"%JsiOut%" echo 快捷1_图标;%快捷1_图标%
1>>"%JsiOut%" echo 快捷1_窗口;%快捷1_窗口%
1>>"%JsiOut%" echo 快捷1_描述;%快捷1_描述%

1>>"%JsiOut%" echo 快捷2_开关;%快捷2_开关%
1>>"%JsiOut%" echo 快捷2_位置;%快捷2_位置%
1>>"%JsiOut%" echo 快捷2_名称;%快捷2_名称%
1>>"%JsiOut%" echo 快捷2_目标;%快捷2_目标%
1>>"%JsiOut%" echo 快捷2_参数;%快捷2_参数%
1>>"%JsiOut%" echo 快捷2_图标;%快捷2_图标%
1>>"%JsiOut%" echo 快捷2_窗口;%快捷2_窗口%
1>>"%JsiOut%" echo 快捷2_描述;%快捷2_描述%

1>>"%JsiOut%" echo 快捷3_开关;%快捷3_开关%
1>>"%JsiOut%" echo 快捷3_位置;%快捷3_位置%
1>>"%JsiOut%" echo 快捷3_名称;%快捷3_名称%
1>>"%JsiOut%" echo 快捷3_目标;%快捷3_目标%
1>>"%JsiOut%" echo 快捷3_参数;%快捷3_参数%
1>>"%JsiOut%" echo 快捷3_图标;%快捷3_图标%
1>>"%JsiOut%" echo 快捷3_窗口;%快捷3_窗口%
1>>"%JsiOut%" echo 快捷3_描述;%快捷3_描述%

1>>"%JsiOut%" echo 软件位数;%软件位数%
1>>"%JsiOut%" echo 支持位数;%支持位数%
1>>"%JsiOut%" echo 系统支持_win10;%系统支持_win10%
1>>"%JsiOut%" echo 系统支持_win8.1;%系统支持_win8.1%
1>>"%JsiOut%" echo 系统支持_win8;%系统支持_win8%
1>>"%JsiOut%" echo 系统支持_win7;%系统支持_win7%
1>>"%JsiOut%" echo 系统支持_winvista;%系统支持_winvista%
1>>"%JsiOut%" echo 系统支持_win2003;%系统支持_win2003%
1>>"%JsiOut%" echo 系统支持_winxp;%系统支持_winxp%

1>>"%JsiOut%" echo 条款文本;%条款文本%
1>>"%JsiOut%" echo 条款显示;%条款显示%
1>>"%JsiOut%" echo 安装时运行;%安装时运行%
1>>"%JsiOut%" echo 新特征文件;%新特征文件%
1>>"%JsiOut%" echo 安装后打开;%安装后打开%
1>>"%JsiOut%" echo 安装后打开强制;%安装后打开强制%
1>>"%JsiOut%" echo 卸载前文本;%卸载前文本%
1>>"%JsiOut%" echo 卸载后打开;%卸载后打开%
1>>"%JsiOut%" echo 卸载后打开强制;%卸载后打开强制%

1>>"%JsiOut%" echo 背景颜色;%背景颜色%
1>>"%JsiOut%" echo 文字颜色;%文字颜色%
1>>"%JsiOut%" echo 安装窗口标题;%安装窗口标题%

1>>"%JsiOut%" echo 源文件夹;%源文件夹%
1>>"%JsiOut%" echo 压缩级别;%压缩级别%
1>>"%JsiOut%" echo 压缩版本;%压缩版本%
1>>"%JsiOut%" echo 压缩锁定;%压缩锁定%
1>>"%JsiOut%" echo 压缩64bit;%压缩64bit%

goto :eof


:read

set InfoFile=%InfoFile:"=%
if not exist "%InfoFile%" cls&echo.没有找到 %InfoFile% &pause>nul&Exit

1>"%appdata%\JFsoft\JSetup\Latest.txt" echo %InfoFile%

::jsi3
for /f "tokens=1 tokens=1,* delims=::JSetup " %%a in ('type "%InfoFile%"') do if "%%a"=="jsi3" (
  for /f "eol=: tokens=1,* delims=;" %%a in ('type "%InfoFile%"') do (set %%a=%%b)
  goto :eof
  )

::ver2 (1.0.2)
for /f "tokens=1 tokens=1,* delims=::JSetup " %%a in ('type "%InfoFile%"') do if "%%a"=="1.0.2" (
  for /f "eol=: tokens=1,* delims=;" %%a in ('type "%InfoFile%"') do (set %%a=%%b)
  echo.由于API的变更，ver2版本“快捷方式”信息需要重新补充...&pause
  goto :eof
  )

::ver1 (1.0.1)
for /f "tokens=1 delims=::[JSetup " %%a in ('type "%InfoFile%"') do (
  if "%%a"=="1.0.1]" echo.注意：后缀为 .bat 的 JSetup工程文件由于不安全，已不受支持，请使用JSetup1.0.5及更早的版本打开。&pause&goto :eof
  )

:notver
cls&echo.该文件不受支持或已损坏，请重新生成。&pause>nul&Exit