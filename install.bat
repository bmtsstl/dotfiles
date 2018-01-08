@echo off
cd %~dp0
git config user.name "ryouser"
git config user.email "35141868+ryouser@users.noreply.github.com"

call %~dp0deploy.bat
