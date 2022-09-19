@echo off
title RDP script for Go Deploy Lab by fb.com/thuong.hai.581
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
sc start audiosrv
sc config Audiosrv start= auto
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
curl -k -L -O https://github.com/kmille36/Go-Deploy-Windows-11-NGROK-RDP/raw/main/remote60fps.reg
reg import remote60fps.reg
curl -LkO https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip
tar xf ngrok-v3-stable-windows-amd64.zip
cls
echo "Go to: https://dashboard.ngrok.com/get-started/your-authtoken"
set /p id="Paste NGROK AUTHTOKEN: "
echo "======================="
echo "choose ngrok region (for better connection)."
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
set /p re="Choose ngrok region: "
ngrok config add-authtoken %id%
ngrok tcp --region %re% 3389
