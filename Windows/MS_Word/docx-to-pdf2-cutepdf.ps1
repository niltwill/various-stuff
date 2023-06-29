# Script to print doc and/or docx documents to PDF with a printer
# Requires Windows 10
# Requires Microsoft Word to be installed
# Requires the Spooler service to run (or script will not be able to do anything)
# This uses CutePDF Writer 4.0 to generate the PDFs
# Can be altered to work with Microsoft Print to PDF, Bullzip PDF Printer

# Check for admin privileges
param(
    [Parameter(Mandatory=$false)]
    [switch]$shouldAssumeToBeElevated,

    [Parameter(Mandatory=$false)]
    [String]$workingDirOverride
)

# If parameter is not set, we are probably in non-admin execution. We set it to the current working directory so that
#  the working directory of the elevated execution of this script is the current working directory
if(-not($PSBoundParameters.ContainsKey('workingDirOverride')))
{
    $workingDirOverride = (Get-Location).Path
}

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# If we are in a non-admin execution. Execute this script as admin
if ((Test-Admin) -eq $false)  {
    if ($shouldAssumeToBeElevated) {
        Write-Output "Elevating did not work :("

    } else {
        #                                                         vvvvv add `-noexit` here for better debugging vvvvv 
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -file "{0}" -shouldAssumeToBeElevated -workingDirOverride "{1}"' -f ($myinvocation.MyCommand.Definition, "$workingDirOverride"))
    }
    exit
}

Set-Location "$workingDirOverride"

#
# Check if Spooler service is running
#
$serviceName = "Spooler"

# Check if Printer Spooler service is running
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service -eq $null) {
    Write-Host "Printer Spooler service not found."
    Exit 1
}
if ($service.Status -ne "Running") {
    Write-Host "Printer Spooler service is not running."
    Exit 1
}

#
# Set printer
#
# CutePDF Writer 4.0 is what's recommended to use with this
# Bullzip may be better to be used with this: https://www.bullzip.com/kb/pdf-command/
$driverName = "CutePDF Writer"
#$driverName = "Bullzip PDF Printer"
#$driverName = "Microsoft Print To PDF"

# Get the original default printer
$originalDefaultPrinter = (Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Default=$true").Name

# Get the custom printer
$pdfPrinter = Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Name='$driverName'"

# Get the custom printer's default PortName
#$pdfPrinterPort = (Get-Printer -Name "$driverName").PortName

# Set the custom printer as the default printer
$printerSet = $false
try {
    $pdfPrinter.SetDefaultPrinter() | Out-Null
    Write-Host "Changed default printer to: $driverName."
    $printerSet = $true
} catch {
    Write-Host "Could not set printer to $drivername. Exiting script."
    Exit 1
}

# Set working directory to where this script is located
$documents_path = '.'

# For CutePDF Writer 4.0, one could also use registry, file by file
$registryPath = "HKCU:\Software\CutePDF Writer"

# Loop through DOC/DOCX files in the specified directory
Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {
    $docFile = $_.FullName
    $pdfFile = Join-Path -Path $_.DirectoryName -ChildPath ($_.BaseName + '.pdf')

    # Add printer port to specify filename and avoid "save as" popup
    #Add-PrinterPort -Name $pdfFile
    #Get-Printer -Name "$driverName" | Set-Printer -PortName $pdfFile

    # Alternatively for CutePDF Writer 4.0, we can use the registry
    If (-NOT (Test-Path "$registryPath")) {
        New-Item -Path "$registryPath" -Force | Out-Null
    }
    New-ItemProperty -Path "$registryPath" -Name BypassSaveAs -Value 1 -PropertyType String -Force | Out-Null
    New-ItemProperty -Path "$registryPath" -Name OutputFile -Value "$pdfFile" -PropertyType String -Force | Out-Null

    # Print the DOCX file to the default printer
    $word = New-Object -ComObject Word.Application -ErrorAction Stop
    if(-NOT ($?)){
        Write-Host "Could not start Word. Is it installed? Exiting script."
        Exit 1
    }
    $word.Visible = $false
    $doc = $word.Documents.Open($docFile)
    $doc.PrintOut() | Out-Null

    # Wait until the printing queue finishes
    $Printer = Get-Printer -Name $driverName
    $PrinterSpool = Get-PrintJob -PrinterObject $Printer
    while ($PrinterSpool -ne $null){
        Start-Sleep -Milliseconds 500
        $PrinterSpool = Get-PrintJob -PrinterObject $Printer
    }

    # Check if the PDF file was created
    if (Test-Path $pdfFile) {
        Write-Host "Successfully converted $docFile to PDF: $pdfFile"
    } else {
        Write-Host "Failed to convert $docFile to PDF."
    }

    # Cleanup to avoid potential memory leaks and hanging processes
    $doc.Close()
    $word.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($doc) | Out-Null
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($word) | Out-Null
    [System.GC]::Collect()
    [System.GC]::WaitForPendingFinalizers()
    Remove-Variable doc
}

# Restore the original default printer
if ($printerSet -eq $true){
    $originalPrinter = Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Name='$originalDefaultPrinter'"
    $originalPrinter.SetDefaultPrinter() | Out-Null
    Write-Host "Restored original default printer to: $originalDefaultPrinter."

    #Remove existing registry entries for CutePDF Writer (if any)
    Remove-ItemProperty -Path "$registryPath" -Name BypassSaveAs -Force | Out-Null
    Remove-ItemProperty -Path "$registryPath" -Name OutputFile -Force | Out-Null
 
    # Alternatively, for no registry approach
    #Restore original printer port
    #CutePDF Writer - CPW4:
    #Bullzip PDF Printer - BULLZIP
    #Microsoft Print to PDF - PORTPROMPT:
    #Get-Printer -Name "$driverName" | Set-Printer -PortName $pdfPrinterPort

    #Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {
        #$pdfFile = Join-Path -Path $_.DirectoryName -ChildPath ($_.BaseName + '.pdf')
        #Remove-PrinterPort -Name $pdfFile
    #}
}
