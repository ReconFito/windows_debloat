@echo off

call ".\utils\message.cmd" "[Clean] Window Font Cache"
net stop FontCache >nul 2>nul
net stop FontCache3.0.0.0 >nul 2>nul
del "%WinDir%\ServiceProfiles\LocalService\AppData\Local\FontCache\*.dat" /F /Q /S >nul 2>nul
del "%WinDir%\SysNative\FNTCACHE.DAT" /F /Q /S >nul 2>nul
del "%WinDir%\System32\FNTCACHE.DAT" /F /Q /S >nul 2>nul
net start FontCache >nul 2>nul
net start FontCache3.0.0.0 >nul 2>nul