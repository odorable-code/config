@ECHO OFF

SET POSH_PROFILE=Microsoft.PowerShell_profile.ps1
SET POSH_NAME=powershell.ps1
SET IM_SELECT=im-select.exe

REM posh
MOVE /Y "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%.bak"
MOVE /Y "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%.bak" 
MKLINK "%USERPROFILE%\Documents\PowerShell\%POSH_PROFILE%" "%~dp0\powershell\%POSH_NAME%"
MKLINK "%USERPROFILE%\Documents\WindowsPowerShell\%POSH_PROFILE%" "%~dp0\powershell\%POSH_NAME%"

REM vim
IF NOT EXIST "%LOCALAPPDATA%\nvim" ( MKDIR "%LOCALAPPDATA%\nvim" )
MOVE /Y "%LOCALAPPDATA%\nvim\init.vim" "%LOCALAPPDATA%\nvim\init.vim.bak"
MOVE /Y "%USERPROFILE%\.ideavimrc" "%USERPROFILE%\.ideavimrc.bak"
MKLINK "%LOCALAPPDATA%\nvim\init.vim" "%~dp0\neovim\neovim.vim"
MKLINK "%USERPROFILE%\.ideavimrc" "%~dp0\neovim\neovim.vim"

REM vscode
MOVE /Y "%APPDATA%\Code\User\keybindings.json" "%APPDATA%\Code\User\keybindings.json.bak"
MOVE /Y "%APPDATA%\Code\User\settings.json" "%APPDATA%\Code\User\settings.json.bak"
MKLINK "%APPDATA%\Code\User\keybindings.json" "%~dp0\vscode\vscode-keybindings.json"
MKLINK "%APPDATA%\Code\User\settings.json" "%~dp0\vscode\vscode-settings.json"

COPY %~dp0\vscode\%IM_SELECT% C:\%IM_SELECT%

REM surfingkeys
MOVE /Y "%USERPROFILE%\surfingkeys.js" "%USERPROFILE%\surfingkeys.js.bak"
MKLINK "%USERPROFILE%\surfingkeys.js" "%~dp0\surfingkeys\surfingkeys.js"

REM git
MOVE /Y "%USERPROFILE%\.gitconfig" "%USERPROFILE%\.gitconfig.bak"
MKLINK "%USERPROFILE%\.gitconfig" "%~dp0\git\.gitconfig"

REM keypirinha
FOR %%a in (%~dp0\keypirinha\*.ini) do (
	MOVE /Y "%APPDATA%\Keypirinha\User\%%~nxa" "%APPDATA%\Keypirinha\User\%%~nxa.bak"
	MKLINK "%APPDATA%\Keypirinha\User\%%~nxa" "%%a"
)

REM autohotkey
FOR %%h in (%~dp0\autohotkey\*.ahk) do (
	MOVE /Y "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\%%~nxh" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\%%~nxh.bak"
	MKLINK "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\%%~nxh" "%%h"
)
PAUSE