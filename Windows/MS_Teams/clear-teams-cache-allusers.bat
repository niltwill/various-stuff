@echo off
:: Clear Teams cache for all users
for /d %%a in (C:\Users\*) do (
    if exist "%%a\AppData\Roaming\Microsoft\Teams\Application Cache\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\Application Cache\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\backgrounds\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\backgrounds\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\blob_storage\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\blob_storage\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\Cache\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\Cache\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\Code Cache\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\Code Cache\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\databases\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\databases\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\GPUCache\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\GPUCache\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\IndexedDB\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\IndexedDB\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\Local Storage\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\Local Storage\*"
    )

    if exist "%%a\AppData\Roaming\Microsoft\Teams\tmp\" (
     del /Q /S /F "%%a\AppData\Roaming\Microsoft\Teams\tmp\*"
    )
)

