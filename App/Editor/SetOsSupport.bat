:main
cls
echo.
echo.   系统及位数支持性
echo.────────────────────────────────────────
echo.
echo.     [1] 设定软件位数                       %软件位数% bit
echo.
echo.     [2] 系统位数支持性                     %支持位数% bit
echo.
echo.   系统支持性：
echo.
echo.     [3] Windows 10                         %系统支持_win10%
echo.     [4] Windows 8.1 / Server 2012 R2       %系统支持_win8.1%
echo.     [5] Windows 8 / Server 2012            %系统支持_win8%
echo.     [6] Windows 7 / Server 2008 R2         %系统支持_win7%
echo.     [7] Windows Vista / Server 2008        %系统支持_winvista%
echo.
echo.   早期版本的 Windows
echo.
echo.     [8] Windows Server 2003                %系统支持_win2003%
echo.     [9] Windows Xp                         %系统支持_winxp%
echo.
echo.         Windows 2000及更早版本已不受支持
echo.
echo.────────────────────────────────────────
echo.    [回车]返回                             (键入数字并回车)
echo.────────────────────────────────────────
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
if "%软件位数%"=="" (set 软件位数=32&goto :eof)
if "%软件位数%"=="32" (set 软件位数=64&set 支持位数=64&goto :eof)
if "%软件位数%"=="64" (set 软件位数=32 64&goto :eof)
if "%软件位数%"=="32 64" (set 软件位数=32&goto :eof)
goto :eof

:setsupportbit
if "%软件位数%"=="64" (set 支持位数=64&goto :eof)
if "%支持位数%"=="" (set 支持位数=32&goto :eof)
if "%支持位数%"=="32" (set 支持位数=64&goto :eof)
if "%支持位数%"=="64" (set 支持位数=32 64&goto :eof)
if "%支持位数%"=="32 64" (set 支持位数=32&goto :eof)
goto :eof

:win10
if "%系统支持_win10%"=="y" (set 系统支持_win10=) else (set 系统支持_win10=y)
goto :eof

:win8.1
if "%系统支持_win8.1%"=="y" (set 系统支持_win8.1=) else (set 系统支持_win8.1=y)
goto :eof

:win8
if "%系统支持_win8%"=="y" (set 系统支持_win8=) else (set 系统支持_win8=y)
goto :eof

:win7
if "%系统支持_win7%"=="y" (set 系统支持_win7=) else (set 系统支持_win7=y)
goto :eof

:winvista
if "%系统支持_winvista%"=="y" (set 系统支持_winvista=) else (set 系统支持_winvista=y)
goto :eof

:win2003
if "%系统支持_win2003%"=="y" (set 系统支持_win2003=) else (set 系统支持_win2003=y)
goto :eof

:winxp
if "%系统支持_winxp%"=="y" (set 系统支持_winxp=) else (set 系统支持_winxp=y)
goto :eof
