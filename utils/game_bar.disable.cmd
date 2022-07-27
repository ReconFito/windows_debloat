@echo off

:: Turning Off Windows Game Bar/DVR
call ".\utils\message.cmd" "[Disable] Windows Game Bar/DVR"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>nul

:: Removing Windows Game Bar
call ".\utils\message.cmd" "[Remove] Windows Game Bar"
powerShell -NoProfile -Command "Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage"
powerShell -NoProfile -Command "Get-AppxPackage *XboxGameOverlay* | Remove-AppxPackage"
PowerShell -NoProfile -Command "Get-AppxPackage *XboxSpeechToTextOverlay* | Remove-AppxPackage"