Clear-Host;

#FIX opcion del menu Usuarios+Windows+JCOP4 presenta un extraño compartamiento al momento de realizar la busqueda de su instalador el servidor devuelve un campo vacio,
# en el sitio web como al cambiar y luego volver a seleccionar dicho elemento el server response con otro instalador hasta despues que se vuelve
# seleccionar nuevamente la opcion

$sesion = New-Object Microsoft.PowerShell.Commands.WebRequestSession

$ErrorActionPreference = "Stop";

$base_url = "https://soportefirmadigital.com/sfdj/dl.aspx?lang=es";
$target = @{"selectInstaladores" = 'ctl00$certContents$ddlInstaladores'; "btnDescargar" = 'ctl00$certContents$LinkButton3' }
$payload = @{
    "__EVENTTARGET"                      = ""
    "__EVENTARGUMENT"                    = ""
    "__LASTFOCUS"                        = ""
    "__VIEWSTATE"                        = ""
    "__VIEWSTATEGENERATOR"               = ""
    "__EVENTVALIDATION"                  = ""
    'ctl00$certContents$hiddenISO'       = ""
    'ctl00$certContents$hidden_ISO_URL'  = "-"
    'ctl00$certContents$ddlInstaladores' = ""
    #"ctl00`$certContents`$txtDescripcion" = ""
    'ctl00$certContents$txtSerialNumber' = ""
    #"ctl00`$certContents`$hiddenABID" = ""
    'ctl00$certContents$chkConfirmo'     = ""
}

function Get-Installers {
    $response = Invoke-WebRequest -Uri $base_url  -WebSession $sesion -UseBasicParsing;

    # Estable el valor de los parametro requeridos para .Net
    $payload["__VIEWSTATE"] = $response.InputFields.FindByName("__VIEWSTATE").value
    $payload["__EVENTVALIDATION"] = $response.InputFields.FindByName("__EVENTVALIDATION").value
    $payload["__VIEWSTATEGENERATOR"] = $response.InputFields.FindByName("__VIEWSTATEGENERATOR").value


    $regex = "(?:<select name=""?.*Instaladores.*""? [^>].*>)(?:\s*<option.*value=""([^""]+)"".*>(.*?)</option>\s*)+</select>"
    $available_installers = $response.Content | sls -patt $regex;
    if ([String]::IsNullOrEmpty($available_installers)) {
        Write-Host "Ha ocurrido un error, no pudimos obtener la lista de instaladores!!" -fore red;
        return;
    }

    $opcionesMenu = ($available_installers.Matches.Groups[1] | select -exp Captures).Value
    [string[]]$installer_menu_options = @(0..$opcionesMenu.Length)

    for ($i = 0; $i -le $opcionesMenu.Length - 1; ++$i) {
        $installer_menu_options[$i] = $opcionesMenu[$i]
    }
    $installer_menu_options[$opcionesMenu.Length] = "Salir o presiona [Ctrl + c]"
    $installer_list = ($available_installers.Matches.Groups[1] | select -exp Captures).Value;
    # $installer_menu_options = ($available_installers.Matches.Groups[2] | select -exp Captures).Value;)

    Write-Host "` -> Instaladores Disponibles <-" -fore Green;
    for ($i = 0; $i -le $installer_menu_options.Length - 1; ++$i) {
        $opcion = $installer_menu_options[$i]
        if ($opcion.ToLower() -like "*certificados*") {
            Write-Host "` $i - $($opcion.Trim())" -NoNewline
            Write-Host " (No requiere serial de tarjeta)" -fore Yellow
        }
        else {
            Write-Host "` $i - $($opcion.Trim())";
        }
    }
    [int]$index = 0;

    $exito = [int]::TryParse( (Read-Host "Selecciona el instalador que deseas descargar"), [ref]$index); 
    if (-not $exito) {
        Write-Host "`nDebes de seleccionar un instalador!!!`n" -fore Red;
        return;
    }
    if ($exito) {
        if ($index -ge $installer_menu_options.Length -or $index.Length -gt 1) {
            Write-Host "`nOpcion invalida!!!`n" -fore Red;
            return;
        }

        if ($index -eq 9) {
            Clear-Host;
            return;
        }
    }

    $selection = $installer_list[$index];
    $requiereSerial = if ($selection.ToLower() -like "*certificados*") { $false } else { $true }
    return $selection, $requiereSerial
}


