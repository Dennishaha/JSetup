@echo off
cd %~dp0

if /i "%~1"=="-read" call :read

if /i "%~1"=="-save" call :save
if /i "%~1"=="-othersave" call :othersave
if /i "%~1"=="-setupout" call :setupout

if /i "%~1"=="" echo.��Ǹ����Ҫ��������...&pause>nul
goto :eof

:save
if not exist "%InfoFile%" (goto :outinfo2)

set JsiOut=%InfoFile%
call :go
echo.�Ѿ�������ˣ�
pause>nul
goto :eof

:othersave
set random1=%random%
md "%temp%\%random1%\"
set JsiOut=%temp%\%random1%\%�����%%����汾%_%���λ��%Info.jsi

call :go
start "" "%temp%\%random1%\"
goto :eof

:setupout
set JsiOut=%��ʱ�ļ���%\JSetupInfo\Info.jsi
call :go
goto :eof

:go
set JSIver=jsi3

1>"%JsiOut%"  echo ::JSetup %JSIver%
1>>"%JsiOut%" echo ��˾��;%��˾��%
1>>"%JsiOut%" echo �����;%�����%
1>>"%JsiOut%" echo ����汾;%����汾%
1>>"%JsiOut%" echo Ĭ�ϰ�װ·��;%Ĭ�ϰ�װ·��%
1>>"%JsiOut%" echo Ĭ�ϰ�װ·������;%Ĭ�ϰ�װ·������%

1>>"%JsiOut%" echo ���1_����;%���1_����%
1>>"%JsiOut%" echo ���1_λ��;%���1_λ��%
1>>"%JsiOut%" echo ���1_����;%���1_����%
1>>"%JsiOut%" echo ���1_Ŀ��;%���1_Ŀ��%
1>>"%JsiOut%" echo ���1_����;%���1_����%
1>>"%JsiOut%" echo ���1_ͼ��;%���1_ͼ��%
1>>"%JsiOut%" echo ���1_����;%���1_����%
1>>"%JsiOut%" echo ���1_����;%���1_����%

1>>"%JsiOut%" echo ���2_����;%���2_����%
1>>"%JsiOut%" echo ���2_λ��;%���2_λ��%
1>>"%JsiOut%" echo ���2_����;%���2_����%
1>>"%JsiOut%" echo ���2_Ŀ��;%���2_Ŀ��%
1>>"%JsiOut%" echo ���2_����;%���2_����%
1>>"%JsiOut%" echo ���2_ͼ��;%���2_ͼ��%
1>>"%JsiOut%" echo ���2_����;%���2_����%
1>>"%JsiOut%" echo ���2_����;%���2_����%

1>>"%JsiOut%" echo ���3_����;%���3_����%
1>>"%JsiOut%" echo ���3_λ��;%���3_λ��%
1>>"%JsiOut%" echo ���3_����;%���3_����%
1>>"%JsiOut%" echo ���3_Ŀ��;%���3_Ŀ��%
1>>"%JsiOut%" echo ���3_����;%���3_����%
1>>"%JsiOut%" echo ���3_ͼ��;%���3_ͼ��%
1>>"%JsiOut%" echo ���3_����;%���3_����%
1>>"%JsiOut%" echo ���3_����;%���3_����%

1>>"%JsiOut%" echo ���λ��;%���λ��%
1>>"%JsiOut%" echo ֧��λ��;%֧��λ��%
1>>"%JsiOut%" echo ϵͳ֧��_win10;%ϵͳ֧��_win10%
1>>"%JsiOut%" echo ϵͳ֧��_win8.1;%ϵͳ֧��_win8.1%
1>>"%JsiOut%" echo ϵͳ֧��_win8;%ϵͳ֧��_win8%
1>>"%JsiOut%" echo ϵͳ֧��_win7;%ϵͳ֧��_win7%
1>>"%JsiOut%" echo ϵͳ֧��_winvista;%ϵͳ֧��_winvista%
1>>"%JsiOut%" echo ϵͳ֧��_win2003;%ϵͳ֧��_win2003%
1>>"%JsiOut%" echo ϵͳ֧��_winxp;%ϵͳ֧��_winxp%

1>>"%JsiOut%" echo �����ı�;%�����ı�%
1>>"%JsiOut%" echo ������ʾ;%������ʾ%
1>>"%JsiOut%" echo ��װʱ����;%��װʱ����%
1>>"%JsiOut%" echo �������ļ�;%�������ļ�%
1>>"%JsiOut%" echo ��װ���;%��װ���%
1>>"%JsiOut%" echo ��װ���ǿ��;%��װ���ǿ��%
1>>"%JsiOut%" echo ж��ǰ�ı�;%ж��ǰ�ı�%
1>>"%JsiOut%" echo ж�غ��;%ж�غ��%
1>>"%JsiOut%" echo ж�غ��ǿ��;%ж�غ��ǿ��%

1>>"%JsiOut%" echo ������ɫ;%������ɫ%
1>>"%JsiOut%" echo ������ɫ;%������ɫ%
1>>"%JsiOut%" echo ��װ���ڱ���;%��װ���ڱ���%

1>>"%JsiOut%" echo Դ�ļ���;%Դ�ļ���%
1>>"%JsiOut%" echo ѹ������;%ѹ������%
1>>"%JsiOut%" echo ѹ���汾;%ѹ���汾%
1>>"%JsiOut%" echo ѹ������;%ѹ������%
1>>"%JsiOut%" echo ѹ��64bit;%ѹ��64bit%

goto :eof


:read

set InfoFile=%InfoFile:"=%
if not exist "%InfoFile%" cls&echo.û���ҵ� %InfoFile% &pause>nul&Exit

1>"%appdata%\JFsoft\JSetup\Latest.txt" echo %InfoFile%

::jsi3
for /f "tokens=1 tokens=1,* delims=::JSetup " %%a in ('type "%InfoFile%"') do if "%%a"=="jsi3" (
  for /f "eol=: tokens=1,* delims=;" %%a in ('type "%InfoFile%"') do (set %%a=%%b)
  goto :eof
  )

::ver2 (1.0.2)
for /f "tokens=1 tokens=1,* delims=::JSetup " %%a in ('type "%InfoFile%"') do if "%%a"=="1.0.2" (
  for /f "eol=: tokens=1,* delims=;" %%a in ('type "%InfoFile%"') do (set %%a=%%b)
  echo.����API�ı����ver2�汾����ݷ�ʽ����Ϣ��Ҫ���²���...&pause
  goto :eof
  )

::ver1 (1.0.1)
for /f "tokens=1 delims=::[JSetup " %%a in ('type "%InfoFile%"') do (
  if "%%a"=="1.0.1]" echo.ע�⣺��׺Ϊ .bat �� JSetup�����ļ����ڲ���ȫ���Ѳ���֧�֣���ʹ��JSetup1.0.5������İ汾�򿪡�&pause&goto :eof
  )

:notver
cls&echo.���ļ�����֧�ֻ����𻵣����������ɡ�&pause>nul&Exit