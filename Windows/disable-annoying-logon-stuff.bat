@echo off

::Annoying login animation begone..
::https://www.tenforums.com/tutorials/2411-turn-off-user-first-sign-animation-window-10-a.html
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v "EnableFirstLogonAnimation" /d 0 /t REG_DWORD /f

::This one looks to be a Whac-A-Mole situation TBH...
::https://www.windowslatest.com/2020/06/07/windows-10-full-screen-setup-prompts-are-back/
::https://answers.microsoft.com/en-us/windows/forum/all/disable-get-even-more-out-of-windows/3193a082-09b9-416a-843b-0d192b20ffed?page=1
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement /v "ScoobeSystemSettingEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "ContentDeliveryAllowed" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "FeatureManagementEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "OemPreInstalledAppsEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "PreInstalledAppsEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "PreInstalledAppsEverEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "RemediationRequired" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SilentInstalledAppsEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SoftLandingEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SystemPaneSuggestionsEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContentEnabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-310093Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338387Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338388Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338389Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-338393Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-353694Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-353696Enabled" /d 0 /t REG_DWORD /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v "SubscribedContent-353698Enabled" /d 0 /t REG_DWORD /f
