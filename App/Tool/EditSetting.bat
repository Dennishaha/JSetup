@echo off
cd %~dp0

::被调用
if "%~1"=="-on" (call :on&goto :next)
if "%~1"=="-off" (call :off&goto :next)

::检测目前状态
reg QUERY "HKEY_CURRENT_USER\Console" /t REG_DWORD /v QuickEdit|findstr "0x1" >nul&&(set FastEdit_Now=已开启)
reg QUERY "HKEY_CURRENT_USER\Console" /t REG_DWORD /v QuickEdit|findstr "0x0" >nul&&(set FastEdit_Now=未开启)

:start
color f0
cls
echo.
echo.
echo.
echo.                  快速编辑模式设置  %FastEdit_Now%
echo.
echo.             ┏━━━━━━━━━━━━━━━┓
echo.             ┣━━━━━━━━━━━━━━━┫
echo.             ┃  04-12-14   2.wav            ┃
echo.             ┃           ┌────┐       ┃
echo.             ┃  29-06-14 │1.mp3   │       ┃
echo.             ┃           └────┼       ┃
echo.             ┃  09-02-15   2.mp3            ┃
echo.             ┗━━━━━━━━━━━━━━━┛
echo.
echo.          开启后可以直接在屏幕上拉取复制，右键粘贴！     
echo.
echo.            [回车] 开启    [1] 关闭    [0] 返回
set next=
set /p next=
cls
if "%next%"=="0" goto :eof
if "%next%"=="" call :on&goto :next
if "%next%"=="1" call :off&goto :next
goto :start

:on
reg add "HKEY_CURRENT_USER\Console" /t REG_DWORD /v QuickEdit /d 0x0000001 /f
goto :eof

:off
reg add "HKEY_CURRENT_USER\Console" /t REG_DWORD /v QuickEdit /d 0x0000000 /f
goto :eof

:next
start /i cmd /c "%mainbat%"
Exit