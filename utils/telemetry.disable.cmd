@echo off
:::: DISABLES ::::

:: SCHEDULED TASKS tweaks (Updates, Telemetry etc)
call ".\utils\message.cmd" "[Disable] SCHEDULED TASKS tweaks (Updates, Telemetry etc)"
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvent" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable >nul 2>nul
schtasks /Change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable >nul 2>nul
schtasks /Change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable >nul 2>nul
schtasks /Change /TN "NIUpdateServiceStartupTask" /Disable >nul 2>nul
schtasks /Change /TN "NerveCenterUpdate" /Disable >nul 2>nul
schtasks /Change /TN "Adobe Acrobat Update Task" /Disable >nul 2>nul
schtasks /Change /TN "AMDLinkUpdate" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Office\Office Automatic Updates 2.0" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Office\Office Feature Updates" /Disable >nul 2>nul
schtasks /Change /TN "Microsoft\Office\Office Feature Updates Logon" /Disable >nul 2>nul
schtasks /Change /TN "GoogleUpdateTaskMachineCore" /Disable >nul 2>nul
schtasks /Change /TN "GoogleUpdateTaskMachineUA" /Disable >nul 2>nul

:: Disable windows media player usage reports
call ".\utils\message.cmd" "[Disable] Windows media player usage reports"
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f >nul 2>nul

:: Disable mozilla telemetry
call ".\utils\message.cmd" "[Disable] Mozilla telemetry"
reg add HKLM\SOFTWARE\Policies\Mozilla\Firefox /v "DisableTelemetry" /t REG_DWORD /d "2" /f >nul 2>nul

:: Settings -> Privacy -> General -> Let apps use my advertising ID...
call ".\utils\message.cmd" "[Disable] Let apps use my advertising ID"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>nul

::  Send Microsoft info about how I write to help us improve typing and writing in the future
call ".\utils\message.cmd" "[Disable] Send Microsoft info about how I write"
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f >nul 2>nul

::  Handwriting recognition personalization
call ".\utils\message.cmd" "[Disable] Handwriting recognition personalization"
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f >nul 2>nul

:: Disable  setting override for reporting to Microsoft MAPS
call ".\utils\message.cmd" "[Disable] Setting override for reporting to Microsoft MAPS"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d 0 /f >nul 2>nul

::  Prevents sending speech, inking and typing samples to MS (so Cortana can learn to recognise you)
call ".\utils\message.cmd" "[Disable] Sending speech, inking and typing samples to MS"
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f >nul 2>nul

::  Prevents sending contacts to MS (so Cortana can compare speech etc samples)
call ".\utils\message.cmd" "[Disable] Sending contacts to MS"
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f >nul 2>nul

::  Immobilise Cortana 
call ".\utils\message.cmd" "[Disable] Cortana"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul 2>nul

:: Disable PowerShell Telemetry
call ".\utils\message.cmd" "[Disable] PowerShell Telemetry"
setx POWERSHELL_TELEMETRY_OPTOUT 1 >nul 2>nul

:: Disable Skype Telemetry
call ".\utils\message.cmd" "[Disable] Skype Telemetry"
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "TraceLevelThreshold" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "EnableTracing" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "EnableTracing" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\Tracing\WPPMedia" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\WPPMedia" /f >nul 2>nul

:::: REMOVES ::::
:: Remove Telemetry & Data Collection
call ".\utils\message.cmd" "[Disable] Telemetry/Data Collection"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f >nul 2>nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d 4 /f >nul 2>nul
reg add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f >nul 2>nul

:: Disable PowerShell Telemetry
call ".\utils\message.cmd" "[Disable] PowerShell Telemetry"
setx POWERSHELL_TELEMETRY_OPTOUT 1 >nul 2>nul

:: Disable Skype Telemetry
call ".\utils\message.cmd" "[Disable] Skype Telemetry"
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "TraceLevelThreshold" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "EnableTracing" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "EnableTracing" /t REG_DWORD /d "0" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\Tracing\WPPMedia" /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Tracing\WPPMediaPerApp\Skype\ETW" /v "WPPFilePath" /t REG_SZ /d "%%SYSTEMDRIVE%%\TEMP\WPPMedia" /f >nul 2>nul