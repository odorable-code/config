@ECHO off

SET POSH_PROFILE=Microsoft.PowerShell_profile.ps1
MKLINK "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%~dp0\%POSH_PROFILE%"
MKLINK "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%~dp0\%POSH_PROFILE%"

MKDIR "%LOCALAPPDATA%\nvim"
MKLINK "%LOCALAPPDATA%\nvim\init.vim" "%~dp0\init.vim"

MKLINK "%APPDATA%\CODE\USER\keybindings.json" "%~dp0\vscode-keybindings.json"
MKLINK "%APPDATA%\CODE\USER\settings.json" "%~dp0\vscode-settings.json"