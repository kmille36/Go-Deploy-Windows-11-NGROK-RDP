@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
title Install Chocolatey GUI script by NT.Hai
:install
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install chocolateygui --params="'/ShowConsoleOutput=True /OutdatedPackagesCacheDurationInMinutes=120 /Global'" -y
if not exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Chocolatey GUI.lnk" goto install
copy "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Chocolatey GUI.lnk" "C:\Users\Public\Desktop"
del "%~f0"
exit
