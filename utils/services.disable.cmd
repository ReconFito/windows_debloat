@echo off

:: Disabling unnecessary applications at startup
call ".\utils\message.cmd" "[Disable] Unnecessary applications at startup"

:: Java Update Checker x64
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f >nul 2>nul

:: Mini Partition Tool Wizard Updater
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "MTPW" /f >nul 2>nul

:: Teams Machine Installer
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /v "TeamsMachineInstaller" /f >nul 2>nul

:: Cisco Meeting Daemon
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "CiscoMeetingDaemon" /f >nul 2>nul

:: Adobe Reader Speed Launcher
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Adobe Reader Speed Launcher" /f >nul 2>nul

:: CCleaner Smart Cleaning/Monitor
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "CCleaner Smart Cleaning" /f >nul 2>nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "CCleaner Monitor" /f >nul 2>nul

:: Spotify Web Helper
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Spotify Web Helper" /f >nul 2>nul

:: Gaijin.Net Updater
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Gaijin.Net Updater" /f >nul 2>nul

:: Microsoft Teams Update
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "com.squirrel.Teams.Teams" /f >nul 2>nul

:: Google Update
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Google Update" /f >nul 2>nul

:: Microsoft Edge Update
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Microsoft Edge Update" /f >nul 2>nul

:: BitTorrent Bleep
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "BitTorrent Bleep" /f >nul 2>nul

:: Skype
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "Skype" /f >nul 2>nul

:: Adobe Update Startup Utility
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v "adobeAAMUpdater-1.0" /f >nul 2>nul
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v "AdobeAAMUpdater" /f >nul 2>nul

:: iTunes Helper
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v "iTunesHelper" /f >nul 2>nul

:: CyberLink Update Utility
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v "UpdatePPShortCut" /f >nul 2>nul

:: MSI Live Update
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Live Update" /f >nul 2>nul

:: Wondershare Helper Compact
reg delete "HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Wondershare Helper Compact" /f >nul 2>nul

:: Cisco AnyConnect Secure Mobility Agent
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Cisco AnyConnect Secure Mobility Agent for Windows" /f >nul 2>nul

:: Opera Browser Assistant (Update/Tray)
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Opera Browser Assistant" /f >nul 2>nul

:: Steam Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Steam" /f >nul 2>nul

:: Origin Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "EADM" /f >nul 2>nul

:: Epic Games Launcher Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "EpicGamesLauncher" /f >nul 2>nul

:: Gog Galaxy Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "GogGalaxy" /f >nul 2>nul

:: Skype for Desktop Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Skype for Desktop" /f >nul 2>nul

:: Wargaming.net Game Center
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Wargaming.net Game Center" /f >nul 2>nul

:: uTorrent Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "ut" /f >nul 2>nul

:: Lync - Skype for Business Autorun
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Lync" /f >nul 2>nul

:: Google Chrome Installer (Update)
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components" /v "Google Chrome" /f >nul 2>nul

:: Microsoft Edge Installer (Update)
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components" /v "Microsoft Edge" /f >nul 2>nul

:: Discord Update
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Discord" /f >nul 2>nul

:: Ubisoft Game Launcher
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Ubisoft Game Launcher" /f >nul 2>nul