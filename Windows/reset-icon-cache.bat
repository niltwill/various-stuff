@echo off

:: This only works for the current user
:: It is necessary sometimes to make the invisible icons work again on the tray (yay Windows!)
taskkill /f /im explorer.exe
timeout 2 /nobreak>nul
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\*.db
DEL /F /S /Q /A %userprofile%\AppData\Local\IconCache.db
timeout 2 /nobreak>nul
start explorer.exe

