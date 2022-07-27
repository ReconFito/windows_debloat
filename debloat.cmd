@echo off
echo  ******************************************************************
echo  ^|CREDITS TO: https://github.com/semazurek/ET-All-in-One-Optimizer^|
echo  ^|             Modifications made @reconfito :)                   ^|
echo  ******************************************************************
echo.

goto check_permissions

:check_permissions
    pushd %~dp0
    net session >nul 2>&1
    if %errorlevel% == 0 (
        echo :::::::::  :::::::::: :::::::::  :::        ::::::::      ::: ::::::::::: 
        echo :+:    :+: :+:        :+:    :+: :+:       :+:    :+:   :+: :+:   :+:     
        echo +:+    +:+ +:+        +:+    +:+ +:+       +:+    +:+  +:+   +:+  +:+     
        echo +#+    +:+ +#++:++#   +#++:++#+  +#+       +#+    +:+ +#++:++#++: +#+     
        echo +#+    +#+ +#+        +#+    +#+ +#+       +#+    +#+ +#+     +#+ +#+     
        echo #+#    #+# #+#        #+#    #+# #+#       #+#    #+# #+#     #+# #+#     
        echo #########  ########## #########  ########## ########  ###     ### ###     
        echo Modificado por: @reconfito
        echo.
        echo.
        rem call ".\utils\test.cmd"

        call ".\utils\message.cmd" "[!] Elimando previos puntos de restauracion..." "danger"
        vssadmin delete shadows /all /quiet

        call ".\utils\message.cmd" "[!] Creando nuevo punto de restauracion..." "danger"
        powershell.exe -NoProfile -Command "Enable-ComputerRestore -Drive '%SystemDrive%'"
        powershell.exe -NoProfile -Command "CheckPoint-Computer -Description "DEBLOAT-RestorePoint" -RestorePointType "MODIFY_SETTINGS" "
        echo.

        call ".\utils\browser_cache.clean.cmd"
        call ".\utils\clean_temps.clean.cmd"
        call ".\utils\defender_cache.clean.cmd"
        call ".\utils\font_cache.clean.cmd"
        call ".\utils\game_bar.disable.cmd"
        call ".\utils\game_cache.clean.cmd"
        call ".\utils\icon_cache.clean.cmd"
        call ".\utils\performance_tweak_basic.cmd"
        call ".\utils\performance_tweak_advanced.cmd"
        call ".\utils\services.disable.cmd"
        call ".\utils\telemetry.disable.cmd"
        call ".\utils\visual_tweaks.cmd"
        call ".\utils\xbox_services.disable.cmd"
        call ".\utils\remove_default_apps.cmd"

        if %errorlevel% neq 0 ( goto error )

        call ".\utils\message.cmd" "[!] Ejecucion Finalizada." "success"
        timeout /t 5
        exit 

    ) else (
        call ".\utils\message.cmd" "[Error] Permisos actuales insuficientes!." "error"
        timeout
        if %errorlevel% neq 0 ( goto error )
    )

:error
    echo [%time:~0,8%] Semething when wrong! - Error Code: %errorlevel% >> debloat_log.txt 2>&1