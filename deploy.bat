@echo off
cls
echo Particle Saturn Launcher
echo ========================
echo.

:: Auto-detect environment and launch with priority
:: Priority: Node.js > Python

echo Detecting system environment...
echo.

:: Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [OK] Node.js detected, launching with recommended method...
    goto nodejs
)

:: Check if Python is installed
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [X] Node.js not detected
    echo [OK] Python detected, launching with Python...
    goto python
)

:: No Node.js or Python detected
    echo [X] Neither Node.js nor Python detected
    goto static

:nodejs
echo.
echo Starting server with Node.js...
start "Particle Saturn Server" cmd /k "npx serve"
ping -n 2 127.0.0.1 >nul
echo Server started, opening browser...
start msedge http://localhost:3000/particleSaturn.html
exit /b 0

:python
echo.
echo Starting server with Python...
start "Particle Saturn Server" cmd /k "python -m http.server 8000"
ping -n 2 127.0.0.1 >nul
echo Server started, opening browser...
start msedge http://localhost:8000/particleSaturn.html
exit /b 0

:static
echo.
echo This application requires a web server to function properly.
echo Please install either:
echo 1. Node.js (Recommended): https://nodejs.org/
echo 2. Python: https://www.python.org/
echo.
echo After installation, run this script again.
echo.
pause
exit /b 1

:: If execution reaches here, unexpected error occurred
echo.
echo Error during startup!
pause
exit /b 1