@echo off

:: ��ʼ������
set "wechatPath=E:\WeChat\Weixin\Weixin.exe"
set "maxInstances=10"

:MAIN_MENU
cls
echo.
echo  ���������
echo.
echo  ��΢�Ŷ࿪���ߡ�
echo.
echo  ���������
echo.

:GET_INPUT
set /p num="��������Ҫ�࿪��΢������ (1-%maxInstances%): "
 
:: ��֤�����Ƿ�Ϊ�������ڷ�Χ��
echo %num%|findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo �������������֣�
    goto GET_INPUT
)
 
if %num% LSS 1 (
    echo ������������С��1��
    goto GET_INPUT
)
 
if %num% GTR %maxInstances% (
    echo �����������ܳ���%maxInstances%��
    goto GET_INPUT
)
 
echo.
echo ׼���� %num% ��΢��ʵ��...
echo.
 
:: ����΢��ʵ��
set "successCount=0"
set "failedCount=0"
 
for /L %%i in (1,1,%num%) do (
    echo ���������� %%i ��΢��...
    start "" "%wechatPath%"
    if errorlevel 1 (
        set /a failedCount+=1
        echo ����ʧ�ܣ�
    ) else (
        set /a successCount+=1
        timeout /t 1 /nobreak >nul
    )
)


echo.
echo ������ɣ�
echo �ɹ�����: %successCount% ��
echo ����ʧ��: %failedCount% ��
echo.

echo 3��󽫹رմ���...
timeout /t 3 /nobreak >nul
:: exit

::exit /b