:Ink

::UIԤ��
set JSNum=1&call:JS-UI
set JSNum=2&call:JS-UI
set JSNum=3&call:JS-UI

mode 81,40

cls
echo.
echo.   ��ݷ�ʽ
echo.��������������������������������������������������������������������������������
echo.
echo.   ��һ�� [10]%UI_���1_����%
echo.
echo.    *[11]����λ�ã�%���1_λ��%
echo.    *[12]���ƣ�    %���1_����%
echo.    *[13]Ŀ��·����%���1_Ŀ��%
echo.     [14]Ŀ�������%���1_����%
echo.     [15]ͼ��·����%���1_ͼ��%
echo.     [16]���ڴ�С��%UI_���1_����%
echo.     [17]������    %���1_����%
echo.
echo.   �ڶ��� [20]%UI_���2_����%
echo.
echo.    *[21]����λ�ã�%���2_λ��%
echo.    *[22]���ƣ�    %���2_����%
echo.    *[23]Ŀ��·����%���2_Ŀ��%
echo.     [24]Ŀ�������%���2_����%
echo.     [25]ͼ��·����%���2_ͼ��%
echo.     [26]���ڴ�С��%UI_���2_����%
echo.     [27]������    %���2_����%
echo.
echo.   ������ [30]%UI_���3_����%
echo.
echo.    *[31]����λ�ã�%���3_λ��%
echo.    *[32]���ƣ�    %���3_����%
echo.    *[33]Ŀ��·����%���3_Ŀ��%
echo.     [34]Ŀ�������%���3_����%
echo.     [35]ͼ��·����%���3_ͼ��%
echo.     [36]���ڴ�С��%UI_���3_����%
echo.     [37]������    %���3_����%
echo.
echo.��������������������������������������������������������������������������������
echo.     [0]����
echo.��������������������������������������������������������������������������������
set next=
set /p next=
if "%next%"=="0" goto :eof
set jsnum=1&call :js-xuanze
set jsnum=2&call :js-xuanze
set jsnum=3&call :js-xuanze
goto :Ink

:js-xuanze
if "%next%"=="%jsnum%0" call :Ink-button
if "%next%"=="%jsnum%1" call :Ink-position
if "%next%"=="%jsnum%2" call :Ink-name
if "%next%"=="%jsnum%3" call :Ink-target
if "%next%"=="%jsnum%4" call :Ink-parameter
if "%next%"=="%jsnum%5" call :Ink-logo
if "%next%"=="%jsnum%6" call :Ink-windowsize
if "%next%"=="%jsnum%7" call :Ink-word
set jsnum=&goto :eof

:Ink-position
echo.--�趨��ݷ�ʽ����λ�ã�
echo.  [1]���� [2]��ʼ [3]���� [4]����/��ʼ [5]��ʼ/���� [6]����/��ʼ/����
set next=
set /p next=
if "%next%"=="1" set ���%jsnum%_λ��=Desktop
if "%next%"=="2" set ���%jsnum%_λ��=StartMenu
if "%next%"=="3" set ���%jsnum%_λ��=StartUp
if "%next%"=="4" set ���%jsnum%_λ��=Desktop StartMenu
if "%next%"=="5" set ���%jsnum%_λ��=StartMenu StartUp
if "%next%"=="6" set ���%jsnum%_λ��=Desktop StartMenu StartUp
goto :eof

:Ink-button
if "!���%jsnum%_����!"=="" set ���%jsnum%_����=y&goto :eof
if "!���%jsnum%_����!"=="y" set ���%jsnum%_����=n&goto :eof
if "!���%jsnum%_����!"=="n" set ���%jsnum%_����=y&goto :eof
goto :eof

:Ink-name
set ���%jsnum%_����=
set /p ���%jsnum%_����=--�趨��ݷ�ʽ�����ƣ�
goto :eof

:Ink-target
set ���%jsnum%_Ŀ��=
set /p ���%jsnum%_Ŀ��=--�趨��ݷ�ʽĿ������·����
goto :eof

:Ink-parameter
set ���%jsnum%_����=
set /p ���1_����=--�趨��ݷ�ʽĿ������в�����
goto :eof

:Ink-logo
set ���%jsnum%_ͼ��=
set /p ���%jsnum%_ͼ��=--�趨��ݷ�ʽͼ������·����
goto :eof

:Ink-windowsize
set /p ���%jsnum%_����=--�趨��ݷ�ʽ�򿪴��ڣ�[1]Ĭ�� [3]��� [7]��С�� 
if "!���%jsnum%_����!"=="1" goto :eof
if "!���%jsnum%_����!"=="3" goto :eof
if "!���%jsnum%_����!"=="7" goto :eof
set ���%jsnum%_����=1
goto :eof

:Ink-word
set ���%jsnum%_����=
set /p ���%jsnum%_����=--�趨��ݷ�ʽ������(����)��
goto :eof

:JS-UI
if "!���%jsnum%_����!"=="y" (set UI_���%jsnum%_����=�ѿ���) else (set UI_���%jsnum%_����=δ����)
if "!���%jsnum%_����!"=="1" (set UI_���%jsnum%_����=Ĭ�ϴ���) else (set UI_���%jsnum%_����=)
if "!���%jsnum%_����!"=="3" (set UI_���%jsnum%_����=���)
if "!���%jsnum%_����!"=="7" (set UI_���%jsnum%_����=��С��)
set jsnum=&goto :eof