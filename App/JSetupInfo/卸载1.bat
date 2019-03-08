@echo off
cd /d %~dp0..

::读取卸载信息
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b

::设置标题
title 卸载 %公司名% %软件名% %软件版本% %软件位数%

::被调用
if "%~1"=="-y" goto :启动解除安装程序

:显示文本（可选）
if defined 卸载前文本 mode 80,25&type "%卸载前文本%"&pause>nul

:info
mode 50,10
color 0e
cls
echo.
echo.
echo.
echo.           将卸载 %软件名% 应用及其相关信息。
echo.
echo.
echo.                 [y]卸载     [n]否

set next=
set /p next=
if /i "%next%"=="y" goto :启动解除安装程序
if /i "%next%"=="n" exit
goto :info

:启动解除安装程序
ver|find " 5.2.">nul&&(goto :unuac)
ver|find " 5.1.">nul&&(goto :unuac)
ver|find " 5.0.">nul&&(goto :unuac)
goto :uac

:unuac
start "" /b /i cmd /v:on /c "%~dp0卸载2.bat"
Exit

:uac
if "%软件位数%"=="32"             JSetupInfo\nircmdc.exe elevate cmd /v:on /c "%~dp0卸载2.bat"&exit
if not exist "%windir%\SysWoW64\" JSetupInfo\nircmdc.exe elevate cmd /v:on /c "%~dp0卸载2.bat"
if exist "%windir%\SysWoW64\"     JSetupInfo\nircmdc64.exe elevate cmd /v:on /c "%~dp0卸载2.bat"
Exit
