@ECHO OFF

SET POSH_PROFILE=Microsoft.PowerShell_profile.ps1
SET POSH_NAME=powershell.ps1
SET IM_SELECT=im-select.exe

REM posh
DEL "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" 
DEL "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" 
MKLINK "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%~dp0\powershell\%POSH_NAME%"
MKLINK "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%~dp0\powershell\%POSH_NAME%"

REM vim
IF NOT EXIST "%LOCALAPPDATA%\nvim" ( MKDIR "%LOCALAPPDATA%\nvim" )
DEL "%LOCALAPPDATA%\nvim\init.vim"
DEL "%USERPROFILE%\.ideavimrc"
MKLINK "%LOCALAPPDATA%\nvim\init.vim" "%~dp0\neovim\neovim.vim"
MKLINK "%USERPROFILE%\.ideavimrc" "%~dp0\neovim\neovim.vim"

REM vscode
DEL "%APPDATA%\Code\User\keybindings.json" 
DEL "%APPDATA%\Code\User\settings.json" 
MKLINK "%APPDATA%\Code\User\keybindings.json" "%~dp0\vscode\vscode-keybindings.json"
MKLINK "%APPDATA%\Code\User\settings.json" "%~dp0\vscode\vscode-settings.json"

COPY %~dp0\vscode\%IM_SELECT% C:\%IM_SELECT%

REM surfingkeys
DEL "%USERPROFILE%\surfingkeys.js"
MKLINK "%USERPROFILE%\surfingkeys.js" "%~dp0\surfingkeys\surfingkeys.js"

REM git
DEL "%USERPROFILE%\.gitconfig"
MKLINK "%USERPROFILE%\.gitconfig" "%~dp0\git\.gitconfig"

REM keypirinha
FOR %%a in (%~dp0\keypirinha\*.ini) do (
	DEL "%APPDATA%\Keypirinha\User\%%~nxa"
	MKLINK "%APPDATA%\Keypirinha\User\%%~nxa" "%%a"
)


PAUSE