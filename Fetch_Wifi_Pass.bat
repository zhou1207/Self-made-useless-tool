@echo off

REM This program is to fetch the wifi name and password that the Windows machine is currently connected to.

SET output1=The wifi is:
SET output2=The wifi password is:

REM This is to fetch the SSID or Wi-Fi name
FOR /F "tokens=3 delims= " %%a in ('netsh wlan show interfaces ^| findstr /c:"SSID                   :"') do (SET SSID=%%a)

REM This is to fetch the Wi-Fi password
netsh wlan show profile name=%SSID% key=clear | findstr /c:"Key Content" > key.txt

FOR /F "tokens=4 delims= " %%b in (key.txt) do SET SSIDkey=%%b

echo %output1% %SSID% > Current_Wifi_Pass.txt
echo %output2% %SSIDkey% >> Current_Wifi_Pass.txt

DEL key.txt