@echo off

::Source: https://www.alexandrumarin.com/microsoft-teams-msi-for-windows-10/

::Download latest MSI Teams installer from here:
::32-bit - https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&download=true&managedInstaller=true
::64-bit - https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&download=true&managedInstaller=true&arch=x64
::Place it into same directory as this batch file

::Add needed registry key to fool it into thinking this is a VDI environment
reg add "HKEY_LOCAL_MACHINE\Software\Citrix\PortICA" /f

::check if OS is 32 or 64 bits
wmic os get osarchitecture | find "64" > NUL && set OS=64 || set OS=32
if %OS%==32 GOTO :32bit
if %OS%==64 GOTO :64bit

ECHO OS Architecture %OS_ARCH% is not supported!
EXIT 1

::Install it from CMD

:64bit
echo "Installing 64-bit Teams..."
if exist "%~dp0Teams_windows_x64.msi" (
 start /wait msiexec /i "%~dp0Teams_windows_x64.msi" ALLUSER=1 /qn
)
GOTO :CLEANUP

:32bit
echo "Installing 32-bit Teams..."
if exist "%~dp0Teams_windows.msi" (
 start /wait msiexec /i "%~dp0Teams_windows.msi" ALLUSER=1 /qn
)
GOTO :CLEANUP

::Remove the desktop shortcut and run key from registry
:CLEANUP
if exist "%PUBLIC%\Desktop\Microsoft Teams.lnk" (
 del /F /Q "%PUBLIC%\Desktop\Microsoft Teams.lnk"
)
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v Teams /f
exit 0
