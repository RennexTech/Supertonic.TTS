@echo off
setlocal
cd /d "%~dp0"
set PY=.venv\Scripts\python.exe

if not exist "%PY%" (
    echo [*] Creating virtual environment...
    py -3.12 -m venv .venv
    "%PY%" -m pip install --upgrade pip
    "%PY%" -m pip install supertonic soundfile numpy pygame
)

echo [*] Launching Supertonic Studio Pro...
"%PY%" supertonic_studio_pro.py
if errorlevel 1 (
    echo.
    echo [X] GUI crashed. Scroll up for details.
    pause
)