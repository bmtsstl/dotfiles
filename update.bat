@echo off

git pull --ff-only
if %ERRORLEVEL% NEQ 0 (
	pause
	exit
)

call deploy.bat
