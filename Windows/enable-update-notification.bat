@echo off

:: Source: https://winaero.com/disable-updates-available-windows-10/
:: S-1-1-0 (SID) = Everyone (this makes it language independent)

cd /d "%Windir%\System32"
icacls MusNotification.exe /remove:d *S-1-1-0
icacls MusNotification.exe /grant *S-1-1-0:F
icacls MusNotification.exe /setowner "NT SERVICE\TrustedInstaller"
icacls MusNotification.exe /remove:g *S-1-1-0
icacls MusNotificationUx.exe /remove:d *S-1-1-0
icacls MusNotificationUx.exe /grant *S-1-1-0:F
icacls MusNotificationUx.exe /setowner "NT SERVICE\TrustedInstaller"
icacls MusNotificationUx.exe /remove:g *S-1-1-0
icacls MusNotifyIcon.exe /remove:d *S-1-1-0
icacls MusNotifyIcon.exe /grant *S-1-1-0:F
icacls MusNotifyIcon.exe /setowner "NT SERVICE\TrustedInstaller"
icacls MusNotifyIcon.exe /remove:g *S-1-1-0
