:main
cls
echo.
echo.   ϵͳ��λ��֧����
echo.��������������������������������������������������������������������������������
echo.
echo.     [1] �趨���λ��                       %���λ��% bit
echo.
echo.     [2] ϵͳλ��֧����                     %֧��λ��% bit
echo.
echo.   ϵͳ֧���ԣ�
echo.
echo.     [3] Windows 10                         %ϵͳ֧��_win10%
echo.     [4] Windows 8.1 / Server 2012 R2       %ϵͳ֧��_win8.1%
echo.     [5] Windows 8 / Server 2012            %ϵͳ֧��_win8%
echo.     [6] Windows 7 / Server 2008 R2         %ϵͳ֧��_win7%
echo.     [7] Windows Vista / Server 2008        %ϵͳ֧��_winvista%
echo.
echo.   ���ڰ汾�� Windows
echo.
echo.     [8] Windows Server 2003                %ϵͳ֧��_win2003%
echo.     [9] Windows Xp                         %ϵͳ֧��_winxp%
echo.
echo.         Windows 2000������汾�Ѳ���֧��
echo.
echo.��������������������������������������������������������������������������������
echo.    [�س�]����                             (�������ֲ��س�)
echo.��������������������������������������������������������������������������������
set next=
set /p next=
if "%next%"=="" goto :eof
if "%next%"=="1" call :setappbit
if "%next%"=="2" call :setsupportbit
if "%next%"=="3" call :win10
if "%next%"=="4" call :win8.1
if "%next%"=="5" call :win8
if "%next%"=="6" call :win7
if "%next%"=="7" call :winvista
if "%next%"=="8" call :win2003
if "%next%"=="9" call :winxp
goto :main

:setappbit
if "%���λ��%"=="" (set ���λ��=32&goto :eof)
if "%���λ��%"=="32" (set ���λ��=64&set ֧��λ��=64&goto :eof)
if "%���λ��%"=="64" (set ���λ��=32 64&goto :eof)
if "%���λ��%"=="32 64" (set ���λ��=32&goto :eof)
goto :eof

:setsupportbit
if "%���λ��%"=="64" (set ֧��λ��=64&goto :eof)
if "%֧��λ��%"=="" (set ֧��λ��=32&goto :eof)
if "%֧��λ��%"=="32" (set ֧��λ��=64&goto :eof)
if "%֧��λ��%"=="64" (set ֧��λ��=32 64&goto :eof)
if "%֧��λ��%"=="32 64" (set ֧��λ��=32&goto :eof)
goto :eof

:win10
if "%ϵͳ֧��_win10%"=="y" (set ϵͳ֧��_win10=) else (set ϵͳ֧��_win10=y)
goto :eof

:win8.1
if "%ϵͳ֧��_win8.1%"=="y" (set ϵͳ֧��_win8.1=) else (set ϵͳ֧��_win8.1=y)
goto :eof

:win8
if "%ϵͳ֧��_win8%"=="y" (set ϵͳ֧��_win8=) else (set ϵͳ֧��_win8=y)
goto :eof

:win7
if "%ϵͳ֧��_win7%"=="y" (set ϵͳ֧��_win7=) else (set ϵͳ֧��_win7=y)
goto :eof

:winvista
if "%ϵͳ֧��_winvista%"=="y" (set ϵͳ֧��_winvista=) else (set ϵͳ֧��_winvista=y)
goto :eof

:win2003
if "%ϵͳ֧��_win2003%"=="y" (set ϵͳ֧��_win2003=) else (set ϵͳ֧��_win2003=y)
goto :eof

:winxp
if "%ϵͳ֧��_winxp%"=="y" (set ϵͳ֧��_winxp=) else (set ϵͳ֧��_winxp=y)
goto :eof
