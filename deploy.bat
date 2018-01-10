@echo off
mkdir "%USERPROFILE%\vimfiles"
mklink "%USERPROFILE%\vimfiles\vimrc" "%~dp0dotfiles\vimrc"
mklink "%USERPROFILE%\vimfiles\gvimrc" "%~dp0dotfiles\gvimrc"
