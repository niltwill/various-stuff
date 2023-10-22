@echo off

reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MusNotifyIcon.exe" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MusNotification.exe" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MusNotificationUx.exe" /f >nul 2>&1
