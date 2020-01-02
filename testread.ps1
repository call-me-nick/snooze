try {
    Add-Type -Path "C:\users\nickr\Desktop\git\snooze\iText7.7.1.9\lib\net40\itext.kernel.dll"
}
catch [System.Reflection.ReflectionTypeLoadException] {
    Write-Host "Message: $($_.Exception.Message)"
    Write-Host "StackTrace: $($_.Exception.StackTrace)"
    Write-Host "LoaderExceptions: $($_.Exception.LoaderExceptions)"
}

$reader = [iText.text.pdf.PdfReader]::new('test.pdf')

for ($page = 1; $page -le $reader.NumberOfPages; $page++) {
    $lines = [char[]]$reader.GetPageContent($page) -join "" -split "`n"
    foreach ($line in $lines) {
        if ($line -match "AR00") {
            "Found: $line"
        }
    }
}