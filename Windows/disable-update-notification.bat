@echo off

:: Solution's source: https://superuser.com/questions/1214503/disable-windows-10-update-notification-osd/1431277#1431277
:: This redirects the Windows Update notification calls to the system tray, so it doesn't actually get displayed
:: This should be the preferred method, rather than denying the file permissions, because then updates will not affect this, and there is no need for SFC to fix those files either (which may happen)
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MusNotifyIcon.exe" /v "Debugger" /t REG_SZ /d "%windir%\System32\systray.exe" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MusNotification.exe" /v "Debugger" /t REG_SZ /d "%windir%\System32\systray.exe" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MusNotificationUx.exe" /v "Debugger" /t REG_SZ /d "%windir%\System32\systray.exe" /f >nul 2>&1

