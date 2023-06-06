@echo off
:: Remove Intel Graphics Properties from tray for normal users (if it is running)
::tasklist /fi "ImageName eq igfxTray.exe" /fo csv 2>NUL | find /I "igfxTray.exe">NUL
::if "%ERRORLEVEL%"=="0" (
:: taskkill /f /im igfxTray.exe
::)

:: Disable Intel Graphics from services
net stop "igfxCUIService2.0.0.0"
:loop
timeout /t 5 /nobreak >nul
sc query "igfxCUIService2.0.0" | find "STATE" | find "STOPPED" >nul
if errorlevel 1 goto loop
sc config "igfxCUIService2.0.0.0" start= disabled
::sc config "igfxCUIService2.0.0.0" start= demand

:: Remove these registry keys to remove Intel Graphics from right click context menu
reg delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\igfxcui /F
reg delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\igfxDTCM /F
