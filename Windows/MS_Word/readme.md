# Generate doc and docx files to PDFs

These PowerShell scripts can be used to generate PDFs from all doc or docx files (you can also change this extension to "rtf") in the current directory of the scripts. These all require Microsoft Word to be installed.

* docx-to-pdf.ps1: Uses Microsoft Word to save the files as PDFs
* docx-to-pdf2-cutepdf.ps1: Uses Microsoft Word, the Spooler service to print the doc and docx files to PDF with ["CutePDF Writer 4.0"](https://www.cutepdf.com/products/CutePDF/writer.asp) (also need Windows 10)
* docx-to-pdf2-mspdf.ps1: Uses Microsoft Word, the Spooler service to print the doc and docx files to PDF (using the inbuilt "Microsoft Print To PDF" printer, requires Windows 10)
* docx-to-pdf2-bullzippdf.ps1: Uses Microsoft Word, the Spooler service to print the doc and docx files to PDF with ["Bullzip PDF Printer"](https://www.bullzip.com/products/pdf/info.php) (also need Windows 10)

Easiest to use is the first one (docx-to-pdf.ps1), where the result will be the same as if you'd manually open and save each file in Word to PDF yourself (but imagine if you have tens or hundreds of such files to process). If you want something different, then I'd recommend using "CutePDF Writer", as that seems to generate the smallest PDF files by default (in most cases). "Microsoft Print to PDF" is second to this (best option if you don't want to install any additional PDF printing software), and "Bullzip PDF Printer" should be your last option, because it tends to generate huge files by default (at least, through Microsoft Word) and seems more bloated than "CutePDF Writer" and seems to leave its printer behind after uninstallation (you need to delete it manually). doPDF is excluded from this, because it doesn't let you generate PDFs without a GUI (not with the free version anyway).

I suppose using these as a basis, you could also figure out how to make use of xls, xlsx, ppt, pptx files (Excel and PowerPoint).