@echo off
mkdir "%HOMEDRIVE%%HOMEPATH%\vimfiles"

move /Y "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc" "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc~"
mklink "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc" "%~dp0dot\vimrc"
if %ERRORLEVEL% NEQ 0 mklink /H "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc" "%~dp0dot\vimrc"
if %ERRORLEVEL% NEQ 0 copy /Y "%~dp0dot\vimrc" "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc"

move /Y "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc" "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc~"
mklink "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc" "%~dp0dot\gvimrc"
if %ERRORLEVEL% NEQ 0 mklink /H "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc" "%~dp0dot\gvimrc"
if %ERRORLEVEL% NEQ 0 copy /Y "%~dp0dot\gvimrc" "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc"
