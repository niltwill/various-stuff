# This is a rudimentary approach to stopping malicious processes from doing damage
# However, do not blindly trust this for security, this was only made for a PowerShell exercise
# The apps still run at first, but they quickly get terminated if they are not in a trusted path
# You need to whitelist paths manually where executables are allowed to run

# Change title
$host.ui.RawUI.WindowTitle = "Block-Executables"

function Enable-ProcessTrace {
[CmdLetBinding()]

param(
)
$Query = "Select * From __InstanceCreationEvent within 1 Where TargetInstance ISA 'Win32_Process'"
$Identifier = "StartProcess"

$ActionBlock = {
    $e = $event.SourceEventArgs.NewEvent.TargetInstance
    $Path = Get-Process -id $e.ProcessID | Select-Object -ExpandProperty Path
	$currentuser = $(Get-WMIObject -class Win32_ComputerSystem | select username).username.split("\")[1]
	
	#Write-Host ("Process {0} with PID {1} has started." -f $e.Name, $e.ProcessID)

    if ([System.Environment]::Is64BitOperatingSystem -eq $True){
		#
		# 64 bit system:
		# CHANGE THESE to the folders you want to whitelist
		#
        if($Path -like "$ENV:windir*" -or $Path -like "$ENV:ProgramData*"`
        -or $Path -like "${Env:ProgramFiles(x86)*}" -or $Path -like "$ENV:ProgramFiles*"`
		-or $Path -like "$ENV:SystemDrive\totalcmd*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local\Microsoft\Teams\Update.exe*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local\Microsoft\Teams\current\Squirrel.exe*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local\Microsoft\Teams\current\Teams.exe*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local*"`
        #-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Roaming*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\Downloads*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\OneDrive*"`
		#-or $Path -like "$ENV:SystemDrive\Apps*"`
		#-or $Path -like "$ENV:PUBLIC*"`
        ) {
            Write-Host ("Process {0} with PID {1} is whitelisted. Ignoring..." -f $e.Name, $e.ProcessID)
        } else {
            Stop-Process -id $e.ProcessID -Force -PassThru
            Write-Host ("Process {0} with PID {1} is forced to stop." -f $e.Name, $e.ProcessID)
        }

    } else {
		#
		# 32 bit system:
		# CHANGE THESE to the folders you want to whitelist
		#
        if($Path -like "$ENV:windir*" -or $Path -like "$ENV:ProgramData*"`
        -or $Path -like "$ENV:ProgramFiles*"`
		-or $Path -like "$ENV:SystemDrive\totalcmd*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local\Microsoft\Teams\Update.exe*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local\Microsoft\Teams\current\Squirrel.exe*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local\Microsoft\Teams\current\Teams.exe*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Local*"`
        #-or $Path -like "$ENV:SystemDrive\Users\$currentuser\AppData\Roaming*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\Downloads*"`
		#-or $Path -like "$ENV:SystemDrive\Users\$currentuser\OneDrive*"`
		#-or $Path -like "$ENV:SystemDrive\Apps*"`
		#-or $Path -like "$ENV:PUBLIC*"`
        ) {
            Write-Host ("Process {0} with PID {1} is whitelisted. Ignoring..." -f $e.Name, $e.ProcessID)
        } else {
            Stop-Process -id $e.ProcessID -Force -PassThru
            Write-Host ("Process {0} with PID {1} is forced to stop." -f $e.Name, $e.ProcessID)
        }
    }
}

Register-WMIEvent -Query $Query -SourceIdentifier $Identifier -Action $ActionBlock

}

# Start as admin
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
[Security.Principal.WindowsBuiltInRole] "Administrator")) {
Start-Process powershell -ArgumentList "-noexit", "-noprofile", "-NonInteractive", "-windowstyle hidden", $PSCommandPath -Verb RunAs
#Write-Warning "Insufficient permissions to run this script. Open the PowerShell console as an administrator and run this script again."
Break
}
#else {
#Write-Host "Code is running as administrator..." -ForegroundColor Green
#}

# Cleanup leftover event (if any)
Get-Event | Remove-Event
Get-EventSubscriber | Unregister-Event

# Start this event
Enable-ProcessTrace
