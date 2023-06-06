param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

'running with full privileges'

# uninstall MS Teams
(Get-ItemProperty C:\Users\*\AppData\Local\Microsoft\Teams).PSPath | ForEach-Object {Start-Process $_\Update.exe -ArgumentList "--uninstall /s" -PassThru -Wait}

# clean-up
#(Get-ItemProperty C:\Users\*\AppData\Local\Microsoft\Teams).PSPath | ForEach-Object {Remove-Item $_ -force -Recurse}
(Get-ItemProperty C:\Users\*\AppData\Roaming\Microsoft\Teams).PSPath | ForEach-Object {Remove-Item $_ -force -Recurse}
(Get-ItemProperty C:\Users\*\AppData\Local\SquirrelTemp).PSPath | ForEach-Object {Remove-Item $_ -force -Recurse}
