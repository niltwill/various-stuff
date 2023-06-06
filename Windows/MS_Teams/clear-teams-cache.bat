@echo off
:: Clear Microsoft Teams cache for the current (logged in) user
set user=%USERNAME%

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Application Cache\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Application Cache\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\backgrounds\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\backgrounds\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\blob_storage\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\blob_storage\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Cache\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Cache\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Code Cache\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Code Cache\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\databases\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\databases\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\GPUCache\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\GPUCache\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\IndexedDB\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\IndexedDB\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Local Storage\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\Local Storage\*"
)

if exist "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\tmp\" (
 del /Q /S /F "C:\Users\%user%\AppData\Roaming\Microsoft\Teams\tmp\*"
)
