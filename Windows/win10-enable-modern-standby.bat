@echo off

:: MOSTLY FOR LAPTOPS
:: In this sleep state, your system is kept awake under minimum power consumption to perform
:: background tasks such as syncing email and notifications over the Internet, etc.
:: Modern Standby is reportedly causing heating and battery draining issues, thus forcing
:: some users to turn off the new power mode on their laptops.

reg delete "HKLM\System\CurrentControlSet\Control\Power" /v PlatformAoAcOverride /f

