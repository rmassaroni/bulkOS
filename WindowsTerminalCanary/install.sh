# cross platform method. prob doesnt work
cmd.exe /C "del C:\\Users\\rjm\\AppData\\Local\\Packages\\Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe\\LocalState\\settings.json && mklink C:\\Users\\rjm\\AppData\\Local\\Packages\\Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe\\LocalState\\settings.json \\\\wsl$\\Ubuntu\\home\\rjm\\dotfiles\\WindowsTerminal\\settings.json"

echo "Windows Terminal symlink setup completed."
