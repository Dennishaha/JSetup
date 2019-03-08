@echo off

:readset
if exist "%appdata%\JFsoft\JSetup\Vision.txt" for /f "delims=; tokens=1,*" %%a in ('type "%appdata%\JFsoft\JSetup\Vision.txt"') do set %%a=%%b
if not exist "%appdata%\JFsoft\JSetup\Vision.txt" (call :reset&call :outset)

::被调用
if "%~1"=="-readset" (goto :eof)

:start

if /i "%JS_文字颜色%"=="0" set UI_JS_文字颜色=黑
if /i "%JS_文字颜色%"=="1" set UI_JS_文字颜色=蓝
if /i "%JS_文字颜色%"=="2" set UI_JS_文字颜色=绿
if /i "%JS_文字颜色%"=="3" set UI_JS_文字颜色=浅绿
if /i "%JS_文字颜色%"=="4" set UI_JS_文字颜色=红
if /i "%JS_文字颜色%"=="5" set UI_JS_文字颜色=紫
if /i "%JS_文字颜色%"=="6" set UI_JS_文字颜色=黄
if /i "%JS_文字颜色%"=="7" set UI_JS_文字颜色=白
if /i "%JS_文字颜色%"=="8" set UI_JS_文字颜色=灰
if /i "%JS_文字颜色%"=="9" set UI_JS_文字颜色=淡蓝
if /i "%JS_文字颜色%"=="A" set UI_JS_文字颜色=淡绿
if /i "%JS_文字颜色%"=="B" set UI_JS_文字颜色=淡浅绿
if /i "%JS_文字颜色%"=="C" set UI_JS_文字颜色=淡红
if /i "%JS_文字颜色%"=="D" set UI_JS_文字颜色=淡紫
if /i "%JS_文字颜色%"=="E" set UI_JS_文字颜色=淡黄
if /i "%JS_文字颜色%"=="F" set UI_JS_文字颜色=亮白

if /i "%JS_背景颜色%"=="0" set UI_JS_背景颜色=黑
if /i "%JS_背景颜色%"=="1" set UI_JS_背景颜色=蓝
if /i "%JS_背景颜色%"=="2" set UI_JS_背景颜色=绿
if /i "%JS_背景颜色%"=="3" set UI_JS_背景颜色=浅绿
if /i "%JS_背景颜色%"=="4" set UI_JS_背景颜色=红
if /i "%JS_背景颜色%"=="5" set UI_JS_背景颜色=紫
if /i "%JS_背景颜色%"=="6" set UI_JS_背景颜色=黄
if /i "%JS_背景颜色%"=="7" set UI_JS_背景颜色=白
if /i "%JS_背景颜色%"=="8" set UI_JS_背景颜色=灰
if /i "%JS_背景颜色%"=="9" set UI_JS_背景颜色=淡蓝
if /i "%JS_背景颜色%"=="A" set UI_JS_背景颜色=淡绿
if /i "%JS_背景颜色%"=="B" set UI_JS_背景颜色=淡浅绿
if /i "%JS_背景颜色%"=="C" set UI_JS_背景颜色=淡红
if /i "%JS_背景颜色%"=="D" set UI_JS_背景颜色=淡紫
if /i "%JS_背景颜色%"=="E" set UI_JS_背景颜色=淡黄
if /i "%JS_背景颜色%"=="F" set UI_JS_背景颜色=亮白

color %JS_背景颜色%%JS_文字颜色%
mode 81,25
cls
echo.
echo.   设置 JSteup窗口视觉配置
echo.────────────────────────────────────────
echo.
echo.
echo.
echo.                       [1] 文字颜色     %UI_JS_文字颜色% （ %JS_文字颜色% ）
echo.
echo.                       [2] 背景颜色     %UI_JS_背景颜色% （ %JS_背景颜色% ）
echo.
echo.           ————————————————————————————
echo.
echo.            0 = 黑色       4 = 红色       8 = 灰色       C = 淡红色
echo.            1 = 蓝色       5 = 紫色       9 = 淡蓝色     D = 淡紫色
echo.            2 = 绿色       6 = 黄色       A = 淡绿色     E = 淡黄色
echo.            3 = 浅绿色     7 = 白色       B = 淡浅绿色   F = 亮白色
echo.
echo.           ————————————————————————————
echo.
echo.────────────────────────────────────────
echo.     [0] 返回   [r] 恢复默认
echo.────────────────────────────────────────
set next=
set /p next=
if "%next%"=="0" goto :eof
if "%next%"=="1" call :Setting1&call :outset
if "%next%"=="2" call :Setting2&call :outset
if /i "%next%"=="r" call :reset&call :outset
goto :start

