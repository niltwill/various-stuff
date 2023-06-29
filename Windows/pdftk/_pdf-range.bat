@echo off

:: change this to needed range
:: make sure the file has the sufficient page range or it won't work
set pages="1-4"

:: create output directory as needed
if not exist output\ (
 mkdir output
)

:: get only needed pages of pdf files
for %%f in (.\*.pdf) do pdftk %%f cat %pages% output output\%%f

::help for command:
::pdftk input.pdf cat 1-9 26-end output outputfile.pdf
