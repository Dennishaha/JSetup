@echo off
cd /d %~dp0..

::����ʱ��Ҫ�����ӳٱ���

::��ȡ��װ��Ϣ
for /f "eol=: tokens=1,2 delims=;" %%a in ('type "JSetupinfo\Info.jsi"') do set %%a=%%b
set ��װ·��=%programfiles%\%Ĭ�ϰ�װ·��%

::��ȡע���-�Ѱ�װӦ��·��
for /f "skip=2 tokens=1,2,*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\%��˾��%\%�����%"') do set ע���_%%a=%%c>nul
if exist "%ע���_InstallDir%" set ע���_InstallDir=%ע���_InstallDir:"=%&set ��װ·��=%ע���_InstallDir%

:����
if "%���λ��%"=="32 64" set UI_���λ��=
if "%���λ��%"=="32" set UI_���λ��=32bit
if "%���λ��%"=="64" set UI_���λ��=64bit
if "%��װ���ڱ���%"=="" title ��װ %��˾��% %�����% %����汾% %UI_���λ��%
if not "%��װ���ڱ���%"=="" title %��װ���ڱ���%

:�Ķ�����
if not defined �����ı� goto :���ð�װ·��
if defined ������ʾ     goto :�Ķ�������ʾ
if not defined ������ʾ goto :���ð�װ·��

:�Ķ�������ʾ
mode 81,25
color %������ɫ%%������ɫ%
cls
echo.������������������������������������������������������������������������������
echo.
echo.                      ����һ��֮ǰ������Ҫ�Ķ���Щ��Ϣ��
echo.
echo.                              �밴 �ո� ���·�
echo.������������������������������������������������������������������������������
pause>nul
more "%�����ı�%"
echo.������������������������������������������������������������������������������
echo.�������ֱ�Ų��س���      [�س�]���Ķ�       [0]ȡ��

set next=
set /p next=
if "%next%"=="0" goto :eof
goto :���ð�װ·��

:���ð�װ·��

::����Ѵ��ڰ汾
if exist "%ע���_InstallDir%\JSetupinfo\Info.jsi" for /f "eol=: tokens=1,2 delims=;" %%a in ('type "%ע���_InstallDir%\JSetupinfo\Info.jsi"') do (
  if "%%a"=="����汾" set ������汾=%%b
  if "%%a"=="���λ��" set �����λ��=%%b
  if "%���λ��%"=="32 64" set UI_�����λ��=32/64bit
  if "%���λ��%"=="32" set UI_�����λ��=32bit
  if "%���λ��%"=="64" set UI_�����λ��=64bit
  )

if not exist "%ע���_InstallDir%\JSetupinfo\Info.jsi" for /f "eol=: tokens=1,2 delims=;" %%a in ('type "%��װ�ļ���%\JSetupinfo\Info.jsi"') do (
  if "%%a"=="����汾" set ������汾=%%b
  if "%%a"=="���λ��" set �����λ��=%%b
  if "%���λ��%"=="32 64" set UI_�����λ��=32/64bit
  if "%���λ��%"=="32" set UI_�����λ��=32bit
  if "%���λ��%"=="64" set UI_�����λ��=64bit
  )

mode 81,25
color %������ɫ%%������ɫ%
cls
echo.
echo.
echo.    %�����% ��׼����װ ... 
echo.
echo.������������������������������������������������������������������������������
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.             ____________________________________________________
if not defined ��װ·������ echo.             [1] ��װ·����%��װ·��%
if defined ��װ·������     echo.                 ��װ·����%��װ·��%
echo.             ����������������������������������������������������
echo.                    -Ӧ����Ϣ: Ver. %����汾% %UI_���λ��%
if defined ������汾 (echo.                    -��Ӧ��:   Ver. %������汾% %UI_�����λ��%)
echo.
if defined �����ı� (echo.                    -�ڼ�����װǰ����ȷ�����Ķ���Щ[2]��Ϣ��&echo.)
echo.������������������������������������������������������������������������������
if not defined ������汾 echo.�������ֱ�Ų��س���      [�س�]��ʼ��װ     [0]ȡ��
if defined ������汾     echo.�������ֱ�Ų��س���      [�س�]��ʼ����     [0]ȡ��

set next=
set /p next=
if "%next%"=="0" goto :eof
if "%next%"==""  goto :setup
if "%next%"=="1" if not defined ��װ·������ goto :setother
if "%next%"=="2" goto :�Ķ�������ʾ

goto :���ð�װ·��

:setother
set next=
set /p next=·��:
if not defined next goto :���ð�װ·��

set ��װ·��=%next:"=%
if "%��װ·��:~-1%"=="\" set ��װ·��=%��װ·��:~0,-1%
goto :���ð�װ·��

