#Stop Teams process 
Get-Process -ProcessName Teams -ErrorAction SilentlyContinue | Stop-Process -Force 
Start-Sleep -Seconds 3
Write-Host "Teams Process Sucessfully Stopped" 

#Clear Team Cache
try{
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\blob_storage" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\databases" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\cache" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\gpucache" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\Indexeddb" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\Local Storage" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Get-ChildItem -Path $env:APPDATA\"Microsoft\teams\tmp" | Remove-Item -Recurse -ErrorAction SilentlyContinue
Write-Host "Teams Cache Cleaned" 
}catch{
echo $_ 
}

#Remove Credential from Credential manager
$credential = cmdkey /list | ForEach-Object{if($_ -like "*Target:*" -and $_ -like "*msteams*"){cmdkey /del:($_ -replace " ","" -replace "Target:","")}}

#Remove Reg.Key
$Regkeypath= "HKCU:\Software\Microsoft\Office\Teams" 
$value = (Get-ItemProperty $Regkeypath).HomeUserUpn -eq $null
If ($value -eq $False) 
{ 
  Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Office\Teams" -Name "HomeUserUpn"
  Write-Host "The registry value Sucessfully removed" 
} 
Else { Write-Host "The registry value does not exist"}

#Get Desktop-config.json
$TeamsFolders = "$env:APPDATA\Microsoft\teams"
try{
	$SourceDesktopConfigFile = "$TeamsFolders\desktop-config.json"
	$desktopConfig = (Get-Content -Path $SourceDesktopConfigFile | ConvertFrom-Json)
}
catch{ Write-Host "Failed to open Desktop-config.json" }

#Overwrite the desktop-config.json
Write-Host "Modify desktop-Config.Json"
try{
	$desktopConfig.isLoggedOut = $true
	$desktopConfig.upnWindowUserUpn =""; #The email used to sign in
	$desktopConfig.userUpn ="";
	$desktopConfig.userOid ="";
	$desktopConfig.userTid = "";
	$desktopConfig.homeTenantId ="";
	$desktopConfig.webAccountId="";
	$desktopConfig | ConvertTo-Json -Compress | Set-Content -Path $SourceDesktopConfigFile -Force
}
catch{ Write-Host "Failed to overwrite desktop-config.json" }
Write-Host "Modify desktop-Config.Json - Finished"

#Delete the Cookies file. This is a fix for when the joining as anonymous, and prevents the last used guest name from being reused.
Get-ChildItem "$TeamsFolders\Cookies" | Remove-Item

#Lastly delete the storage.json, this corrects some error that MSTeams otherwise would have when logging in again.
Get-ChildItem "$TeamsFolders\storage.json" | Remove-Item


#Try to remove the Link School/Work account if there was one. It can be created if the first time you sign in, the user all
$LocalPackagesFolder ="$env:LOCALAPPDATA\Packages"
$AADBrokerFolder = Get-ChildItem -Path $LocalPackagesFolder -Recurse -Include "Microsoft.AAD.BrokerPlugin_*";
$AADBrokerFolder = $AADBrokerFolder[0];
Get-ChildItem "$AADBrokerFolder\AC\TokenBroker\Accounts" | Remove-Item -Recurse -Force





