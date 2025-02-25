REM @echo off
setlocal

REM :: Check if Windows Terminal is installed. will need to account for different path names
IF EXIST "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe" (
    echo Windows Terminal is already installed.
) ELSE (
    echo Windows Terminal is not installed. Installing now...


    REM might use winget instead
    powershell -Command "choco install microsoft-windows-terminal"
    REM choco upgrade microsoft-windows-terminal

    echo Windows Terminal Canary has been installed.
)
REM :: needs testing

REM :: Delete the existing settings.json if it exists. might change to backup instead
IF EXIST "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" (
    echo Deleting existing settings.json...
    del "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
)

REM :: Create symbolic link to WSL settings.json
echo Creating symbolic link for settings.json...
mklink "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "\\wsl$\Ubuntu\home\rjm\dotfiles\WindowsTerminalCanary\settings.json"

echo Windows Terminal symlink setup completed.
endlocal


REM local
REM C:\Users\rjm>"\\wsl$\Ubuntu\home\rjm\dotfiles\WindowsTerminalCanary\install.bat"
REM https://github.com/microsoft/terminal
REM should refactor dir to windows terminal
REM should choose a place in windows fs to store windows specific dotfiles
