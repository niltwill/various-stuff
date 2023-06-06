$VER = (Get-Item "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe").VersionInfo | Sort-Object -Property ProductVersion | Select-Object -ExpandProperty ProductVersion -Last 1
cd "C:\Program Files (x86)\Microsoft\Edge\Application\"
cd "$VER"
cd "Installer"
.\setup.exe -uninstall -system-level -verbose-logging -force-uninstall
