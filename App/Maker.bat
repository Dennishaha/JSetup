@echo off
cd %~dp0

mode 61,22
color %JS_������ɫ%%JS_������ɫ%
cls
echo.
echo.  ����������װ���У����Ժ�...                  Ctrl+C.��ͣ
echo.������������������������������������������������������������
echo.
echo. ǰ��׼��..

::�����Ϣ������

for %%a in (
��˾�� ����� ����汾 Ĭ�ϰ�װ·�� ���1_���� Դ�ļ��� ѹ������ ѹ���汾 ѹ������
) do if not defined %%a echo.&echo.--�����%%a����Ϣ���������벹�䣡&pause>nul&goto :eof

if "%���1_����%"=="y" for %%a in (
���1_���� ���1_Ŀ�� ���1_����
) do if not defined %%a echo.&echo.--�����%%a����Ϣ���������벹�䣡&pause>nul&goto :eof

if "%���2_����%"=="y" for %%a in (
���2_���� ���2_Ŀ�� ���2_����
) do if not defined %%a echo.&echo.--�����%%a����Ϣ���������벹�䣡&pause>nul&goto :eof

if "%���3_����%"=="y" for %%a in (
���3_���� ���3_Ŀ�� ���3_����
) do if not defined %%a echo.&echo.--�����%%a����Ϣ���������벹�䣡&pause>nul&goto :eof

if not exist "%Դ�ļ���%" echo. --Դ�ļ��в����ڣ�&pause&goto :eof
if exist "%Դ�ļ���%\JSetupInfo" echo. --Դ���ļ������С�JSetupInfo���ļ��У�&pause&goto :eof

::����Ԥ��ֵ

if "%ѹ������%"=="y" (set -k=-k) else (set -k=)

if "%processor_architecture%"=="x86" set ѹ������=Rar32.exe
if "%processor_architecture%"=="AMD64" set ѹ������=Rar64.exe

set ��ʱ�ļ���=%Դ�ļ���%out
set �����װ��=%��ʱ�ļ���%\..\%�����%%����汾%��װ��_%���λ��%.exe

set �Խ�ѹģ��=Default32.sfx
if "%֧��λ��%"=="64" if "%ѹ��64bit%"=="y" set �Խ�ѹģ��=Default64.sfx

echo. ɾ���ɰ�װ��...

del /q /f /s "%�����װ��%">nul 2>nul

echo. ������ʱ�ļ���...

md "%��ʱ�ļ���%">nul
md "%��ʱ�ļ���%\JSetupInfo">nul

echo. �����װ��Ϣ...
call JSI.bat -setupout

copy /v /y "UI\��װ2.txt" "%��ʱ�ļ���%\JSetupInfo\��װ2.bat">nul
copy /v /y "UI\��װ1.txt" "%��ʱ�ļ���%\JSetupInfo\��װ1.bat">nul
copy /v /y "UI\ж��2.txt" "%��ʱ�ļ���%\JSetupInfo\ж��2.bat">nul
copy /v /y "UI\ж��1.txt" "%��ʱ�ļ���%\JSetupInfo\ж��1.bat">nul

if "%֧��λ��%"=="32 64" (
  copy /v /y Tool\nircmdc.exe "%��ʱ�ļ���%\JSetupInfo\">nul
  copy /v /y Tool\nircmdc64.exe "%��ʱ�ļ���%\JSetupInfo\">nul
  )
if /i "%֧��λ��%"=="32" copy /v /y Tool\nircmdc.exe "%��ʱ�ļ���%\JSetupInfo\">nul
if /i "%֧��λ��%"=="64" copy /v /y Tool\nircmdc64.exe "%��ʱ�ļ���%\JSetupInfo\">nul

echo. ����Դ�ļ�...

xcopy "%Դ�ļ���%" "%��ʱ�ļ���%\" /e /v /q /y>nul 

echo. ѹ����װ��...

Tool\%ѹ������% a -w%temp% -sfxTool\%�Խ�ѹģ��% -icon"%��ʱ�ļ���%\%���1_ͼ��%" -s -m%ѹ������% -ma%ѹ���汾% -ep1 -r -y -idq "%�����װ��%" "%��ʱ�ļ���%\*"
Tool\%ѹ������% c -w%temp% -zUI\ѹ��ע��.txt %-k% -y -idq "%�����װ��%"

echo. ɾ����ʱ�ļ�...

del /q /f /s "%��ʱ�ļ���%\*">nul
rd /q /s "%��ʱ�ļ���%">nul

:�������
echo. ��װ��������ɡ�
echo.
echo.������������������������������������������������������������
echo.����ļ�·��: 
echo.%�����װ��%
echo.
echo.      - Ҫ����������Ӧ����  [�س�]�� [�ո�]����

set next=
set /p next=
if "%next%"==" " start "" "%�����װ��%"

goto :eof