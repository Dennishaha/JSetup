@echo off
cd /d %~dp0..

::����ʱ��Ҫ�����ӳٱ���

::��ȡж����Ϣ
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b

::��ȡϵͳ�ļ���
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop') do set ע���_Dir_Desktop=%%c
for /f "delims=" %%a in ('echo.%ע���_Dir_Desktop%') do set ע���_Dir_Desktop=%%a
for /f "skip=2 tokens=1,2,3,*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu"') do set ע���_Dir_Start Menu=%%d
for /f "delims=" %%a in ('echo.%ע���_Dir_Start Menu%') do set ע���_Dir_Start Menu=%%a
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Startup') do set ע���_Dir_Startup=%%c
for /f "delims=" %%a in ('echo.%ע���_Dir_Startup%') do set ע���_Dir_Startup=%%a

::���ñ���
title 

:info
mode 50,10
color 0b
cls
echo.
echo.
echo.
echo.             ����ж������Ӧ��...
echo.
echo.
echo.

:ж��
if "%���1_����%"=="y" set jsnum=1&call :ɾ����ݷ�ʽ
if "%���2_����%"=="y" set jsnum=2&call :ɾ����ݷ�ʽ
if "%���3_����%"=="y" set jsnum=3&call :ɾ����ݷ�ʽ

if defined ж�غ����� (start "" "%ж�غ�����%")
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\%��˾��%\%�����% /va /f

del /q/f/s ".\*" >nul&rd /q /s "." >nul
goto :eof

::-------------------------------------------------------------------
:ɾ����ݷ�ʽ

echo.!���%jsnum%_λ��!|find "Desktop">nul&&   (if exist "%ע���_Dir_Desktop%\!���%jsnum%_����!.lnk"    del /q /f /s "%ע���_Dir_Desktop%\!���%jsnum%_����!.lnk">nul)
echo.!���%jsnum%_λ��!|find "StartMenu">nul&& (if exist "%ע���_Dir_Start Menu%\!���%jsnum%_����!.lnk" del /q /f /s "%ע���_Dir_Start Menu%\!���%jsnum%_����!.lnk">nul)
echo.!���%jsnum%_λ��!|find "StartUp">nul&&   (if exist "%ע���_Dir_StartUp%\!���%jsnum%_����!.lnk"    del /q /f /s "%ע���_Dir_StartUp%\!���%jsnum%_����!.lnk">nul)
goto :eof


