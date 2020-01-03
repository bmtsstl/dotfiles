@echo off
cd "%~dp0"

git pull --ff-only
if %ERRORLEVEL% NEQ 0 (
	pause
	exit /b
)

call deploy.bat
