@echo off
setlocal

:: Check if Windows Terminal Canary is installed. will need to account for different path names
IF EXIST "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe" (
    echo Windows Terminal Canary is already installed.
) ELSE (
    echo Windows Terminal Canary is not installed. Installing now...
    
    :: Download and install Windows Terminal Canary from Microsoft Store using PowerShell
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/terminal' -OutFile 'C:\Windows\Temp\WindowsTerminalCanary.appx'"

    :: Install the .appx package
    powershell -Command "Add-AppxPackage -Path 'C:\Windows\Temp\WindowsTerminalCanary.appx'"

    :: Clean up the downloaded .appx file
    del "C:\Windows\Temp\WindowsTerminalCanary.appx"
    
    echo Windows Terminal Canary has been installed.
)
:: needs testing

:: Delete the existing settings.json if it exists
IF EXIST "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe\LocalState\settings.json" (
    echo Deleting existing settings.json...
    del "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe\LocalState\settings.json"
)

:: Create symbolic link to WSL settings.json
echo Creating symbolic link for settings.json...
mklink "C:\Users\rjm\AppData\Local\Packages\Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe\LocalState\settings.json" "\\wsl$\Ubuntu\home\rjm\dotfiles\WindowsTerminalCanary\settings.json"

echo Windows Terminal symlink setup completed.
endlocal


REM local
REM C:\Users\rjm>"\\wsl$\Ubuntu\home\rjm\dotfiles\WindowsTerminalCanary\install.bat"

