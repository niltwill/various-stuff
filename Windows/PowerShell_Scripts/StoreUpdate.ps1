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

Write-Host "--- Running Store update ---"
Write-Host "Searching for updates..."

# Manually check if there are any Store updates (first)
# otherwise there will not be any marked updates
# !You need admin rights for this below!
$namespaceName = "root\cimv2\mdm\dmmap"
$className = "MDM_EnterpriseModernAppManagement_AppManagement01"
$result = Get-CimInstance -Namespace $namespaceName -Class $className | Invoke-CimMethod -MethodName UpdateScanMethod

# The update process
$Session = New-Object -ComObject Microsoft.Update.Session
$Searcher = $Session.CreateUpdateSearcher()
$Searcher.ServiceID = (New-Object -ComObject Microsoft.Update.ServiceManager).Services | Select Name,ServiceID |
Where {$_.Name -Match "Store"} | Select-Object -ExpandProperty ServiceID
$Searcher.SearchScope = 2 #https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-uamg/85d72035-dbea-4f59-a923-20d261e8c53e
$Searcher.ServerSelection = 3 #https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-uamg/07e2bfa4-6795-4189-b007-cc50b476181a
$Searcher.Online = $false

$Criteria = "IsInstalled=0 and DeploymentAction='Installation' or
IsPresent=1 and DeploymentAction='Uninstallation' or
IsInstalled=1 and DeploymentAction='Installation' and
RebootRequired=1 or IsInstalled=0 and
DeploymentAction='Uninstallation' and RebootRequired=1"
$SearchResult = $Searcher.Search($Criteria)

#
# Update Store
#
if ($SearchResult.Updates.Count -eq 0) {
 Write-Host "There are no applicable updates."
}
else
{
 $downloadReq = $False
 $i = 0
 foreach ($update in $SearchResult.Updates){
  $i++
  if ( $update.IsDownloaded ) {
   Write-Host $i">" $update.Title "(downloaded)"
  }
  else
  {
   $downloadReq = $true
   Write-Host $i">" $update.Title "(not downloaded)"
  }
 }
 if ( $downloadReq ) {
  Write-Host "Creating collection of updates to download..."
  $updatesToDownload = new-object -com "Microsoft.Update.UpdateColl"
  foreach ($update in $SearchResult.Updates){
   $updatesToDownload.Add($update) | out-null
  }
  Write-Host "Downloading updates..."
  $downloader = $Session.CreateUpdateDownloader() 
  $downloader.Updates = $updatesToDownload
  $downloader.Download()
  Write-Host "List of downloaded updates:"
  $i = 0
  foreach ($update in $SearchResult.Updates){
   $i++
   if ( $update.IsDownloaded ) {
    Write-Host $i">" $update.Title "(downloaded)"
   }
   else
   {
    Write-Host $i">" $update.Title "(not downloaded)"
   }
  }
 }
 else
 {
  Write-Host "All updates are already downloaded."
 }
 $updatesToInstall = new-object -com "Microsoft.Update.UpdateColl"
 Write-Host "Creating collection of downloaded updates to install..." 
 foreach ($update in $SearchResult.Updates){
  if ( $update.IsDownloaded ) {
   $updatesToInstall.Add($update) | out-null
  }
 }
 if ( $updatesToInstall.Count -eq 0 ) {
  Write-Host "Not ready for installation."
 }
 else
 {
  if($updatesToInstall.Count -eq 1){
	  Write-Host "Installing" $updatesToInstall.Count "update..."
  } else {
	  Write-Host "Installing" $updatesToInstall.Count "updates..."
  }
  $installer = $Session.CreateUpdateInstaller()
  $installer.Updates = $updatesToInstall
  $installationResult = $installer.Install()
  if ( $installationResult.ResultCode -eq 2 ) {
   Write-Host "All updates installed successfully."
  }
  else 
  {
   Write-Host "Some updates could not be installed."
  }
  if ( $installationResult.RebootRequired ) {
   Write-Host "One or more updates require the system to reboot!"
  }
  else 
  {
   Write-Host "Finished. Reboot is not required."
   Write-Host "However, a restart is still needed for the Store apps to be updated."
  }
 }
}
