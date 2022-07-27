@echo off


:::: SETTINGS ::::
:: Turn Off Background Apps
call ".\utils\message.cmd" "[Setting] Turn Off Background Apps"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled  /t REG_DWORD /d 1 /f >nul 2>nul
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BackgroundAppGlobalToggle /t REG_DWORD /d 0 /f >nul 2>nul

:::: REMOVES  ::::
:: Remove Old Device Drivers
call ".\utils\message.cmd" "[Remove] Old Device Drivers"
SET DEVMGR_SHOW_NONPRESENT_DEVICES=1

:::: DISABLES ::::
:: Disable Activity History
call ".\utils\message.cmd" "[Disable] Activity History"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul 2>nul

:: Disable Automatic Updates for Microsoft Store apps
call ".\utils\message.cmd" "[Disable] Automatic Updates for Microsoft Store apps"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /t REG_DWORD /d 2 /f >nul 2>nul

::  SmartScreen Filter for Store Apps: Disable
call ".\utils\message.cmd" "[Disable] SmartScreen Filter for Store Apps"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f >nul 2>nul

::  Disable location sensor
call ".\utils\message.cmd" "[Disable] Location sensor"
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f >nul 2>nul

:: Disable Get Even More Out of Windows Screen /W10
call ".\utils\message.cmd" "[Disable] Get Even More Out of Windows Screen"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f >nul 2>nul

:: Disable automatically installing suggested apps /W10
call ".\utils\message.cmd" "[Disable] Automatically installing suggested apps"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul 2>nul

:: Disable Start Menu Ads/Suggestions /W10
call ".\utils\message.cmd" "[Disable] Start Menu Ads/Suggestions"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f >nul 2>nul

:: Disables several unnecessary components
call ".\utils\message.cmd" "[Disable] Unnecessary components"
set components=Printing-PrintToPDFServices-Features Printing-XPSServices-Features Xps-Foundation-Xps-Viewer
(for %%a in (%components%) do ( 
   powerShell -NoProfile -Command " disable-windowsoptionalfeature -online -featureName %%a -NoRestart " >nul 2>nul
))
