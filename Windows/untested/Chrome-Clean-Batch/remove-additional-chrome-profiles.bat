@echo off
setlocal EnableDelayedExpansion

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
		
		:: Forcefully remove any additional profiles (if any)
        for /d %%p in ("!chromeprofile!\Profile *") do (
            echo Cleaning additional profile directory: %%~nxp for user !username!...
            rd /s /q "!chromeprofile!\%%~nxp"
        )
    )
)

:end
