@echo off
mkdir "%USERPROFILE%\vimfiles"

del "%USERPROFILE%\vimfiles\vimrc"
mklink "%USERPROFILE%\vimfiles\vimrc" "%~dp0dotfiles\vimrc"
if %ERRORLEVEL% NEQ 0 copy "%~dp0dotfiles\vimrc" "%USERPROFILE%\vimfiles\vimrc"

del "%USERPROFILE%\vimfiles\gvimrc"
mklink "%USERPROFILE%\vimfiles\gvimrc" "%~dp0dotfiles\gvimrc"
if %ERRORLEVEL% NEQ 0 copy "%~dp0dotfiles\gvimrc" "%USERPROFILE%\vimfiles\gvimrc"
