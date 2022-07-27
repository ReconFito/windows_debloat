@echo off

call ".\utils\message.cmd" "[Clean] All Web Browsers Cache/Logs"
del "%LocalAppData%\Google\Chrome\User Data\Default\Cache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Google\Chrome\User Data\Default\Media Cache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Google\Chrome\User Data\Default\GPUCache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Google\Chrome\User Data\Default\Storage\ext" /F /Q /S >nul 2>nul
del "%LocalAppData%\Google\Chrome\User Data\Default\Service Worker" /F /Q /S >nul 2>nul
del "%LocalAppData%\Google\Chrome\User Data\ShaderCache" /F /Q /S >nul 2>nul

del "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Media Cache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge\User Data\Default\GPUCache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Storage\ext" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Service Worker" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge\User Data\ShaderCache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Cache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Media Cache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\GPUCache" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Storage\ext" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge SxS\User Data\Default\Service Worker" /F /Q /S >nul 2>nul
del "%LocalAppData%\Microsoft\Edge SxS\User Data\ShaderCache" /F /Q /S >nul 2>nul

del "%LocalAppData%\Opera Software\Opera Stable\cache" /F /Q /S >nul 2>nul
del "%AppData%\Opera Software\Opera Stable\GPUCache" /F /Q /S >nul 2>nul
del "%AppData%\Opera Software\Opera Stable\ShaderCache" /F /Q /S >nul 2>nul
del "%AppData%\Opera Software\Opera Stable\Jump List Icons" /F /Q /S >nul 2>nul
del "%AppData%\Opera Software\Opera Stable\Jump List IconsOld\Jump List Icons" /F /Q /S >nul 2>nul

del "%LocalAppData%\Vivaldi\User Data\Default\Cache" /F /Q /S >nul 2>nul