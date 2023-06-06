#include <AutoItConstants.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

;
; For this method, the browser has to run for some time before the active profile appears
;

Global Const $CHROME_USERDIR = @LocalAppDataDir & "\Google\Chrome\User Data"
Global Const $LOCAL_STATE_FILE = $CHROME_USERDIR & "\Local State"

Func GetChromeProfileName()
    Local $profileName = ""
    Local $hFileOpen = FileOpen($LOCAL_STATE_FILE, $FO_READ)
    If $hFileOpen = -1 Then
        MsgBox($MB_ICONERROR, "Chrome Cleaning", "Error reading file: " & $LOCAL_STATE_FILE & @CRLF & @CRLF & "Make sure Chrome is running and try again.", 10)
        Return ""
    EndIf
    Local $sFileRead = FileRead($hFileOpen)
    FileClose($hFileOpen)
    Local $sFileValues = StringSplit($sFileRead, ",")
    For $i = 1 To $sFileValues[0]
		; Default profile is like this: "last_active_profiles":["Default"]
		; If browser is not open, it's like this: "last_active_profiles":[]
        If StringRegExp($sFileValues[$i], '(?i)"last_active_profiles":\["(.+)"\]') Then
            $ProfileName = StringRegExpReplace($sFileValues[$i], '(?i)"last_active_profiles":\["(.+)"\]', "$1")
            ExitLoop
        EndIf
    Next
	; If regexp did not find anything, then the variable should be made empty
	If $profileName = '"last_active_profiles":[]' Then
		$profileName = ""
	EndIf
    Return $profileName
EndFunc

Func ClearChromeProfile()
    Local $profileName = GetChromeProfileName()
    If $profileName <> "" Then
		Local $chromeProfileDir = $CHROME_USERDIR & "\" & $profileName
		
		; You must first close Chrome to be able to clear files in use!
		If ProcessExists("chrome.exe") Then
			; first attempt, trying to gracefully close the browser
			; only works with one tab
			; protected/fixed tabs you can only close with ctrl+w
			WinClose("[CLASS:Chrome_WidgetWin_1]")
			$closedChrome = ProcessWaitClose("chrome.exe", 15)
			If $closedChrome = 0 Then
				WinKill("[CLASS:Chrome_WidgetWin_1]")
				
				$closedChrome = ProcessWaitClose("chrome.exe", 15)
				If $closedChrome = 0 Then
					ProcessClose("chrome.exe")
				EndIf
			EndIf
		EndIf
		
		If FileExists($chromeProfileDir & "\Cache") Then
			DirRemove($chromeProfileDir & "\Cache", $DIR_REMOVE)
		EndIf
		If FileExists($chromeProfileDir & "\Network\Cookies") Then
			FileDelete($chromeProfileDir & "\Network\Cookies")
		EndIf
		
		If FileExists($chromeProfileDir & "\History") Then
		    FileDelete($chromeProfileDir & "\History")
		EndIf
		
		If FileExists($chromeProfileDir & "\Sessions") Then
		    FileDelete($chromeProfileDir & "\Sessions")
		EndIf
		
		;This is only here to confirm that it worked
		;MsgBox($MB_ICONINFORMATION,"Chrome Cleaning","Successfully cleared the Cache, Cookies, History and Session: " & $FULL_DIR, 10)
		MsgBox($MB_ICONINFORMATION,"Chrome Cleaning","Successfully cleared the Cache, Cookies, History and Session for the current Chrome profile.", 10)
		;MsgBox($MB_ICONINFORMATION,"Chrome Cleaning","Successfully cleared the Cache and Cookies for the current Chrome profile.", 10)
		
		;End the loop and quit
		Exit 0
	Else
		Return
    EndIf
EndFunc

; Since that particular file takes a while to get updated after browser startup, a while loop is needed
; while the script keeps running in the background until then
; Note that after doing this, a user has to run Chrome and close it down properly (old profile folder remains)
While 1
	ClearChromeProfile()
	Sleep(50)
WEnd
