@echo off
taskkill /f /im explorer.exe
timeout 2 /nobreak>nul
for /d %%a in (C:\Users\*) do (
 attrib -h "%%a\AppData\Local\Microsoft\Windows\Explorer\*.db"
 DEL /F /S /Q /A "%%a\AppData\Local\Microsoft\Windows\Explorer\*.db"
 DEL /F /S /Q /A "%%a\AppData\Local\IconCache.db"
)
timeout 2 /nobreak>nul
start explorer.exe
