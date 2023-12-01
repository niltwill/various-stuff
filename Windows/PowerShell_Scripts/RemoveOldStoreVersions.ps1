#check for admin privileges (not necessarily required in this case, though)
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

$Apps = @(Get-AppxProvisionedPackage -Online | Select -Expand DisplayName)
$Apps= $Apps | sort -uniq
foreach ($i in $Apps) {
	$ProvisionedVersion = (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $i} | Sort-Object -Property Version -Descending | Select-Object -First 1).Version
	$WieProvisioned = Get-AppxProvisionedPackage -Online | Where-Object {($_.DisplayName -like $i) -and ($_.Version -lt "$($ProvisionedVersion)")}
	If ($WieProvisioned) {
        $WieProvisioned | Remove-AppxProvisionedPackage -Online
	}
}

$Apps = @(Get-AppxPackage -AllUsers | Select -Expand Name)
$Apps= $Apps | sort -uniq
foreach ($i in $Apps) {
	$MachineWideVersion = (Get-AppxPackage $i -AllUsers | Sort-Object -Property Version -Descending | Select-Object -First 1).Version
	$WieMachineWide = Get-AppxPackage $i -AllUsers | Where-Object {$_.Version -lt "$($MachineWideVersion)"}
	If ($WieMachineWide) {
		# There may be certain packages that cannot be removed easily, so don't fret when you see those errors
		# "Remove-AppxPackage : Deployment failed with HRESULT: 0x80073CFA"
		# "This app is part of Windows and cannot be uninstalled on a per-user basis."
		# There may be some messy workarounds:
		# https://superuser.com/questions/1115801/unable-to-uninstall-universal-apps-through-powershell
		Get-AppxPackage -AllUsers | Where PackageFullName -ilike *$WieMachineWide* | Remove-AppxPackage -Confirm:$False		
		
		#Current user only:
		#$WieMachineWide | Remove-AppxPackage -Confirm:$False
	}
}

$Apps = @(Get-AppxPackage | Select -Expand Name)
$Apps= $Apps | sort -uniq
foreach ($i in $Apps) {
	$CurrentUserVersion = (Get-AppxPackage $i | Sort-Object -Property Version -Descending | Select-Object -First 1).Version
	$WieCurrentUser = Get-AppxPackage $i | Where-Object {$_.Version -lt "$($CurrentUserVersion)"}
	If ($WieCurrentUser) {
        $WieCurrentUser | Remove-AppxPackage -Confirm:$False
	}
}
