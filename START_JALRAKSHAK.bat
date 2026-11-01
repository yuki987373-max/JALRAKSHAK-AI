@echo off
setlocal
cd /d "%~dp0"
title JalRakshak AI v3.0
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js LTS was not found.
  echo Please install the LTS version from https://nodejs.org/
  echo Then double-click this file again.
  pause
  exit /b 1
)
where npm >nul 2>nul
if errorlevel 1 (
  echo npm was not found. Reinstall Node.js LTS and try again.
  pause
  exit /b 1
)
if not exist "node_modules\vite\bin\vite.js" (
  echo First-time setup: installing JalRakshak AI dependencies.
  echo This requires an internet connection and may take a few minutes.
  call npm install --no-audit --no-fund
  if errorlevel 1 (
    echo.
    echo Dependency installation failed. Check your internet connection.
    echo No project files were deleted. Run this launcher again after reconnecting.
    pause
    exit /b 1
  )
)
echo.
echo Starting JalRakshak AI v3.0...
echo Keep this window open while using the application.
echo Open http://localhost:5173 in your browser.
echo Press Ctrl+C to stop the application.
call npm run dev
pause
