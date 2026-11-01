@echo off
setlocal
cd /d "%~dp0"
echo JalRakshak AI v3.0.0 - repairing PDF import dependency...
echo.
if not exist package.json (
  echo ERROR: package.json was not found. Run this file from the extracted project folder.
  pause
  exit /b 1
)
call npm install pdfjs-dist@6.4.299
if errorlevel 1 goto failed
call npm install
if errorlevel 1 goto failed
echo.
echo PDF dependency installed. Start JalRakshak with: npm run dev
pause
exit /b 0
:failed
echo.
echo Installation failed. Check your internet connection and npm error above.
pause
exit /b 1
