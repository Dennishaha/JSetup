@echo off

:readset
if exist "%appdata%\JFsoft\JSetup\Vision.txt" for /f "delims=; tokens=1,*" %%a in ('type "%appdata%\JFsoft\JSetup\Vision.txt"') do set %%a=%%b
if not exist "%appdata%\JFsoft\JSetup\Vision.txt" (call :reset&call :outset)

::������
if "%~1"=="-readset" (goto :eof)

:start

if /i "%JS_������ɫ%"=="0" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="1" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="2" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="3" set UI_JS_������ɫ=ǳ��
if /i "%JS_������ɫ%"=="4" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="5" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="6" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="7" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="8" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="9" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="A" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="B" set UI_JS_������ɫ=��ǳ��
if /i "%JS_������ɫ%"=="C" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="D" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="E" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="F" set UI_JS_������ɫ=����

if /i "%JS_������ɫ%"=="0" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="1" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="2" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="3" set UI_JS_������ɫ=ǳ��
if /i "%JS_������ɫ%"=="4" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="5" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="6" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="7" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="8" set UI_JS_������ɫ=��
if /i "%JS_������ɫ%"=="9" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="A" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="B" set UI_JS_������ɫ=��ǳ��
if /i "%JS_������ɫ%"=="C" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="D" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="E" set UI_JS_������ɫ=����
if /i "%JS_������ɫ%"=="F" set UI_JS_������ɫ=����

color %JS_������ɫ%%JS_������ɫ%
mode 81,25
cls
echo.
echo.   ���� JSteup�����Ӿ�����
echo.��������������������������������������������������������������������������������
echo.
echo.
echo.
echo.                       [1] ������ɫ     %UI_JS_������ɫ% �� %JS_������ɫ% ��
echo.
echo.                       [2] ������ɫ     %UI_JS_������ɫ% �� %JS_������ɫ% ��
echo.
echo.           ��������������������������������������������������������
echo.
echo.            0 = ��ɫ       4 = ��ɫ       8 = ��ɫ       C = ����ɫ
echo.            1 = ��ɫ       5 = ��ɫ       9 = ����ɫ     D = ����ɫ
echo.            2 = ��ɫ       6 = ��ɫ       A = ����ɫ     E = ����ɫ
echo.            3 = ǳ��ɫ     7 = ��ɫ       B = ��ǳ��ɫ   F = ����ɫ
echo.
echo.           ��������������������������������������������������������
echo.
echo.��������������������������������������������������������������������������������
echo.     [0] ����   [r] �ָ�Ĭ��
echo.��������������������������������������������������������������������������������
set next=
set /p next=
if "%next%"=="0" goto :eof
if "%next%"=="1" call :Setting1&call :outset
if "%next%"=="2" call :Setting2&call :outset
if /i "%next%"=="r" call :reset&call :outset
goto :start

:Setting1
if /i "%JS_������ɫ%"=="0" set JS_������ɫ=1&goto :eof
if /i "%JS_������ɫ%"=="1" set JS_������ɫ=2&goto :eof
if /i "%JS_������ɫ%"=="2" set JS_������ɫ=3&goto :eof
if /i "%JS_������ɫ%"=="3" set JS_������ɫ=4&goto :eof
if /i "%JS_������ɫ%"=="4" set JS_������ɫ=5&goto :eof
if /i "%JS_������ɫ%"=="5" set JS_������ɫ=6&goto :eof
if /i "%JS_������ɫ%"=="6" set JS_������ɫ=7&goto :eof
if /i "%JS_������ɫ%"=="7" set JS_������ɫ=8&goto :eof
if /i "%JS_������ɫ%"=="8" set JS_������ɫ=9&goto :eof
if /i "%JS_������ɫ%"=="9" set JS_������ɫ=A&goto :eof
if /i "%JS_������ɫ%"=="A" set JS_������ɫ=B&goto :eof
if /i "%JS_������ɫ%"=="B" set JS_������ɫ=C&goto :eof
if /i "%JS_������ɫ%"=="C" set JS_������ɫ=D&goto :eof
if /i "%JS_������ɫ%"=="D" set JS_������ɫ=E&goto :eof
if /i "%JS_������ɫ%"=="E" set JS_������ɫ=F&goto :eof
if /i "%JS_������ɫ%"=="F" set JS_������ɫ=0&goto :eof
goto :eof

:Setting2
if /i "%JS_������ɫ%"=="0" set JS_������ɫ=1&goto :eof
if /i "%JS_������ɫ%"=="1" set JS_������ɫ=2&goto :eof
if /i "%JS_������ɫ%"=="2" set JS_������ɫ=3&goto :eof
if /i "%JS_������ɫ%"=="3" set JS_������ɫ=4&goto :eof
if /i "%JS_������ɫ%"=="4" set JS_������ɫ=5&goto :eof
if /i "%JS_������ɫ%"=="5" set JS_������ɫ=6&goto :eof
if /i "%JS_������ɫ%"=="6" set JS_������ɫ=7&goto :eof
if /i "%JS_������ɫ%"=="7" set JS_������ɫ=8&goto :eof
if /i "%JS_������ɫ%"=="8" set JS_������ɫ=9&goto :eof
if /i "%JS_������ɫ%"=="9" set JS_������ɫ=A&goto :eof
if /i "%JS_������ɫ%"=="A" set JS_������ɫ=B&goto :eof
if /i "%JS_������ɫ%"=="B" set JS_������ɫ=C&goto :eof
if /i "%JS_������ɫ%"=="C" set JS_������ɫ=D&goto :eof
if /i "%JS_������ɫ%"=="D" set JS_������ɫ=E&goto :eof
if /i "%JS_������ɫ%"=="E" set JS_������ɫ=F&goto :eof
if /i "%JS_������ɫ%"=="F" set JS_������ɫ=0&goto :eof
goto :eof

:outset
set InfoOut=%appdata%\JFsoft\JSetup\Vision.txt

1>"%InfoOut%"  echo JS_������ɫ;%JS_������ɫ%
1>>"%InfoOut%" echo JS_������ɫ;%JS_������ɫ%

goto :eof

:reset

set JS_������ɫ=1
set JS_������ɫ=f

goto :eof





