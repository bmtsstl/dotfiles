@echo off
mkdir "%USERPROFILE%\vimfiles\vimrc"
mklink /H "%USERPROFILE%\vimfiles\vimrc" "%~dp0dotfiles\vimrc"
mklink /H "%USERPROFILE%\vimfiles\gvimrc" "%~dp0dotfiles\gvimrc"
