@echo off
:: fix audio
net stop "AudioSrv" >nul
net start "AudioSrv" >nul
start ms-settings:easeofaccess-audio
reg add "HKCU\Software\Microsoft\Multimedia\Audio" /V AccessibilityMonoMixState /T REG_DWORD /D 0 /F >nul
start ms-settings:sound
taskkill /F /IM SystemSettings.exe >nul

:: reset icon cache (to reset tray icon still showing no audio available)
taskkill /F /IM explorer.exe >nul
timeout 2 /nobreak>nul
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\*.db >nul
DEL /F /S /Q /A %userprofile%\AppData\Local\IconCache.db >nul
timeout 2 /nobreak>nul
start explorer.exe
