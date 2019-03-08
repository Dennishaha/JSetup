@echo off
cd %~dp0

:start

if /i "%文字颜色%"=="0" set UI_文字颜色=黑
if /i "%文字颜色%"=="1" set UI_文字颜色=蓝
if /i "%文字颜色%"=="2" set UI_文字颜色=绿
if /i "%文字颜色%"=="3" set UI_文字颜色=浅绿
if /i "%文字颜色%"=="4" set UI_文字颜色=红
if /i "%文字颜色%"=="5" set UI_文字颜色=紫
if /i "%文字颜色%"=="6" set UI_文字颜色=黄
if /i "%文字颜色%"=="7" set UI_文字颜色=白
if /i "%文字颜色%"=="8" set UI_文字颜色=灰
if /i "%文字颜色%"=="9" set UI_文字颜色=淡蓝
if /i "%文字颜色%"=="A" set UI_文字颜色=淡绿
if /i "%文字颜色%"=="B" set UI_文字颜色=淡浅绿
if /i "%文字颜色%"=="C" set UI_文字颜色=淡红
if /i "%文字颜色%"=="D" set UI_文字颜色=淡紫
if /i "%文字颜色%"=="E" set UI_文字颜色=淡黄
if /i "%文字颜色%"=="F" set UI_文字颜色=亮白

if /i "%背景颜色%"=="0" set UI_背景颜色=黑
if /i "%背景颜色%"=="1" set UI_背景颜色=蓝
if /i "%背景颜色%"=="2" set UI_背景颜色=绿
if /i "%背景颜色%"=="3" set UI_背景颜色=浅绿
if /i "%背景颜色%"=="4" set UI_背景颜色=红
if /i "%背景颜色%"=="5" set UI_背景颜色=紫
if /i "%背景颜色%"=="6" set UI_背景颜色=黄
if /i "%背景颜色%"=="7" set UI_背景颜色=白
if /i "%背景颜色%"=="8" set UI_背景颜色=灰
if /i "%背景颜色%"=="9" set UI_背景颜色=淡蓝
if /i "%背景颜色%"=="A" set UI_背景颜色=淡绿
if /i "%背景颜色%"=="B" set UI_背景颜色=淡浅绿
if /i "%背景颜色%"=="C" set UI_背景颜色=淡红
if /i "%背景颜色%"=="D" set UI_背景颜色=淡紫
if /i "%背景颜色%"=="E" set UI_背景颜色=淡黄
if /i "%背景颜色%"=="F" set UI_背景颜色=亮白

color %背景颜色%%文字颜色%
mode 81,25
cls
echo.
echo.   安装包窗口视觉配置
echo.────────────────────────────────────────
echo.  当前配色为 安装包的配色
echo.
echo.
echo.                       [1] 文字颜色     %UI_文字颜色% （ %文字颜色% ）
echo.
echo.                       [2] 背景颜色     %UI_背景颜色% （ %背景颜色% ）
echo.
echo.           ────────────────────────────
echo.
echo.            0 = 黑色       4 = 红色       8 = 灰色       C = 淡红色
echo.            1 = 蓝色       5 = 紫色       9 = 淡蓝色     D = 淡紫色
echo.            2 = 绿色       6 = 黄色       A = 淡绿色     E = 淡黄色
echo.            3 = 浅绿色     7 = 白色       B = 淡浅绿色   F = 亮白色
echo.
echo.           ────────────────────────────
echo.
echo.────────────────────────────────────────
echo.     [0] 返回   [r] 恢复默认
echo.────────────────────────────────────────
set next=
set /p next=
if "%next%"=="0" goto :eof
if "%next%"=="1" call :Setting1
if "%next%"=="2" call :Setting2
if /i "%next%"=="r" call :reset
goto :start

:Setting1
if /i "%文字颜色%"=="0" set 文字颜色=1&goto :eof
if /i "%文字颜色%"=="1" set 文字颜色=2&goto :eof
if /i "%文字颜色%"=="2" set 文字颜色=3&goto :eof
if /i "%文字颜色%"=="3" set 文字颜色=4&goto :eof
if /i "%文字颜色%"=="4" set 文字颜色=5&goto :eof
if /i "%文字颜色%"=="5" set 文字颜色=6&goto :eof
if /i "%文字颜色%"=="6" set 文字颜色=7&goto :eof
if /i "%文字颜色%"=="7" set 文字颜色=8&goto :eof
if /i "%文字颜色%"=="8" set 文字颜色=9&goto :eof
if /i "%文字颜色%"=="9" set 文字颜色=A&goto :eof
if /i "%文字颜色%"=="A" set 文字颜色=B&goto :eof
if /i "%文字颜色%"=="B" set 文字颜色=C&goto :eof
if /i "%文字颜色%"=="C" set 文字颜色=D&goto :eof
if /i "%文字颜色%"=="D" set 文字颜色=E&goto :eof
if /i "%文字颜色%"=="E" set 文字颜色=F&goto :eof
if /i "%文字颜色%"=="F" set 文字颜色=0&goto :eof
goto :eof

:Setting2
if /i "%背景颜色%"=="0" set 背景颜色=1&goto :eof
if /i "%背景颜色%"=="1" set 背景颜色=2&goto :eof
if /i "%背景颜色%"=="2" set 背景颜色=3&goto :eof
if /i "%背景颜色%"=="3" set 背景颜色=4&goto :eof
if /i "%背景颜色%"=="4" set 背景颜色=5&goto :eof
if /i "%背景颜色%"=="5" set 背景颜色=6&goto :eof
if /i "%背景颜色%"=="6" set 背景颜色=7&goto :eof
if /i "%背景颜色%"=="7" set 背景颜色=8&goto :eof
if /i "%背景颜色%"=="8" set 背景颜色=9&goto :eof
if /i "%背景颜色%"=="9" set 背景颜色=A&goto :eof
if /i "%背景颜色%"=="A" set 背景颜色=B&goto :eof
if /i "%背景颜色%"=="B" set 背景颜色=C&goto :eof
if /i "%背景颜色%"=="C" set 背景颜色=D&goto :eof
if /i "%背景颜色%"=="D" set 背景颜色=E&goto :eof
if /i "%背景颜色%"=="E" set 背景颜色=F&goto :eof
if /i "%背景颜色%"=="F" set 背景颜色=0&goto :eof
goto :eof

:reset

set 文字颜色=0
set 背景颜色=f

goto :eof





