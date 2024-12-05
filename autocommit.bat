@echo off
setlocal

:: Configura el directorio del repositorio
set REPO_DIR="C:\Users\Usuario\Desktop\CronicasPluviales"

:: Intervalo en segundos
set INTERVALO=60

echo Monitoreando cambios en %REPO_DIR% cada %INTERVALO% segundos...

:loop
cd /d %REPO_DIR%
git status --porcelain > nul
if not errorlevel 1 (
    echo Cambios detectados. Realizando commit y push...
    git add .
    git commit -m "Auto commit: %date% %time%"
    git push
) else (
    echo Sin cambios detectados.
)
timeout /t %INTERVALO% > nul
goto loop