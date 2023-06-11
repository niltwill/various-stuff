@echo off

:: RUN AS ADMIN
:: COMMENT OUT THE LAST LINE IF YOU DON'T WANT TO LOGOUT

:: Someone asked me to remove their personal wallpapers 'cause they only borrowed a certain computer and need to give it back
:: This does not remove the user's wallpaper images themselves, only clear the wallpaper history

:: Read registry for the 5 used wallpapers' path (max 5 gets stored in history)
FOR /L %%i IN (0,1,4) DO (
    FOR /F "usebackq tokens=2*" %%A IN (`REG QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundHistoryPath%%i`) DO (
        set "bg%%i=%%B"
    )
)

:: Store the default Windows wallpaper path in a variable
set "defaultWallpaper=%WINDIR%\web\wallpaper\windows\img0.jpg"

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
