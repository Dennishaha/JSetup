@echo off
cd /d %~dp0

::Ԥ��ֵ
color f0
mode 61,21
set JSver=1.0.8
set mainbat=%~0
set temp=%temp%\JFsoft\JSetup
title 

::������Ϣ
if not exist "%temp%" md "%temp%"
if not exist "%appdata%\JFsoft\JSetup\" md "%appdata%\JFsoft\JSetup\"

::��ȡ����ļ�
if exist "%appdata%\JFsoft\JSetup\Latest.txt" for /f "delims=" %%a in ('type "%appdata%\JFsoft\JSetup\Latest.txt"') do set LatestInfoFile=%%a

::��ȡ�Ӿ�����
call Tool\VisionSet.bat -readset

::������
if exist %1 (set InfoFile="%~1"&call JSI.bat -read&call Editor.bat)

:menu
if not exist "%LatestInfoFile%" set LatestInfoFile=���ޣ�
cd %~dp0
mode 61,21
color %JS_������ɫ%%JS_������ɫ%
cls
echo.        ��
echo. �� [0] �� JFsoft Setup tool                          %JSver%
echo.���������ة�������������������������������������������������
echo.
echo.              JSetup������������ר�������װ����
echo.
echo.                      [1] �����¹���  
echo.
echo.                      [2] ��ȡ�������               ��[21] 
echo.                           ��%LatestInfoFile:~-26%
echo.
echo.                      [3] ��ȡ��������
echo.
echo.                      [4] �߼�ѡ�� ^>
echo.
echo.
echo. ��������ѡ��س�...
echo.������������������������������������������������������������
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

:UIԤ��
if /i "%processor_architecture%"=="x86" if not exist "%windir%\SysWoW64\" set UI_processor_architecture=    32λģʽ
if /i "%processor_architecture%"=="x86" if exist "%windir%\SysWoW64\"     set UI_processor_architecture=32λ����ģʽ
if /i "%processor_architecture%"=="AMD64" set UI_processor_architecture=    64λģʽ

mode 61,21
color %JS_������ɫ%%JS_������ɫ%
cls
echo.        ��
echo. �� �س��� �߼�ѡ��                            %UI_processor_architecture%
echo.���������ة�������������������������������������������������
echo.
echo.                     [1] ������ʱ�ļ�
echo.
echo.             ���Ի���[2] ��Ļ��ȡģʽ
echo.                     [3] ������ɫ
echo.
echo.               ֧�֣�[4] ������Ϣ
echo.                     [5] �����¡�����
echo.                     [6] ���� JSetup
echo.
echo.                     [d] ж��(����Ա)
echo.
echo.
echo. ��������ѡ��س�...
echo.������������������������������������������������������������
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
if /i "%next%"=="d" JSetupInfo\ж��1.bat&exit
cls
goto :menu-more

:readinfo
cd %~dp0
color %JS_������ɫ%%JS_������ɫ%
cls
echo.        ��
echo. �� �س��� ��ȡ�ɹ���
echo.���������ة�������������������������������������������������
echo.
echo.
echo.
echo.        ��������������������������������������������
echo.
echo.               ������ �����ļ�(.jsi) ���ء�          
echo.
echo.        ��������������������������������������������
echo.
echo.       tip:�����԰��ļ��ϵ������ݷ�ʽ���ɴ�Ӵ��
echo.
echo.
echo.����ļ�������ڲ��س�...
echo.������������������������������������������������������������
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
