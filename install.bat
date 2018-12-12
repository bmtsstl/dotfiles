@echo off
cd "%~dp0"
git config user.name "bmtsstl"
git config user.email "35141868+bmtsstl@users.noreply.github.com"

call "%~dp0deploy.bat"
