@ECHO off

SET POSH_PROFILE=Microsoft.PowerShell_profile.ps1
MKLINK "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%~dp0\%POSH_PROFILE%"
MKLINK "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%~dp0\%POSH_PROFILE%"

MKDIR "%LOCALAPPDATA%\nvim"
MKLINK "%LOCALAPPDATA%\nvim\init.vim" "%~dp0\init.vim"
