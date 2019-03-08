@echo off
cd /d %~dp0

::新建工程预设值
if "%~1"=="-new" set 系统支持_win10=y
if "%~1"=="-new" set 系统支持_win8.1=y
if "%~1"=="-new" set 系统支持_win8=y
if "%~1"=="-new" set 系统支持_win7=y
if "%~1"=="-new" set 系统支持_winvista=y
if "%~1"=="-new" set 系统支持_win2003=y
if "%~1"=="-new" set 系统支持_winxp=y

::工程预设值
if "%快捷1_开关%"=="" set 快捷1_开关=y
if "%快捷1_窗口%"=="" set 快捷1_窗口=1
if "%软件位数%"=="" set 软件位数=32 64
if "%支持位数%"=="" set 支持位数=32 64
if "%背景颜色%"=="" set 背景颜色=F
if "%文字颜色%"=="" set 文字颜色=0
if "%压缩级别%"=="" set 压缩级别=5
if "%压缩版本%"=="" set 压缩版本=5
if "%压缩锁定%"=="" set 压缩锁定=y
if "%压缩64bit%"=="" set 压缩64bit=n

:form1
cd %~dp0

::UI预设
if "%默认安装路径锁定%"=="y" (set UI_默认安装路径锁定=锁定) else (set UI_默认安装路径锁定=不锁定)
if "%安装后打开强制%"=="y" (set UI_安装后打开强制=强制打开) else (set UI_安装后打开强制=询问打开)
if exist "%源文件夹%" (set UI_源文件夹=存在) else (set UI_源文件夹=丢失)

title JSetup - %InfoFile%
mode 81,28
color %JS_背景颜色%%JS_文字颜色%
cls
echo.          │        │      │      │
echo. ← [exit]│■ 基本 │ 高级 │ 压缩 │ %软件名% %软件版本% 工程
echo.─────┴────┴───┴───┴─────────────────────
echo.
echo.   基本信息：
echo.     *[1]公司名：%公司名%
echo.     *[2]软件名：%软件名%
echo.     *[3]软件版本：%软件版本%
echo.     *[4]默认安装路径：程序文件夹\%默认安装路径%  -%UI_默认安装路径锁定%
echo.
echo.   快捷方式： [5]More ^>
if "%快捷1_开关%"=="y" echo.       1：%快捷1_位置%; %快捷1_名称%; %快捷1_目标%; %快捷1_参数%
if "%快捷2_开关%"=="y" echo.       2：%快捷2_位置%; %快捷2_名称%; %快捷2_目标%; %快捷2_参数%
if "%快捷3_开关%"=="y" echo.       2：%快捷3_位置%; %快捷3_名称%; %快捷3_目标%; %快捷3_参数%
echo.
echo.      [6]安装后打开：%安装后打开%  -%UI_安装后打开强制%
echo.
echo.     *[7]源文件夹路径:  -%UI_源文件夹%
echo.           "%源文件夹%"
echo.
echo.────────────────────────────────────────
echo.      [回车]切换选项卡   [空格]生成安装包   [s]保存   [p]另存为
echo.────────────────────────────────────────
set next=
set /p next=
if /i "%next%"=="" call :form2
if /i "%next%"==" " call Maker.bat
if /i "%next%"=="s" call JSI.bat -save
if /i "%next%"=="p" call JSI.bat -othersave
if /i "%next%"=="exit" goto :eof

if "%next%"=="1" call :设置公司名
if "%next%"=="2" call :设置软件名
if "%next%"=="3" call :设置软件版本
if "%next%"=="4" call :设置默认安装路径
if "%next%"=="5" call Editor\Ink.bat
if "%next%"=="6" call :设置安装后打开
if "%next%"=="7" call :设置源文件夹
goto :form1

:form2
cd %~dp0

::UI预设
if "%条款显示%"=="y" (set UI_条款显示=强制显示) else (set UI_条款显示=默认隐藏)
if "%安装后打开强制%"=="y" (set UI_安装后打开强制=强制打开) else (set UI_安装后打开强制=询问打开)
if "%卸载后打开强制%"=="y" (set UI_卸载后打开强制=强制打开) else (set UI_卸载后打开强制=询问打开)
if "%安装窗口标题%"=="" (set UI_安装窗口标题=^(默认标题^)) else (set UI_安装窗口标题=%安装窗口标题%)

