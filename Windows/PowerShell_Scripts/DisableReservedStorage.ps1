#check for admin privileges
if (!
    #current role
    (New-Object Security.Principal.WindowsPrincipal(
        [Security.Principal.WindowsIdentity]::GetCurrent()
    #is admin?
    )).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
) {
    #elevate script and exit current non-elevated runtime
    Start-Process `
        -FilePath 'powershell' `
        -ArgumentList (
            #flatten to single array
            '-File', $MyInvocation.MyCommand.Source, $args `
            | %{ $_ }
        ) `
        -Verb RunAs
    exit
}

$reservedStorage = DISM /Online /Get-ReservedStorageState | findstr /C:"Reserved storage"
if ($reservedStorage -ilike "*disabled*") {
	Write-Host "Reserved storage is already disabled."
} elseif ($reservedStorage -ilike "*enabled*") {
	Write-Host "Disabling reserved storage to free up about 7 GB of disk space..."
	DISM /Online /Set-ReservedStorageState /State:Disabled
} else {
	Write-Host "No match was found for reserved storage with DISM."
}
