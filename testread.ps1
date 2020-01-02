try {
    Add-Type -Path ".\Portable.BouncyCastle.1.8.1.3\lib\net40\BouncyCastle.Crypto.dll"
    Add-Type -Path ".\itext7.7.1.9\lib\net40\itext.kernel.dll"
    
}
catch [System.Reflection.ReflectionTypeLoadException] {
    Write-Host "Message: $($_.Exception.Message)"
    Write-Host "StackTrace: $($_.Exception.StackTrace)"
    Write-Host "LoaderExceptions: $($_.Exception.LoaderExceptions)"
}

$reader = [itext.kernel.pdf.pdfreader]::new('test.pdf')

for ($page = 1; $page -le $reader.NumberOfPages; $page++) {
    $lines = [char[]]$reader.GetPageContent($page) -join "" -split "`n"
    foreach ($line in $lines) {
        if ($line -match "AR00") {
            "Found: $line"
        }
    }
}