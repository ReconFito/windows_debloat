@echo off

setlocal
set type=%~2
if not defined type (set "type=info")

if %type% == info (powershell.exe -NoProfile -Command "Write-Host '%~1' -Foreground Blue")
if %type% == success (powershell.exe -NoProfile -Command "Write-Host '%~1' -Foreground Green")
if %type% == danger (powershell.exe -NoProfile -Command "Write-Host '%~1' -Foreground Yellow")
if %type% == error (powershell.exe -NoProfile -Command "Write-Host '%~1' -Foreground Red")
endlocal