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

function UpdateWindowsGUI {
	# Update Windows Update GUI with the latest date
	usoclient | out-null
	if($?) {
	 usoclient startinteractivescan
	}
}

Write-Host "--- Running Windows Update ---"
Write-Host "Searching for updates..."
$updateSession = new-object -com "Microsoft.Update.Session"
$updateSearcher = $updateSession.CreateUpdateSearcher()
$searchResult = $updateSearcher.Search("IsInstalled=0 and IsHidden=0") #and Type='Software', Software or Driver
Write-Host "List of applicable items on the machine:"
if ($searchResult.Updates.Count -eq 0) {
 Write-Host "There are no applicable updates."
}
else
{
 $downloadReq = $False
 $i = 0
 foreach ($update in $searchResult.Updates){
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
  foreach ($update in $searchResult.Updates){
   $updatesToDownload.Add($update) | out-null
  }
  Write-Host "Downloading updates..."
  $downloader = $updateSession.CreateUpdateDownloader() 
  $downloader.Updates = $updatesToDownload
  $downloader.Download()
  Write-Host "List of downloaded updates:"
  $i = 0
  foreach ($update in $searchResult.Updates){
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
 foreach ($update in $searchResult.Updates){
  if ( $update.IsDownloaded ) {
   $updatesToInstall.Add($update) | out-null
  }
 }
 if ( $updatesToInstall.Count -eq 0 ) {
  Write-Host "Not ready for installation."
 }
 else
 {
  Write-Host "Installing" $updatesToInstall.Count "updates..."
  $installer = $updateSession.CreateUpdateInstaller()
  $installer.Updates = $updatesToInstall
  $installationResult = $installer.Install()
  if ( $installationResult.ResultCode -eq 2 ) {
   Write-Host "All updates installed successfully."
   UpdateWindowsGUI
  }
  else 
  {
   Write-Host "Some updates could not be installed."
  }
  if ( $installationResult.RebootRequired ) {
   UpdateWindowsGUI
   Write-Host "One or more updates require the system to reboot!"
   Write-Host "...Rebooting system soon...!"
   shutdown.exe /r /t 30
  }
  else 
  {
   Write-Host "Finished. Reboot is not required."
   UpdateWindowsGUI
  }
 }
}
