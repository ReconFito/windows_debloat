@echo offf

:: Cleaning Disk - CCleaner
if not exist "%programfiles%\CCleaner\CCleaner.exe" goto NoCC
if not exist "%programfiles%\CCleaner\CCleaner64.exe" goto NoCC

:NoCC
call ".\utils\message.cmd" "[Clean] Games Platforms Cache/Logs"
del %localappdata%\EpicGamesLauncher\Saved\Logs /F /Q /S >nul 2>nul
del %localappdata%\CrashReportClient\Saved\Logs /F /Q /S >nul 2>nul

del "%localappdata%\Steam\htmlcache\Code Cache" /F /Q /S >nul 2>nul
del %localappdata%\Steam\htmlcache\GPUCache /F /Q /S >nul 2>nul
del %localappdata%\Steam\htmlcache\Cache /F /Q /S >nul 2>nul

del %AppData%\Origin\Telemetry /F /Q /S >nul 2>nul
del %AppData%\Origin\Logs /F /Q /S >nul 2>nul
del %AppData%\Origin\NucleusCache /F /Q /S >nul 2>nul
del %AppData%\Origin\ConsolidatedCache /F /Q /S >nul 2>nul
del %AppData%\Origin\CatalogCache /F /Q /S >nul 2>nul
del %localAppData%\Origin\ThinSetup /F /Q /S >nul 2>nul
del %AppData%\Origin\Telemetry /F /Q /S >nul 2>nul
del %localAppData%\Origin\Logs /F /Q /S >nul 2>nul

del %localAppData%\Battle.net\Cache /F /Q /S >nul 2>nul
del %AppData%\Battle.net\Logs /F /Q /S >nul 2>nul
del %AppData%\Battle.net\Errors /F /Q /S >nul 2>nul