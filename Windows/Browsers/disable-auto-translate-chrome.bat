@echo off
REG ADD HKLM\Software\Policies\Google\Chrome /v TranslateEnabled /t REG_DWORD /d 0 /f
