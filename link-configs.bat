@ECHO off

SET POSH_PROFILE = Microsoft_PowerShell_profile.ps1
MKLINK "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%USERPROFILE%\config\%POSH_PROFILE%"
MKLINK "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%USERPROFILE%\config\%POSH_PROFILE%"
