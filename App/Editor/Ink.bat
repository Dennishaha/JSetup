:Ink

::UI预设
set JSNum=1&call:JS-UI
set JSNum=2&call:JS-UI
set JSNum=3&call:JS-UI

mode 81,40

cls
echo.
echo.   快捷方式
echo.────────────────────────────────────────
echo.
echo.   第一个 [10]%UI_快捷1_开关%
echo.
echo.    *[11]创建位置：%快捷1_位置%
echo.    *[12]名称：    %快捷1_名称%
echo.    *[13]目标路径：%快捷1_目标%
echo.     [14]目标参数：%快捷1_参数%
echo.     [15]图标路径：%快捷1_图标%
echo.     [16]窗口大小：%UI_快捷1_窗口%
echo.     [17]描述：    %快捷1_描述%
echo.
echo.   第二个 [20]%UI_快捷2_开关%
echo.
echo.    *[21]创建位置：%快捷2_位置%
echo.    *[22]名称：    %快捷2_名称%
echo.    *[23]目标路径：%快捷2_目标%
echo.     [24]目标参数：%快捷2_参数%
echo.     [25]图标路径：%快捷2_图标%
echo.     [26]窗口大小：%UI_快捷2_窗口%
echo.     [27]描述：    %快捷2_描述%
echo.
echo.   第三个 [30]%UI_快捷3_开关%
echo.
echo.    *[31]创建位置：%快捷3_位置%
echo.    *[32]名称：    %快捷3_名称%
echo.    *[33]目标路径：%快捷3_目标%
echo.     [34]目标参数：%快捷3_参数%
echo.     [35]图标路径：%快捷3_图标%
echo.     [36]窗口大小：%UI_快捷3_窗口%
echo.     [37]描述：    %快捷3_描述%
echo.
echo.────────────────────────────────────────
echo.     [0]返回
echo.────────────────────────────────────────
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
echo.--设定快捷方式创建位置：
echo.  [1]桌面 [2]开始 [3]启动 [4]桌面/开始 [5]开始/启动 [6]桌面/开始/启动
set next=
set /p next=
if "%next%"=="1" set 快捷%jsnum%_位置=Desktop
if "%next%"=="2" set 快捷%jsnum%_位置=StartMenu
if "%next%"=="3" set 快捷%jsnum%_位置=StartUp
if "%next%"=="4" set 快捷%jsnum%_位置=Desktop StartMenu
if "%next%"=="5" set 快捷%jsnum%_位置=StartMenu StartUp
if "%next%"=="6" set 快捷%jsnum%_位置=Desktop StartMenu StartUp
goto :eof

:Ink-button
if "!快捷%jsnum%_开关!"=="" set 快捷%jsnum%_开关=y&goto :eof
if "!快捷%jsnum%_开关!"=="y" set 快捷%jsnum%_开关=n&goto :eof
if "!快捷%jsnum%_开关!"=="n" set 快捷%jsnum%_开关=y&goto :eof
goto :eof

:Ink-name
set 快捷%jsnum%_名称=
set /p 快捷%jsnum%_名称=--设定快捷方式的名称：
goto :eof

:Ink-target
set 快捷%jsnum%_目标=
set /p 快捷%jsnum%_目标=--设定快捷方式目标的相对路径：
goto :eof

:Ink-parameter
set 快捷%jsnum%_参数=
set /p 快捷1_参数=--设定快捷方式目标的运行参数：
goto :eof

:Ink-logo
set 快捷%jsnum%_图标=
set /p 快捷%jsnum%_图标=--设定快捷方式图标的相对路径：
goto :eof

:Ink-windowsize
set /p 快捷%jsnum%_窗口=--设定快捷方式打开窗口：[1]默认 [3]最大化 [7]最小化 
if "!快捷%jsnum%_窗口!"=="1" goto :eof
if "!快捷%jsnum%_窗口!"=="3" goto :eof
if "!快捷%jsnum%_窗口!"=="7" goto :eof
set 快捷%jsnum%_窗口=1
goto :eof

:Ink-word
set 快捷%jsnum%_描述=
set /p 快捷%jsnum%_描述=--设定快捷方式的描述(文字)：
goto :eof

:JS-UI
if "!快捷%jsnum%_开关!"=="y" (set UI_快捷%jsnum%_开关=已开启) else (set UI_快捷%jsnum%_开关=未开启)
if "!快捷%jsnum%_窗口!"=="1" (set UI_快捷%jsnum%_窗口=默认窗口) else (set UI_快捷%jsnum%_窗口=)
if "!快捷%jsnum%_窗口!"=="3" (set UI_快捷%jsnum%_窗口=最大化)
if "!快捷%jsnum%_窗口!"=="7" (set UI_快捷%jsnum%_窗口=最小化)
set jsnum=&goto :eof