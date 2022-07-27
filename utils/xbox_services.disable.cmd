@echo off

call ".\utils\message.cmd" "[Disable] Xbox Services"
sc config XblAuthManager start= disabled >nul 2>nul
sc config XboxNetApiSvc start= disabled >nul 2>nul
sc config XblGameSave start= disabled >nul 2>nul