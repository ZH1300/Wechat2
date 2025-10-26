@echo off

:: 初始化变量
set "wechatPath=E:\WeChat\Weixin\Weixin.exe"
set "maxInstances=10"

:MAIN_MENU
cls
echo.
echo  ★★★★★★★★
echo.
echo  ★微信多开工具★
echo.
echo  ★★★★★★★★
echo.

:GET_INPUT
set /p num="请输入需要多开的微信数量 (1-%maxInstances%): "
 
:: 验证输入是否为数字且在范围内
echo %num%|findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo 错误：请输入数字！
    goto GET_INPUT
)
 
if %num% LSS 1 (
    echo 错误：数量不能小于1！
    goto GET_INPUT
)
 
if %num% GTR %maxInstances% (
    echo 错误：数量不能超过%maxInstances%！
    goto GET_INPUT
)
 
echo.
echo 准备打开 %num% 个微信实例...
echo.
 
:: 启动微信实例
set "successCount=0"
set "failedCount=0"
 
for /L %%i in (1,1,%num%) do (
    echo 正在启动第 %%i 个微信...
    start "" "%wechatPath%"
    if errorlevel 1 (
        set /a failedCount+=1
        echo 启动失败！
    ) else (
        set /a successCount+=1
        timeout /t 1 /nobreak >nul
    )
)


echo.
echo 操作完成！
echo 成功启动: %successCount% 个
echo 启动失败: %failedCount% 个
echo.

echo 3秒后将关闭窗口...
timeout /t 3 /nobreak >nul
:: exit

::exit /b