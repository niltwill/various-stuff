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

$BitLockerVolume = Get-BitLockerVolume | Select MountPoint, VolumeStatus, ProtectionStatus
foreach ($i in $BitLockerVolume) {
    $MountPoint = $i.MountPoint
    $ProtectionStatus = if ($i.ProtectionStatus -eq 'On') { 1 } else { 0 }
	$VolumeStatus = if ($i.VolumeStatus -eq 'FullyEncrypted') { 2 } elseif ($i.VolumeStatus -eq 'EncryptionInProgress') { 1 } else { 0 }

    if ($ProtectionStatus -eq 1 -And $VolumeStatus -eq 2) {
		Write-Host "$MountPoint - BitLocker encryption is on, and the drive is fully encrypted."
		Write-Host "Attempting to disable BitLocker on this drive..."
		Disable-BitLocker -MountPoint "$MountPoint" -Confirm:$false
    }
	elseif ($ProtectionStatus -eq 1 -And $VolumeStatus -eq 1) {
		Write-Host "$MountPoint - BitLocker encryption is on, and the drive is not yet encrypted."
		Write-Host "Please wait until it finishes encryption completely, and then try again..."
	}
	elseif ($ProtectionStatus -eq 1) {
		Write-Host "$MountPoint - BitLocker encryption is on, but the drive status is unknown or not applicable."
	}
	elseif ($ProtectionStatus -eq 0) {
		Write-Host "$MountPoint - BitLocker encryption is off."
	}
}
