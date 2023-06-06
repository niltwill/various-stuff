@echo off

reg delete HKCU\Environment /v MOZ_FORCE_DISABLE_E10S /f

:: also set it for current session
set "MOZ_FORCE_DISABLE_E10S="

:: refresh environment variables by restarting explorer
taskkill /f /im explorer.exe && start explorer.exe
