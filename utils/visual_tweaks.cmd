@echo off

:::: SETTINGS ::::
:: Disable transparancy in taskbar, menu start ...
call ".\utils\message.cmd" "[Setting] Disable Transparency in taskbar/menu start"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul 2>nul

:: Windows Explorer to start on This PC instead of Quick Access 
call ".\utils\message.cmd" [Setting] Windows Explorer to start on This PC instead of Quick Access"
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f >nul 2>nul

:: Hide the search box from taskbar. You can still search by pressing the Win key and start typing what you're looking for 
:: 0 = hide completely, 1 = show only icon, 2 = show long search box
call ".\utils\message.cmd" [Setting] Hide the search box from taskbar."
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 1 /f >nul 2>nul

:::: DISABLES ::::
:: Disable windows animations, menu Start animations.
call ".\utils\message.cmd" [Disable] Windows animations, menu Start animations"
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting  /t REG_DWORD /d 3 /f >nul 2>nul
REG ADD "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078010000000 /f >nul 2>nul
REG ADD "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>nul

REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\AnimateMinMax" /v DefaultApplied  /t REG_DWORD /d 0 /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ComboBoxAnimation" /v DefaultApplied  /t REG_DWORD /d 0 /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\ControlAnimations" /v DefaultApplied  /t REG_DWORD /d 0 /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v DefaultApplied  /t REG_DWORD /d 0 /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimation" /v DefaultApplied  /t REG_DWORD /d 0 /f >nul 2>nul
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TooltipAnimation" /v DefaultApplied  /t REG_DWORD /d 0 /f >nul 2>nul

:: Disable News and Interests on Taskbar
call ".\utils\message.cmd" [Disable] News and Interests on Taskbar"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f >nul 2>nul