:setup
mode 81,25
color %������ɫ%%������ɫ%
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
echo.                               ����ж�����ľ�Ӧ��...

set ��װ�ļ���=%��װ·��:"=%

::ɾ����Ӧ��
if exist "%ע���_InstallDir%\JSetupinfo\ж��2.bat" start "" /i /min /wait cmd /c "%ע���_InstallDir%\JSetupinfo\ж��2.bat" -y
if exist "%��װ�ļ���%\JSetupinfo\ж��2.bat"        start "" /i /min /wait cmd /c "%��װ�ļ���%\JSetupinfo\ж��2.bat" -y

::ɾ���Ѵ����ļ�
del /q /f /s "%��װ�ļ���%\*.*" >nul 2>nul
rd /q /s "%��װ�ļ���%" >nul 2>nul

mode 81,25
color %������ɫ%%������ɫ%
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
echo.                               ���ڰ�װ����Ӧ��...

::�����ļ���
md "%��װ�ļ���%" >nul

::�����ļ�
xcopy "." "%��װ�ļ���%\" /e /v /q /y >nul

::������ݷ�ʽ(vbs)
if "%���1_����%"=="y" set jsnum=1&call :������ݷ�ʽ
if "%���2_����%"=="y" set jsnum=2&call :������ݷ�ʽ
if "%���3_����%"=="y" set jsnum=3&call :������ݷ�ʽ

::д��ע�����ѡ��
reg add HKEY_LOCAL_MACHINE\SOFTWARE\%��˾��%\%�����% /v InstallDir /t REG_SZ /d "%��װ�ļ���%" /f>nul

::��װʱ���У���ѡ��
if defined ��װʱ���� (start "" "%��װ�ļ���%\%��װʱ����%")

:finish
mode 81,25
color %������ɫ%%������ɫ%
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
echo.                                 Ӧ��׼��������
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

if defined ��װ��� (call :��������) else (set ��������=2)
if defined �������ļ� (call :�鿴������) else (set �鿴������=2)

if "%��������%"=="" (start "" "%��װ�ļ���%\%��װ���%")
if "%�鿴������%"=="" (start "" "%��װ�ļ���%\%�������ļ�%")

exit
::------------------------------------------------------------------

:��������
if defined ��װ���ǿ�� (set ��������=&goto :eof)
set ��������=
set /p ��������=                 -- [�س�]��������   [�ո񲢻س�]�Ժ�
if "%��������%"=="" goto :eof
if not "%��������%"=="" goto :eof
goto :��������

:�鿴������
set �鿴������=
set /p �鿴������=               -- [�س�]�鿴�汾������   [�ո񲢻س�]�Ժ�
if "%�鿴������%"=="" goto :eof
if not "%�鿴������%"=="" goto :eof
goto :�鿴������

:������ݷ�ʽ
echo.!���%jsnum%_λ��!|find "Desktop">nul&&   set Do_���_λ��=Desktop&call :������ݷ�ʽ-go
echo.!���%jsnum%_λ��!|find "StartMenu">nul&& set Do_���_λ��=StartMenu&call :������ݷ�ʽ-go
echo.!���%jsnum%_λ��!|find "StartUp">nul&&   set Do_���_λ��=StartUp&call :������ݷ�ʽ-go

goto :eof

:������ݷ�ʽ-go
md "%temp%\JSetup\" >nul 2>nul

1>%temp%\JSetup\ink.vbs  echo Set WshShell = WScript.CreateObject("WScript.Shell")
1>>%temp%\JSetup\ink.vbs echo Str = WshShell.SpecialFolders("%Do_���_λ��%")
1>>%temp%\JSetup\ink.vbs echo Set Ink = WshShell.CreateShortcut(Str ^& "\!���%jsnum%_����!.lnk")
1>>%temp%\JSetup\ink.vbs echo Ink.TargetPath = "%��װ�ļ���%\!���%jsnum%_Ŀ��!"
1>>%temp%\JSetup\ink.vbs echo Ink.Arguments = "!���%jsnum%_����!"
1>>%temp%\JSetup\ink.vbs echo Ink.WindowStyle = "!���%jsnum%_����!"
1>>%temp%\JSetup\ink.vbs echo Ink.IconLocation = "%��װ�ļ���%\!���%jsnum%_ͼ��!"
1>>%temp%\JSetup\ink.vbs echo Ink.Description = "!���%jsnum%_����!"
1>>%temp%\JSetup\ink.vbs echo Ink.WorkingDirectory = Str
1>>%temp%\JSetup\ink.vbs echo Ink.Save
wscript -e:vbs "%temp%\JSetup\ink.vbs"
del /q /f /s "%temp%\JSetup\ink.vbs" >nul 2>nul
goto :eof


