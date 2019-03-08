@echo off
cd %~dp0

mode 61,22
color %JS_背景颜色%%JS_文字颜色%
cls
echo.
echo.  正在制作安装包中，请稍后...                  Ctrl+C.暂停
echo.──────────────────────────────
echo.
echo. 前期准备..

::检查信息完整性

for %%a in (
公司名 软件名 软件版本 默认安装路径 快捷1_开关 源文件夹 压缩级别 压缩版本 压缩锁定
) do if not defined %%a echo.&echo.--必填项“%%a”信息不完整，请补充！&pause>nul&goto :eof

if "%快捷1_开关%"=="y" for %%a in (
快捷1_名称 快捷1_目标 快捷1_窗口
) do if not defined %%a echo.&echo.--必填项“%%a”信息不完整，请补充！&pause>nul&goto :eof

if "%快捷2_开关%"=="y" for %%a in (
快捷2_名称 快捷2_目标 快捷2_窗口
) do if not defined %%a echo.&echo.--必填项“%%a”信息不完整，请补充！&pause>nul&goto :eof

if "%快捷3_开关%"=="y" for %%a in (
快捷3_名称 快捷3_目标 快捷3_窗口
) do if not defined %%a echo.&echo.--必填项“%%a”信息不完整，请补充！&pause>nul&goto :eof

if not exist "%源文件夹%" echo. --源文件夹不存在！&pause&goto :eof
if exist "%源文件夹%\JSetupInfo" echo. --源根文件夹中有“JSetupInfo”文件夹！&pause&goto :eof

::配置预设值

if "%压缩锁定%"=="y" (set -k=-k) else (set -k=)

if "%processor_architecture%"=="x86" set 压缩程序=Rar32.exe
if "%processor_architecture%"=="AMD64" set 压缩程序=Rar64.exe

set 临时文件夹=%源文件夹%out
set 输出安装包=%临时文件夹%\..\%软件名%%软件版本%安装包_%软件位数%.exe

set 自解压模块=Default32.sfx
if "%支持位数%"=="64" if "%压缩64bit%"=="y" set 自解压模块=Default64.sfx

echo. 删除旧安装包...

del /q /f /s "%输出安装包%">nul 2>nul

echo. 创建临时文件夹...

md "%临时文件夹%">nul
md "%临时文件夹%\JSetupInfo">nul

echo. 输出安装信息...
call JSI.bat -setupout

copy /v /y "UI\安装2.txt" "%临时文件夹%\JSetupInfo\安装2.bat">nul
copy /v /y "UI\安装1.txt" "%临时文件夹%\JSetupInfo\安装1.bat">nul
copy /v /y "UI\卸载2.txt" "%临时文件夹%\JSetupInfo\卸载2.bat">nul
copy /v /y "UI\卸载1.txt" "%临时文件夹%\JSetupInfo\卸载1.bat">nul

if "%支持位数%"=="32 64" (
  copy /v /y Tool\nircmdc.exe "%临时文件夹%\JSetupInfo\">nul
  copy /v /y Tool\nircmdc64.exe "%临时文件夹%\JSetupInfo\">nul
  )
if /i "%支持位数%"=="32" copy /v /y Tool\nircmdc.exe "%临时文件夹%\JSetupInfo\">nul
if /i "%支持位数%"=="64" copy /v /y Tool\nircmdc64.exe "%临时文件夹%\JSetupInfo\">nul

echo. 复制源文件...

xcopy "%源文件夹%" "%临时文件夹%\" /e /v /q /y>nul 

echo. 压缩安装包...

Tool\%压缩程序% a -w%temp% -sfxTool\%自解压模块% -icon"%临时文件夹%\%快捷1_图标%" -s -m%压缩级别% -ma%压缩版本% -ep1 -r -y -idq "%输出安装包%" "%临时文件夹%\*"
Tool\%压缩程序% c -w%temp% -zUI\压缩注释.txt %-k% -y -idq "%输出安装包%"

echo. 删除临时文件...

del /q /f /s "%临时文件夹%\*">nul
rd /q /s "%临时文件夹%">nul

:制作完成
echo. 安装包制作完成。
echo.
echo.──────────────────────────────
echo.输出文件路径: 
echo.%输出安装包%
echo.
echo.      - 要立即运行您应用吗？  [回车]否 [空格]运行

set next=
set /p next=
if "%next%"==" " start "" "%输出安装包%"

goto :eof