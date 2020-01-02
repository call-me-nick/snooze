Add-Type -Path "C:\users\nickr\Desktop\git\snooze\iText7.7.1.9\lib\net40\itext.kernel.dll"

$reader = [iText.text.pdf.PdfReader]::new('test.pdf')

for ($page = 1; $page -le $reader.NumberOfPages; $page++) {
    $lines = [char[]]$reader.GetPageContent($page) -join "" -split "`n"
    foreach ($line in $lines) {
        if ($line -match "AR00") {
            "Found: $line"
        }
    }
}