mode 81,28
color %JS_背景颜色%%JS_文字颜色%
cls
echo.          │      │        │      │
echo. ← [exit]│ 基本 │ ■ 高级│ 压缩 │ %软件名% %软件版本% 工程
echo.─────┴───┴────┴───┴─────────────────────
echo.
echo.   安装配置：
echo.      [1]条款文本：%条款文本%  -%UI_条款显示%
echo.      [2]安装时运行：%安装时运行%
echo.      [3]新特征文件：%新特征文件%
echo.      [4]安装后打开：%安装后打开%  -%UI_安装后打开强制%
echo.
echo.      [5]卸载前显示文本：%卸载前文本%
echo.      [6]卸载后打开：%卸载后打开%  -%UI_卸载后打开强制%
echo.
echo.   安装环境： More ^>
echo.      [7]系统及位数支持性：打开获得详细信息
echo.         └软件位数：%软件位数% bit (支持位数：%支持位数% bit)
echo.
echo.   视觉UI：
echo.      [8]安装窗口配色：%背景颜色%%文字颜色%
echo.      [9]安装窗口标题：%UI_安装窗口标题%
echo.
echo.────────────────────────────────────────
echo.      [回车]切换选项卡   [空格]生成安装包   [s]保存   [p]另存
echo.────────────────────────────────────────
set next=
set /p next=
if /i "%next%"==" " call Maker.bat
if /i "%next%"=="" goto :form3
if /i "%next%"=="s" call JSI.bat -save
if /i "%next%"=="p" call JSI.bat -othersave
if /i "%next%"=="exit" goto :eof

if "%next%"=="1" call :设置条款文本
if "%next%"=="2" call :设置安装时运行
if "%next%"=="3" call :设置新特征文件
if "%next%"=="4" call :设置安装后打开
if "%next%"=="5" call :设置卸载前显示文本
if "%next%"=="6" call :设置卸载后打开
if "%next%"=="7" call Editor\SetOsSupport.bat
if "%next%"=="8" call Editor\VisionSet.bat
if "%next%"=="9" call :设置安装窗口标题
goto :form2

:form3
cd %~dp0

::UI预设
if "%支持位数%"=="64" (set UI_压缩64bit=目前可用) else (set UI_压缩64bit=目前不可用)
if exist "%源文件夹%" (set UI_源文件夹=存在) else (set UI_源文件夹=丢失)

mode 81,28
color %JS_背景颜色%%JS_文字颜色%
cls
echo.          │      │      │        │
echo. ← [exit]│ 基本 │ 高级 │■ 压缩 │ %软件名% %软件版本% 工程
echo.─────┴───┴───┴────┴─────────────────────
echo.
echo.
echo.     *[1]源文件夹路径:   -%UI_源文件夹%
echo.           %源文件夹%
echo.
echo.
echo.      [2]压缩级别：%压缩级别%
echo.
echo.      [3]Rar版本：%压缩版本%
echo.
echo.      [4]压缩锁定：%压缩锁定%
echo.
echo.      [5]64位自解压模块(%UI_压缩64bit%)：%压缩64bit%
echo.
echo.
echo.────────────────────────────────────────
echo.      [空格]生成安装包   [回车]切换选项卡   [s]保存   [p]另存
echo.────────────────────────────────────────
set next=
set /p next=
if /i "%next%"==" " call Maker.bat
if /i "%next%"=="" goto :form1
if /i "%next%"=="s" call JSI.bat -save
if /i "%next%"=="p" call JSI.bat -othersave
if /i "%next%"=="exit" goto :eof

if /i "%next%"=="1" call :设置源文件夹
if /i "%next%"=="2" call :设置压缩级别
if /i "%next%"=="3" call :设置压缩版本
if /i "%next%"=="4" call :设置压缩锁定
if /i "%next%"=="5" call :设置压缩64bit
goto :form3


:设置公司名
set 公司名=
set /p 公司名=--设定软件 公司的名称：
goto :eof

:设置软件名
set 软件名=
set /p 软件名=--设定 软件的名称：
goto :eof

:设置软件版本
set 软件版本=
set /p 软件版本=--设定 软件的版本号：
goto :eof

