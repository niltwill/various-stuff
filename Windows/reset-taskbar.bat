@echo off

:: If you are having issues with your Taskbar, including freezing, disappearing, or errors
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Desktop /F
taskkill /f /im explorer.exe
taskkill /f /im shellexperiencehost.exe
del %localappdata%\Packages\Microsoft.Windows.ShellExperienceHost_cw5n1h2txyewy\TempState\* /q
start explorer.exe

