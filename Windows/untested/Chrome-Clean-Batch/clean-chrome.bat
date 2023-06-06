@echo off
setlocal EnableDelayedExpansion

:: Usage: clean-chrome.bat "user1" "user2" "user3" ...

:: TODO: Locate installed Chrome directory on system, not assume the default dir
:: Read registry key: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe
:: The "Path" entry will contain the directory where Chrome is installed on your system.

if "%~1"=="" (
    echo Please provide a user list as arguments enclosed in quotes.
    goto end
)

:: Loop through the input arguments and split them into separate usernames
set i=0
for %%a in (%*) do (
    set /a i+=1
    set "arg=%%~a"
    if not "!arg!"=="" (
        set "user[!i!]=!arg!"
    )
)

:: Loop through the user array and print each username that exists as a directory
for /l %%i in (1, 1, %i%) do (
    set "username=!user[%%i]!"
    if exist "%USERPROFILE%\..\!username!" (
	
        :: Valid user
		set "chromeprofile=%USERPROFILE%\..\!username!\AppData\Local\Google\Chrome\User Data"
        set "chromedefprofile=%USERPROFILE%\..\!username!\AppData\Local\Google\Chrome\User Data\Default"
		
		:: Try to clean default profile folder first
        if exist "!chromedefprofile!" (
            echo Cleaning Chrome browser's default profile for user !username!...
            del /f /q "!chromedefprofile!\Network\Cookies"
			del /f /q "!chromedefprofile!\History"
			del /f /q "!chromedefprofile!\Sessions"
            rd /s /q "!chromedefprofile!\Cache"
        )
		
        :: Check if any Profile directories exist before attempting to clean them
        if exist "!chromeprofile!\Profile *" (
            :: Clean additional profiles (if any)
            for /d %%p in ("!chromeprofile!\Profile *") do (
                echo Cleaning additional profile directory: %%~nxp for user !username!...
                del /f /q "!chromeprofile!\%%~nxp\Network\Cookies"
                del /f /q "!chromeprofile!\%%~nxp\History"
                del /f /q "!chromeprofile!\%%~nxp\Sessions"
                rd /s /q "!chromeprofile!\%%~nxp\Cache"
            )
        )
    )
)

:end
exit /b 1

