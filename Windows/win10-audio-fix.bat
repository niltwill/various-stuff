@echo off

:: This is an ugly workaround, only use for rarely affected, buggy PCs
:: While mono is getting switched in accessibility and the relevant system settings window is being displayed, the sound gets fixed!
:: This was the only way to fix the audio on a certain computer that always kept reverting to "unknown" sound device
:: No amount of Windows or driver fiddling managed to fix it, and I didn't want to reinstall either
:: Note that this must be run at every login, since it gets unusable every time

net stop "AudioSrv" >nul
net start "AudioSrv" >nul
start ms-settings:easeofaccess-audio
reg add "HKCU\Software\Microsoft\Multimedia\Audio" /V AccessibilityMonoMixState /T REG_DWORD /D 0 /F >nul
start ms-settings:sound
taskkill /F /IM SystemSettings.exe >nul
