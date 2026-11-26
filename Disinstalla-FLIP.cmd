@echo off
setlocal
cd /d "%~dp0"
echo Rimozione di FLIP in corso...
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference='Stop';" ^
  "$target = Join-Path ([Environment]::GetFolderPath('LocalApplicationData')) 'Programs\Flip';" ^
  "$exe = Join-Path $target 'Flip.exe';" ^
  "if (Test-Path -LiteralPath $exe -PathType Leaf) { & $exe --stop 2>$null; Start-Sleep -Milliseconds 700; & $exe --disable-startup 2>$null; & $exe --remove-shortcuts 2>$null; };" ^
  "$desktopLnk = Join-Path ([Environment]::GetFolderPath('DesktopDirectory')) 'Flip.lnk';" ^
  "$startLnk = Join-Path ([Environment]::GetFolderPath('StartMenu')) 'Programs\Flip.lnk';" ^
  "Remove-Item -LiteralPath $desktopLnk,$startLnk -Force -ErrorAction SilentlyContinue;" ^
  "if (Test-Path -LiteralPath $target) { Remove-Item -LiteralPath $target -Recurse -Force };" ^
  "Write-Host 'FLIP disinstallato con successo.' -ForegroundColor Green"
if errorlevel 1 (
  echo.
  echo [ERRORE] Impossibile rimuovere tutti i file: chiudi prima FLIP dall'icona vicino all'orologio e riprova.
  pause
  exit /b 1
)
echo.
pause
