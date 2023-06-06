@echo off

:: Source:
:: https://feedbackportal.microsoft.com/feedback/idea/79b3e7d6-38a9-ed11-a81b-000d3a0450e3
:: https://answers.microsoft.com/en-us/msoffice/forum/all/how-do-i-disable-the-artificial-intelligence-ai/743603b5-202e-47fd-87ab-c04f86fe463e

:: This batch file must run with admin privileges
:: And Outlook shouldn't be open to be able to remove "aitrx.dll"

:: The nasty AI files
set file1="ai.exe"
set file2="ai.dll"
set file3="aimgr.exe"
set file4="aitrx.dll"

:: Stop the AI process if it exists
tasklist /fi "imagename eq %file1%" |find ":" > nul
if errorlevel 1 taskkill /f /im %file1%

:: Begin checking the Office directories where this thing may exist
goto checkdirs

:denyfiles
takeown /f %file1%
icacls %file1% /remove:d *S-1-1-0
icacls %file1% /deny *S-1-1-0:^(X^)
takeown /f %file2%
icacls %file2% /remove:d *S-1-1-0
icacls %file2% /deny *S-1-1-0:^(X^)
takeown /f %file3%
icacls %file3% /remove:d *S-1-1-0
icacls %file3% /deny *S-1-1-0:^(X^)
takeown /f %file4%
icacls %file4% /remove:d *S-1-1-0
icacls %file4% /deny *S-1-1-0:^(X^)
goto checkdirs

:checkdirs
:: Office 2016-2021?/Microsoft 365
:: Prob. the only one that's needed, but I do backward compatibility, we can never know
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE16" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE16"
 goto denyfiles
)
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE16" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE16"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE16" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE16"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE16" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE16"
 goto denyfiles
)

:: Office 2013
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE15" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE15"
 goto denyfiles
)
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE15" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE15"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE15" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE15"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE15" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE15"
 goto denyfiles
)

:: Office 2010
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE14" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE14"
 goto denyfiles
)
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE14" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE14"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE14" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE14"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE14" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE14"
 goto denyfiles
)

:: Office 2007
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE12" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE12"
 goto denyfiles
)
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE12" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE12"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE12" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE12"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE12" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE12"
 goto denyfiles
)

:: Office 2003
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE11" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE11"
 goto denyfiles
)
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE11" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE11"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE11" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE11"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE11" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE11"
 goto denyfiles
)

:: Office XP
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE10" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE10"
 goto denyfiles
)
if exist "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE10" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE10"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE10" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE10"
 goto denyfiles
)
if exist "C:\Program Files (x86)\Microsoft Office\root\vfs\ProgramFilesCommonX86\Microsoft Shared\OFFICE10" (
 cd "C:\Program Files\Microsoft Office\root\vfs\ProgramFilesCommonX64\Microsoft Shared\OFFICE10"
 goto denyfiles
)
goto:eof