function Main {
    $banner = "   _______    ______    ______   _______  `n"
    $banner += '  /       \  /      \  /      \ /       \ '
    $banner += "`n"
    $banner += '  $$$$$$$  |/$$$$$$  |/$$$$$$  |$$$$$$$  |'
    $banner += "`n"
    $banner += '  $$ |__$$ |$$ |  $$/ $$ |  $$/ $$ |__$$ |'
    $banner += "`n"
    $banner += '  $$    $$< $$ |      $$ |      $$    $$< '
    $banner += "`n"
    $banner += '  $$$$$$$  |$$ |   __ $$ |   __ $$$$$$$  |'
    $banner += "`n"
    $banner += '  $$ |__$$ |$$ \__/  |$$ \__/  |$$ |  $$ |'
    $banner += "`n"
    $banner += '  $$    $$/ $$    $$/ $$    $$/ $$ |  $$ |'
    $banner += "`n"
    $banner += '  $$$$$$$/   $$$$$$/   $$$$$$/  $$/   $$/ '
    $banner += "`n"
    $banner += '  -(Descargar firma digital | por @eenm)-'
    $banner += "`n"
    write-host $banner;

    $nombreInstalador, $requiereSerial = Get-Installers;
    if ([string]::IsNullOrEmpty($nombreInstalador)) { return; }
    
    if ($requiereSerial) {
        $serial = Read-Host "`nIngrese el numero de serie de la tarjeta";
        if ([string]::IsNullOrEmpty($serial.Trim())) {
            Write-Host "`nNumero de serie es requerido para poder realizar la descarga del instalador !!" -fore Red;
            read-host;
            return;
        }
    }

    $progreso = New-Object System.Management.Automation.PSDataCollection[psobject]

    $script = {
        ## inicializa la descarga del instalador seleccionado por el usuario
        param($url, $payload, $nombreInstalador, $serial, $webSession, $progress)

        $ErrorActionPreference = "Stop";

        try {
            # Obtiene el nombre del archivo del instalador que el usuario desea descargar
            $payload.__EVENTTARGET = 'ctl00$certContents$ddlInstaladores';
            $payload.'ctl00$certContents$ddlInstaladores' = $nombreInstalador
    
            $response = Invoke-WebRequest -Uri $url -Method Post -Body $payload -UseBasicParsing -WebSession $webSession;

            # Actualiza los valore requeridos por .Net
            $payload["__VIEWSTATE"] = $response.InputFields.FindByName("__VIEWSTATE").value
            $payload["__EVENTVALIDATION"] = $response.InputFields.FindByName("__EVENTVALIDATION").value
            $payload["__VIEWSTATEGENERATOR"] = $response.InputFields.FindByName("__VIEWSTATEGENERATOR").value
    
            $nombreArchivoInstalador = $response.InputFields.FindByName('ctl00$certContents$hiddenISO')

            # Actualiza los valores a enviar en la petición para poder realizar la descarga del archivo
            $payload.__EVENTTARGET = 'ctl00$certContents$LinkButton3'
            $payload.'ctl00$certContents$hiddenISO' = $nombreArchivoInstalador.value
            $payload.'ctl00$certContents$chkConfirmo' = "on"
            $payload.'ctl00$certContents$txtSerialNumber' = $serial
            # $payload.'ctl00$certContents$ddlInstaladores' = $nombreInstalador


            $directorio = if ($PSVersionTable.OS -like "*linux*") { "$($env:HOME)/Descargas" } else { "$($env:USERPROFILE)\Downloads" };
            $rutaGuardado = [System.IO.Path]::Join($directorio, $nombreArchivoInstalador.value);

            # Descarga del instalador

            $diccionario = New-Object "System.Collections.Generic.Dictionary[String, String]";
            foreach ($k in $payload.Keys) {
                $diccionario.Add($k, [string]$payload[$k])
            }

            $clienteHttp = New-Object System.Net.Http.HttpClient
            $datosFormulario = New-Object System.Net.Http.FormUrlEncodedContent $diccionario
            $mensajeHttp = [System.Net.Http.HttpRequestMessage]::new("POST", $url)
            $mensajeHttp.Content = $datosFormulario

            $response = $clienteHttp.SendAsync($mensajeHttp, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead).Result

            # Si la respuesta del servidor es un error
            if ($response.Content.Headers.ContentType -like "text/html*") {
                $errores = $response.Content.ReadAsStringAsync().Result
                $mensajeError = $errores  | Select-String -Pattern '<span[^>]*id="ctl00_certContents_lblErr"[^>]*><font.*?>(.*?)</font><\/span>' -AllMatches
                if ($mensajeError.Matches) {
                    return @($false, "Server error:`n`t$($mensajeError.Matches.Groups[1].Value)")
                }
            }

            # Inicia la descarga del archivo instalador
            $totalBytes = $response.Content.Headers.ContentLength
            $stream = $response.Content.ReadAsStreamAsync().Result
            $file = [System.IO.File]::Create($rutaGuardado)

            $buffer = New-Object byte[] 8192
            $bytesRead = 0
            $read = 0

            while (($read = $stream.Read($buffer, 0, $buffer.Length)) -gt 0) {
                $file.Write($buffer, 0, $read)
                $bytesRead += $read
                $percent = [math]::Round(($bytesRead / $totalBytes) * 100, 2)

                # Enviar mensaje al hilo principal
                $progress.Add([pscustomobject]@{
                        BytesRead = $bytesRead
                        Total     = $totalBytes
                        Percent   = $percent
                    })
            }

            $file.Close()
            $stream.Close()

            return $true, $rutaGuardado
        }
        catch [System.Exception] {
            if (Test-Path $rutaGuardado) { remove-item $rutaGuardado }
            return $false, "Error interno: `n`t$($_.Exception.Message)"
        }
    }

    $runspace = [runspacefactory]::CreateRunspace()
    $runspace.Open()

    $powershell = [powershell]::Create()
    $powershell.Runspace = $runspace
    # $url, $data, $nombreInstalador, $serial, $webSession
    [void]$powershell.AddScript($script).AddArgument($base_url).AddArgument($payload).AddArgument($nombreInstalador).AddArgument($serial).AddArgument($sesion).AddArgument($progreso) ;
    

    Write-Host $("-" * 100);
    $manejador = $powershell.BeginInvoke()
    $lastIndex = -1
    Write-Host
    while (-not $manejador.IsCompleted) {
        if ($progreso.Count -gt $lastIndex) {
            $rec = $progreso[-1]
            if ($rec.Percent -ne $lastPercent) {

                Write-Host ("`r[{0}%] Descargado {1:N0} / {2:N0} Mb" -f $rec.Percent, $($rec.BytesRead / 1Mb), $($rec.Total / 1Mb)) -NoNewline -fore Yellow
                $lastIndex = $rec.Percent
            }
        }
        Start-Sleep -Milliseconds 100
    }
    # Al terminar la descarga
    if ($progreso.Count -gt 0) {
        $final = $progreso[-1]
        Write-Host ("`r[100%] Descargado {0:N0} / {0:N0} Mb" -f $($final.Total / 1Mb)) -NoNewline -fore Yellow
    }
    Write-Host "`nDescarga finalizada";

    ## Obtener los resultados del runspace y cerrarlo
    $resultado = $powershell.EndInvoke($manejador)
    $runspace.Close()
    $runspace.Dispose()
    $powershell.Dispose()

    $ok, $mensaje = $resultado

    if ($ok) {
        Write-Host "`nDescarga exitosa"
        Write-Host "La descarga se guardo en.: " -NoNewline
        Write-Host $mensaje -fore Green;
    }
    else {
        Write-Host "Error.: " -NoNewline 
        Write-Host $mensaje -fore Red

    }
}

Main