:Setting1
if /i "%JS_文字颜色%"=="0" set JS_文字颜色=1&goto :eof
if /i "%JS_文字颜色%"=="1" set JS_文字颜色=2&goto :eof
if /i "%JS_文字颜色%"=="2" set JS_文字颜色=3&goto :eof
if /i "%JS_文字颜色%"=="3" set JS_文字颜色=4&goto :eof
if /i "%JS_文字颜色%"=="4" set JS_文字颜色=5&goto :eof
if /i "%JS_文字颜色%"=="5" set JS_文字颜色=6&goto :eof
if /i "%JS_文字颜色%"=="6" set JS_文字颜色=7&goto :eof
if /i "%JS_文字颜色%"=="7" set JS_文字颜色=8&goto :eof
if /i "%JS_文字颜色%"=="8" set JS_文字颜色=9&goto :eof
if /i "%JS_文字颜色%"=="9" set JS_文字颜色=A&goto :eof
if /i "%JS_文字颜色%"=="A" set JS_文字颜色=B&goto :eof
if /i "%JS_文字颜色%"=="B" set JS_文字颜色=C&goto :eof
if /i "%JS_文字颜色%"=="C" set JS_文字颜色=D&goto :eof
if /i "%JS_文字颜色%"=="D" set JS_文字颜色=E&goto :eof
if /i "%JS_文字颜色%"=="E" set JS_文字颜色=F&goto :eof
if /i "%JS_文字颜色%"=="F" set JS_文字颜色=0&goto :eof
goto :eof

:Setting2
if /i "%JS_背景颜色%"=="0" set JS_背景颜色=1&goto :eof
if /i "%JS_背景颜色%"=="1" set JS_背景颜色=2&goto :eof
if /i "%JS_背景颜色%"=="2" set JS_背景颜色=3&goto :eof
if /i "%JS_背景颜色%"=="3" set JS_背景颜色=4&goto :eof
if /i "%JS_背景颜色%"=="4" set JS_背景颜色=5&goto :eof
if /i "%JS_背景颜色%"=="5" set JS_背景颜色=6&goto :eof
if /i "%JS_背景颜色%"=="6" set JS_背景颜色=7&goto :eof
if /i "%JS_背景颜色%"=="7" set JS_背景颜色=8&goto :eof
if /i "%JS_背景颜色%"=="8" set JS_背景颜色=9&goto :eof
if /i "%JS_背景颜色%"=="9" set JS_背景颜色=A&goto :eof
if /i "%JS_背景颜色%"=="A" set JS_背景颜色=B&goto :eof
if /i "%JS_背景颜色%"=="B" set JS_背景颜色=C&goto :eof
if /i "%JS_背景颜色%"=="C" set JS_背景颜色=D&goto :eof
if /i "%JS_背景颜色%"=="D" set JS_背景颜色=E&goto :eof
if /i "%JS_背景颜色%"=="E" set JS_背景颜色=F&goto :eof
if /i "%JS_背景颜色%"=="F" set JS_背景颜色=0&goto :eof
goto :eof

:outset
set InfoOut=%appdata%\JFsoft\JSetup\Vision.txt

1>"%InfoOut%"  echo JS_文字颜色;%JS_文字颜色%
1>>"%InfoOut%" echo JS_背景颜色;%JS_背景颜色%

goto :eof

:reset

set JS_文字颜色=1
set JS_背景颜色=f

goto :eof





