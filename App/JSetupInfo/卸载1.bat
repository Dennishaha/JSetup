@echo off
cd /d %~dp0..

::��ȡж����Ϣ
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b

::���ñ���
title ж�� %��˾��% %�����% %����汾% %���λ��%

::������
if "%~1"=="-y" goto :���������װ����

:��ʾ�ı�����ѡ��
if defined ж��ǰ�ı� mode 80,25&type "%ж��ǰ�ı�%"&pause>nul

:info
mode 50,10
color 0e
cls
echo.
echo.
echo.
echo.           ��ж�� %�����% Ӧ�ü��������Ϣ��
echo.
echo.
echo.                 [y]ж��     [n]��

set next=
set /p next=
if /i "%next%"=="y" goto :���������װ����
if /i "%next%"=="n" exit
goto :info

:���������װ����
ver|find " 5.2.">nul&&(goto :unuac)
ver|find " 5.1.">nul&&(goto :unuac)
ver|find " 5.0.">nul&&(goto :unuac)
goto :uac

:unuac
start "" /b /i cmd /v:on /c "%~dp0ж��2.bat"
Exit

:uac
if "%���λ��%"=="32"             JSetupInfo\nircmdc.exe elevate cmd /v:on /c "%~dp0ж��2.bat"&exit
if not exist "%windir%\SysWoW64\" JSetupInfo\nircmdc.exe elevate cmd /v:on /c "%~dp0ж��2.bat"
if exist "%windir%\SysWoW64\"     JSetupInfo\nircmdc64.exe elevate cmd /v:on /c "%~dp0ж��2.bat"
Exit
