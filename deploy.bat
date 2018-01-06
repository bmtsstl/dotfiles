@echo off
mkdir "%USERPROFILE%\vimfiles\vimrc"
mklink /H "%USERPROFILE%\vimfiles\vimrc" "%~dp0vimrc"
mklink /H "%USERPROFILE%\vimfiles\gvimrc" "%~dp0gvimrc"
