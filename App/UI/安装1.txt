@echo off
cd /d %~dp0..

::读取安装信息
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b
set 默认安装路径=%programfiles%\%默认安装路径

:info
mode 81,25
color %背景颜色%8
title 
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
echo.
echo.
echo.                               正在准备...

:安装环境判断
if "%系统支持_win10%"==""    ver|find " 10.0.">nul&&(cls&echo.抱歉，应用不支持 Windows 10&pause&exit)
if "%系统支持_win8.1%"==""   ver|find " 6.3.">nul&&(cls&echo.抱歉，应用不支持 Windows 8.1 \ Server 2012 R2&pause&exit)
if "%系统支持_win8%"==""     ver|find " 6.2.">nul&&(cls&echo.抱歉，应用不支持 Windows 8 \ Server 2012&pause&exit)
if "%系统支持_win7%"==""     ver|find " 6.1.">nul&&(cls&echo.抱歉，应用不支持 Windows 7 \ Server 2008 R2&pause&exit)
if "%系统支持_winvista%"=="" ver|find " 6.0.">nul&&(cls&echo.抱歉，应用不支持 Windows Vista \ Server 2008&pause&exit)
if "%系统支持_win2003%"==""  ver|find " 5.2.">nul&&(cls&echo.抱歉，应用不支持 Windows Server 2003&pause&exit)
if "%系统支持_winxp%"==""    ver|find " 5.1.">nul&&(cls&echo.抱歉，应用不支持 Windows Xp&pause&exit)

if "%支持位数%"=="64" if not exist "%windir%\SysWoW64\" cls&echo.抱歉，应用不支持基于 32bit 的系统&pause&exit
if "%支持位数%"=="32" if exist "%windir%\SysWoW64\"     cls&echo.抱歉，应用不支持基于 64bit 的系统&pause&exit

:启动安装程序
ver|find " 5.2.">nul&&(goto :unuac)
ver|find " 5.1.">nul&&(goto :unuac)
ver|find " 5.0.">nul&&(goto :unuac)
goto :uac

:unuac
start "" /b /i cmd /v:on /c "%~dp0安装2.bat"
Exit

:uac
if "%软件位数%"=="32"             JSetupInfo\nircmdc.exe elevate cmd /v:on /c "%~dp0安装2.bat"&exit
if not exist "%windir%\SysWoW64\" JSetupInfo\nircmdc.exe elevate cmd /v:on /c "%~dp0安装2.bat"
if exist "%windir%\SysWoW64\"     JSetupInfo\nircmdc64.exe elevate cmd /v:on /c "%~dp0安装2.bat"
Exit
