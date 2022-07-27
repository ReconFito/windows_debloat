@echo off

call ".\utils\message.cmd" "[Clean] Windows Defender Cache/Logs"
del "%ProgramData%\Microsoft\Windows Defender\Network Inspection System\Support\*.log" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\CacheManager" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\ReportLatency\Latency" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Service\*.log" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\MetaStore" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Support" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Quick" /F /Q /S >nul 2>nul
del "%ProgramData%\Microsoft\Windows Defender\Scans\History\Results\Resource" /F /Q /S >nul 2>nul