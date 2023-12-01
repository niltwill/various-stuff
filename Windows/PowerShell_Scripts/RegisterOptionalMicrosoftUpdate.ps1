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

# Turning on the optional "Receive Updates for other Microsoft Products"
Write-Host "Turning on: Receive Updates for other Microsoft Products"
$ServiceManager = New-Object -ComObject Microsoft.Update.ServiceManager
#$ServiceManager.ClientApplicationID = "My App"
$NewUpdateService = $ServiceManager.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")
