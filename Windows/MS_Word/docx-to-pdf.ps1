# Script to save doc and/or docx documents as PDF
# Requires Microsoft Word to be installed

#$documents_path = Split-Path -parent $MyInvocation.MyCommand.Path
$documents_path = '.'

#https://learn.microsoft.com/en-us/dotnet/api/microsoft.office.interop.word.wdsaveformat?view=word-pia
$wdFormatPDF = 17

# This filter will find .doc, .docx documents
Get-ChildItem -Path $documents_path -Filter *.doc? | ForEach-Object {
    try {
        $Word = New-Object -ComObject Word.Application -ErrorAction Stop
        if(-NOT ($?)){
            Write-Host "Could not start Word. Is it installed? Exiting script."
            exit
        }
        $Word.visible = $false
        $document = $Word.Documents.Open($_.FullName)
        $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"
        $document.SaveAs($pdf_filename, $wdFormatPDF)
        $document.Close()
        $Word.Quit()
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($document) | Out-Null
        [System.Runtime.Interopservices.Marshal]::ReleaseComObject($Word) | Out-Null
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        Remove-Variable Word, document, pdf_filename
        Write-Host "Converted $($_.Name) to PDF."
    } catch {
        Write-Host "Error converting $($_.Name) to PDF: $_"
    }
}

# Check if any instances of Word are still running
$runningInstances = Get-Process -Name winword -ErrorAction SilentlyContinue
if ($runningInstances) {
    Write-Host "Warning: Word instances are still running. Closing instances..."
    $runningInstances | ForEach-Object {
        $_.CloseMainWindow() | Out-Null
        if (-not $_.HasExited) {
            $_.Kill()
        }
    }
}
