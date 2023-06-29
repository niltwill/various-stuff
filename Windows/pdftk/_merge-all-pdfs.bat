@echo off

:: create output directory as needed
if not exist output\ (
 mkdir output
)

:: merge all individual pdfs to one
pdftk *.pdf cat output output\merged.pdf

::help for command:
::pdftk input.pdf cat 1-9 26-end output outputfile.pdf
