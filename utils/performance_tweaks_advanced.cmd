@echo off

::  Disable Edge WebWidget
call ".\utils\message.cmd" "[Disable] Edge WebWidget"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v WebWidgetAllowed /t REG_DWORD /d 0 /f >nul 2>nul

::  Setting power option to high for best performance
call ".\utils\message.cmd" "[Setting] Power option to high for best performance"
powercfg -setactive scheme_min

::  Enable All (Logical) Cores (Boot Advanced Options)
call ".\utils\message.cmd" "[Setting] Enable All (Logical) Cores (Boot Advanced Options)"
wmic cpu get NumberOfLogicalProcessors | findstr /r "[0-9]" > NumLogicalCores.txt
set /P NOLP=<NumLogicalCores.txt
bcdedit /set {current} numproc %NOLP% >nul 2>nul
if exist NumLogicalCores.txt del NumLogicalCores.txt

:: Dual boot timeout 3sec
call ".\utils\message.cmd" "[Setting] Dual boot timeout 3sec"
bcdedit /set timeout 3 >nul 2>nul

:: Disable Hibernation/Fast startup in Windows to free RAM from "C:\hiberfil.sys"
call ".\utils\message.cmd" "[Disable] Hibernation/Fast startup in Windows"
powercfg -hibernate off

:: Disable windows insider experiments
call ".\utils\message.cmd" "[Disable] Windows Insider experiments"
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t "REG_DWORD" /d "0" /f >nul 2>nul

:: Disable app launch tracking
call ".\utils\message.cmd" "[Disable] App launch tracking"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d "0" /t REG_DWORD /f >nul 2>nul

:: Disable powerthrottling (Intel 6gen and higher)
call ".\utils\message.cmd" "[Disable] Powerthrottling (Intel 6gen and higher)"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >nul 2>nul