:设置默认安装路径
set 默认安装路径=
set /p 默认安装路径=--设定 默认安装路径：
set /p next=--设定 默认安装路径 锁定性：[回车]不变更锁定性  [1]不锁定  [2]锁定 
if "%next%"=="" goto :eof
if "%next%"=="1" set 默认安装路径锁定=&goto :eof
if "%next%"=="2" set 默认安装路径锁定=y&goto :eof
set 默认安装路径锁定=
goto :eof

:设置条款文本
set 条款文本=
set /p 条款文本=--设定 软件条款文本的相对路径(.txt)：
set /p next=--设定 条款显示方式：[回车]不变更显示方式  [1]不显示 [2]显示
if "%next%"=="" goto :eof
if "%next%"=="1" set 条款显示=&goto :eof
if "%next%"=="2" set 条款显示=y&goto :eof
set 条款显示=
goto :eof

:设置安装时运行
set 安装时运行=
set /p 安装时运行=--设置 安装时运行文件相对路径：
goto :eof

:设置新特征文件
set 新特征文件=
set /p 新特征文件=--设置 新特征文本的相对路径：
goto :eof

:设置安装后打开
set 安装后打开=
set /p 安装后打开=--设置 安装后运行文件的相对路径：
set /p next=--设定 安装后打开文件 强制性：[回车]不变更强制性  [1]不强制 [2]强制 
if "%next%"=="" goto :eof
if "%next%"=="1" set 安装后打开强制=&goto :eof
if "%next%"=="2" set 安装后打开强制=y&goto :eof
set 安装后打开强制=
goto :eof

:设置卸载前文本
set 卸载前文本=
set /p 卸载前文本=--设置 卸载前显示文本的相对路径(.txt)：
goto :eof

:设置卸载后打开
set 卸载后打开=
set /p 卸载后打开=--设置 卸载后运行文件的相对路径：
set /p next=--设定 卸载后打开文件 强制性：[回车]不变更强制性  [1]不强制 [2]强制 
if "%next%"=="" goto :eof
if "%next%"=="1" set 卸载后打开强制=&goto :eof
if "%next%"=="2" set 卸载后打开强制=y&goto :eof
set 卸载后打开强制=
goto :eof

:设置安装窗口标题
set 安装窗口标题=
set /p 安装窗口标题=--设定 安装窗口的标题：
goto :eof

:设置源文件夹
echo.--设置软件源文件夹绝对路径：
set 源文件夹=
set /p 源文件夹=

::去引号和斜杠
set 源文件夹=%源文件夹:"=%
if "%源文件夹:~-1%"=="\" set 源文件夹=%源文件夹:~0,-1%
goto :eof

::缺省设定
if not defined 源文件夹 set 源文件夹=&set 临时文件夹=&set 输出安装包=&goto :eof
goto :eof

:设置压缩级别
set 压缩级别=
set /p 压缩级别=--设定安装包压缩级别：[0]存储 [1-5]低-高压缩 
if "%压缩级别%"=="0" goto :eof
if "%压缩级别%"=="1" goto :eof
if "%压缩级别%"=="2" goto :eof
if "%压缩级别%"=="3" goto :eof
if "%压缩级别%"=="4" goto :eof
if "%压缩级别%"=="5" goto :eof
set 压缩级别=5
goto :eof

:设置压缩版本
set 压缩版本=
set /p 压缩版本=--设定安装包压缩版本：[4]Rar4 [5]Rar5 
if "%压缩版本%"=="4" goto :eof
if "%压缩版本%"=="5" goto :eof
set 压缩版本=5
goto :eof

:设置压缩锁定
set 压缩锁定=
set /p 压缩锁定=--设定安装包压缩锁定性：[y]锁定 [n]不锁定 
if "%压缩锁定%"=="y" goto :eof
if "%压缩锁定%"=="n" goto :eof
set 压缩锁定=y
goto :eof

:设置压缩64bit
echo.--设定安装包 在"支持位数"只有64位时使用64位压缩模块
set 压缩64bit=
set /p 压缩64bit=  [y]使用  [n]不使用 
if "%压缩64bit%"=="y" goto :eof
if "%压缩64bit%"=="n" goto :eof
set 压缩64bit=n
goto :eof