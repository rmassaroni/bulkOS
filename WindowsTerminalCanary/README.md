## Windows Terminal Canary Setup


- Admin Command Prompt
```Command Prompt
:: Windows Terminal
curl https://raw.githubusercontent.com/rmassaroni/bulkOS/main/WindowsTerminalCanary/wt-install.bat | cmd

:: Windows Terminal (Canary)
curl https://raw.githubusercontent.com/rmassaroni/bulkOS/main/WindowsTerminalCanary/wtc-install.bat | cmd
```

- Powershell, don't use this
```Powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rmassaroni/bulkOS/arm/WindowsTerminalCanary/install.bat" | Invoke-Expression
```


### nerd font
- 0xProto Nerd Font
- https://www.nerdfonts.com/font-downloads
- will include in windows install script


### TODO
- still need to update wtc-install.bat to be like the newer wt-install.bat
- nerd font auto setup
- wt preview
