@echo off

:: Source (based on): https://winaero.com/disable-updates-available-windows-10/
:: They really should stop annoying you with unnecessary messages

:: This has to be used again after Windows updates!
:: S-1-1-0 (SID) = Everyone (this makes it Windows-language independent)

cd /d "%Windir%\System32"
if exist "MusNotification.exe" (
    takeown /f MusNotification.exe
    icacls MusNotification.exe /remove:d *S-1-1-0
    icacls MusNotification.exe /deny *S-1-1-0:^(X^)
)

if exist "MusNotificationUx.exe" (
    takeown /f MusNotificationUx.exe
    icacls MusNotificationUx.exe /remove:d *S-1-1-0
    icacls MusNotificationUx.exe /deny *S-1-1-0:^(X^)
)

if exist "MusNotifyIcon.exe" (
    takeown /f MusNotifyIcon.exe
    icacls MusNotifyIcon.exe /remove:d *S-1-1-0
    icacls MusNotifyIcon.exe /deny *S-1-1-0:^(X^)
)
