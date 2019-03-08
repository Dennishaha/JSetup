@echo off
cd /d %~dp0..

::运行时需要启用延迟变量

::读取卸载信息
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b

::读取系统文件夹
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop') do set 注册表_Dir_Desktop=%%c
for /f "delims=" %%a in ('echo.%注册表_Dir_Desktop%') do set 注册表_Dir_Desktop=%%a
for /f "skip=2 tokens=1,2,3,*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu"') do set 注册表_Dir_Start Menu=%%d
for /f "delims=" %%a in ('echo.%注册表_Dir_Start Menu%') do set 注册表_Dir_Start Menu=%%a
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Startup') do set 注册表_Dir_Startup=%%c
for /f "delims=" %%a in ('echo.%注册表_Dir_Startup%') do set 注册表_Dir_Startup=%%a

::设置标题
title 

:info
mode 50,10
color 0b
cls
echo.
echo.
echo.
echo.             正在卸载您的应用...
echo.
echo.
echo.

:卸载
if "%快捷1_开关%"=="y" set jsnum=1&call :删除快捷方式
if "%快捷2_开关%"=="y" set jsnum=2&call :删除快捷方式
if "%快捷3_开关%"=="y" set jsnum=3&call :删除快捷方式

if defined 卸载后运行 (start "" "%卸载后运行%")
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\%公司名%\%软件名% /va /f

del /q/f/s ".\*" >nul&rd /q /s "." >nul
goto :eof

::-------------------------------------------------------------------
:删除快捷方式

echo.!快捷%jsnum%_位置!|find "Desktop">nul&&   (if exist "%注册表_Dir_Desktop%\!快捷%jsnum%_名称!.lnk"    del /q /f /s "%注册表_Dir_Desktop%\!快捷%jsnum%_名称!.lnk">nul)
echo.!快捷%jsnum%_位置!|find "StartMenu">nul&& (if exist "%注册表_Dir_Start Menu%\!快捷%jsnum%_名称!.lnk" del /q /f /s "%注册表_Dir_Start Menu%\!快捷%jsnum%_名称!.lnk">nul)
echo.!快捷%jsnum%_位置!|find "StartUp">nul&&   (if exist "%注册表_Dir_StartUp%\!快捷%jsnum%_名称!.lnk"    del /q /f /s "%注册表_Dir_StartUp%\!快捷%jsnum%_名称!.lnk">nul)
goto :eof


