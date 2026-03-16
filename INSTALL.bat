@ECHO OFF

SET POSH_PROFILE=Microsoft.PowerShell_profile.ps1
SET POSH_NAME=powershell.ps1
SET IM_SELECT=im-select.exe


DEL "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" 
DEL "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" 
MKLINK "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%~dp0\%POSH_NAME%"
MKLINK "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%~dp0\%POSH_NAME%"

IF NOT EXIST "%LOCALAPPDATA%\nvim" ( MKDIR "%LOCALAPPDATA%\nvim" )
DEL "%LOCALAPPDATA%\nvim\init.vim" 
MKLINK "%LOCALAPPDATA%\nvim\init.vim" "%~dp0\neovim.vim"

DEL "%APPDATA%\Code\User\keybindings.json" 
DEL "%APPDATA%\Code\User\settings.json" 
MKLINK "%APPDATA%\Code\User\keybindings.json" "%~dp0\vscode-keybindings.json"
MKLINK "%APPDATA%\Code\User\settings.json" "%~dp0\vscode-settings.json"

COPY %~dp0\%IM_SELECt% C:\%IM_SELECT%
PAUSE