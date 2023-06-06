@echo off

::Remove MS Edge from the desktop if it's there
if exist "%PUBLIC%\Desktop\Microsoft Edge.lnk" (
 del /F /Q "%PUBLIC%\Desktop\Microsoft Edge.lnk"
)
if exist "%USERPROFILE%\Desktop\Microsoft Edge.lnk" (
 del /F /Q "%USERPROFILE%\Desktop\Microsoft Edge.lnk"
)

::This only works for the original (pre-Chromium) Edge
::reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer /v "DisableEdgeDesktopShortcutCreation" /t REG_DWORD /d "1" /f

::This is only for the first Time Edge gets installed, to not create the shortcut (useless if already installed)
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EdgeUpdate /v "CreateDesktopShortcutDefault" /t REG_DWORD /d "0" /f

::This is for the updates, so if it gets an update, no shortcut gets created
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\EdgeUpdate /v "RemoveDesktopShortcutDefault" /t REG_DWORD /d "2" /f
