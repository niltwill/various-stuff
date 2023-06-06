@echo off
setlocal EnableDelayedExpansion

:: ESR=0 -> regular edition
:: ESR=1 -> ESR edition
set ESR=0

::
:: BEWARE, DISABLING MULTIPROCESSES CAN MAKE YOUR ACTIVE TABS BUGGY, UNREACHABLE/UNCLOSABLE
:: BUT YOU ONLY NEED TO RESTART BROWSER AND THEN YOU CAN CLOSE BUGGY TAB
::

:: Version information gets extracted with WMIC for Firefox (using registry)
:: This may NOT work with the portable edition (portableapps.com), as that could fully ignore registry/environment variables
:: You have to do that manually yourself, or by altering the FFPATH variable in this script to where your Firefox is, as needed

:: Check Firefox's path location from the registry
FOR /F "usebackq tokens=2*" %%A IN (`REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe" /v Path`) DO (
 set FFPATH=%%B
)

:: For the portable app, you may try to set it manually below, this is only an example that needs to be altered
:: However I did not test it with the portable app, this may not work there
::set FFPATH="G:\Apps\Firefox-ESR\..."

:: Check if path was found in registry
if not defined FFPATH (
echo Firefox's path in the registry was not found!
exit /b 1
)

:: Double the single \ which is needed for the WMI command to work
set "WMIPATH=%FFPATH:\=\\%"

:: If directory exists, get the results of it
if exist %FFPATH% (
  FOR /F "tokens=2 delims==" %%I IN (
 'wmic datafile where "name='%WMIPATH%\\firefox.exe'" get version /format:list'
 ) DO FOR /F "delims=" %%A IN ("%%I") DO SET "RESULT=%%A"
)

:: Do nothing if version cannot be read
if not defined RESULT (
echo Firefox's version could not be read!
exit /b 1
)

:: Display only needed version number depending if it's ESU edition or not
:: Note that the "esu" string does not need to be added after the version, it's not going to work like that
IF %ESR% equ 0 (
 FOR /F "tokens=1,2,3 delims=." %%a in ("%RESULT%") do (
  IF %%c gtr 0 (
   set FFVER=%%a.%%b.%%c
  ) ELSE (
   set FFVER=%%a.%%b
  )
 )
)

IF %ESR% equ 1 (
 FOR /F "tokens=1,2,3 delims=." %%a in ("%RESULT%") do (
   IF %%b gtr 0 (
   set FFVER=%%a.%%b.%%c
  ) ELSE (
   IF %%b equ 0 (
    IF %%c gtr 0 (
     set FFVER=%%a.%%b.%%c
    )
    set FFVER=%%a.%%b
   )
  )
 )
)

:: Add the needed user environment variable into the registry
reg add HKCU\Environment /v MOZ_FORCE_DISABLE_E10S /t REG_SZ /d "%FFVER%" /f

:: Also set it for the current session, just in case
set "MOZ_FORCE_DISABLE_E10S=%FFVER%"
::set M

:: Refresh the environment variables by restarting explorer
:: (You will also need to restart your browser if it's open)
taskkill /f /im explorer.exe && start explorer.exe
