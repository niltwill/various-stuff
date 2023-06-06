
#Example:
#.\CleanUserProfile.ps1 -Usernames user1, user2

param (
    [Parameter(Mandatory=$true)]
    [string[]]$Usernames
)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" {1}' -f ($myinvocation.MyCommand.Definition), ($Usernames -join " "))
    exit
}

function CleanProfile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Username
    )

    $user = Get-WmiObject -Class Win32_UserAccount -Filter "Name='$Username'"
    if (!$user) {
        Write-Warning "User '$Username' not found"
        return
    }

    $profile = Get-WmiObject -Class Win32_UserProfile -Filter "SID='$($user.SID)' AND Special=$false"
    if (!$profile) {
        Write-Warning "Profile for user '$Username' not found"
        return
    }

    $profile.Delete()
    Write-Host "Profile for user '$Username' successfully deleted"
}

foreach ($username in $Usernames) {
    CleanProfile -Username $username
}
