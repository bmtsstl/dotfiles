@echo off
mkdir "%HOMEDRIVE%%HOMEPATH%\vimfiles"

del "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc"
mklink "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc" "%~dp0dotfiles\vimrc"
if %ERRORLEVEL% NEQ 0 copy "%~dp0dotfiles\vimrc" "%HOMEDRIVE%%HOMEPATH%\vimfiles\vimrc"

del "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc"
mklink "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc" "%~dp0dotfiles\gvimrc"
if %ERRORLEVEL% NEQ 0 copy "%~dp0dotfiles\gvimrc" "%HOMEDRIVE%%HOMEPATH%\vimfiles\gvimrc"
