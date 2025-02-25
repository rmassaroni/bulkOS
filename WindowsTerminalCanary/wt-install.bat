REM @echo off
setlocal

:: Define the main Windows Terminal install path (modifiable)
set WT_PATH=C:\Users\%USERNAME%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe

:: Check if Windows Terminal is installed. will need to account for different path names
if exist "%WT_PATH%" (
    echo Windows Terminal is already installed.
) ELSE (
    echo Windows Terminal is not installed. Installing now...

    :: Attempt to install with winget, fallback to choco if winget is not available
    winget install --id Microsoft.WindowsTerminal -e -h
    if %errorlevel% neq 0 (
        echo Winget install failed, trying Chocolatey...
        powershell -Command "choco install microsoft-windows-terminal -y"
    )


    echo Windows Terminal Canary has been installed.
)

:: Wait a few seconds to ensure installation completion
timeout /t 3 /nobreak >nul

:: Ensure Windows Terminal is installed before proceeding
if not exist "%WT_PATH%" (
    echo Error: Windows Terminal installation failed. Exiting...
    exit /b 1
)

:: Backup existing settings.json before deleting
set SETTINGS_PATH=%WT_PATH%\LocalState\settings.json
if exist "%SETTINGS_PATH%" (
    echo Backing up existing settings.json...
    move /y "%SETTINGS_PATH%" "%SETTINGS_PATH%.backup"
)

:: Create symbolic link for settings.json (WSL path)
set WSL_SETTINGS="\\wsl$\Ubuntu\home\%USERNAME%\dotfiles\WindowsTerminalCanary\settings.json"
if exist %WSL_SETTINGS% (
    echo Creating symbolic link for settings.json...
    mklink "%SETTINGS_PATH%" %WSL_SETTINGS%
    if %errorlevel% neq 0 (
        echo Error: Failed to create symlink.
        exit /b 1
    ) else (
        echo Symlink created successfully.
    )
) else (
    echo Error: WSL settings.json not found at %WSL_SETTINGS%.
)
echo Windows Terminal setup completed successfully.
endlocal


REM local
REM C:\Users\rjm>"\\wsl$\Ubuntu\home\rjm\dotfiles\WindowsTerminalCanary\install.bat"
REM https://github.com/microsoft/terminal
REM should refactor dir to windows terminal
REM should choose a place in windows fs to store windows specific dotfiles
