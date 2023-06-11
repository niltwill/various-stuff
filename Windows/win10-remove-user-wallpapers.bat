@echo off

:: RUN AS ADMIN
:: COMMENT OUT THE LAST LINE IF YOU DON'T WANT TO LOGOUT

:: Someone asked me to remove their personal wallpapers 'cause they only borrowed a certain computer and need to give it back
:: This also deletes those wallpapers, beware!

:: Read registry for the 5 used wallpapers' path (max 5 gets stored in history)
FOR /L %%i IN (0,1,4) DO (
    FOR /F "usebackq tokens=2*" %%A IN (`REG QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath%%i`) DO (
        set "bg%%i=%%B"
    )
)

:: Remove wallpapers from the list that are not default Windows wallpapers
echo %bg1% | findstr /I /L "%WINDIR%\web\wallpaper" >nul
if errorlevel 1 (
    if exist %bg1% (
        del /F /Q %bg1%
    )
) else (
    set "bg1="
)

echo %bg2% | findstr /I /L "%WINDIR%\web\wallpaper" >nul
if errorlevel 1 (
    if exist %bg2% (
        del /F /Q %bg2%
    )
) else (
    set "bg2="
)

echo %bg3% | findstr /I /L "%WINDIR%\web\wallpaper" >nul
if errorlevel 1 (
    if exist %bg3% (
        del /F /Q %bg3%
    )
) else (
    set "bg3="
)

echo %bg4% | findstr /I /L "%WINDIR%\web\wallpaper" >nul
if errorlevel 1 (
    if exist %bg4% (
        del /F /Q %bg4%
    )
) else (
    set "bg4="
)

echo %bg5% | findstr /I /L "%WINDIR%\web\wallpaper" >nul
if errorlevel 1 (
    if exist %bg5% (
        del /F /Q %bg5%
    )
) else (
    set "bg5="
)

:: Store the default Windows wallpaper path in a variable
set "defaultWallpaper=%WINDIR%\web\wallpaper\windows\img0.jpg"

:: If default wallpaper does not exist set it to the one from registry
if not exist "%defaultWallpaper%" (
    FOR /F "usebackq tokens=2*" %%A IN (`REG QUERY "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper`) DO (
        set "defaultWallpaper=%%B"
    )
)

:: Set the background type to Picture
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers /v BackgroundType /t REG_DWORD /d 0 /f

:: Set the current wallpaper path to the default wallpaper
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers /v CurrentWallpaperPath /t REG_SZ /d "%defaultWallpaper%" /f

:: Set the desktop wallpaper to the default wallpaper
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /T REG_SZ /d "%defaultWallpaper%" /f

:: Set the wallpaper style to "Stretch"
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /T REG_SZ /d 2 /f

:: Disable wallpaper tiling
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v TileWallpaper /T REG_SZ /d 0 /f

:: Remove registry entries so that Windows can re-generate them
FOR /L %%i IN (0,1,4) DO (
    reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers /v BackgroundHistoryPath%%i /f
)

:: Log out to refresh the desktop wallpaper
shutdown -l /f
