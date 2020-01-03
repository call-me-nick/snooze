<#
    Build a CSV from a list of directories.
    With hyperlinks.
    Needs to handle:
        Excel hyperlinks.
        Files with spaces in the name.
        Only files, no directories.
    Should also provide:
        Starting Bates number
        Ending Bates number
        Page count (count the Bates numbers)
        If there are no bates numbers, add "NO_BATES" to the "Starting_Bates" field


#>
$Pdf2Text = "$PSScriptRoot\poppler-0.68.0_x86\poppler-0.68.0\bin\pdftotext.exe"
$BatesPattern = "AR00"
$target_file = "my_links.csv"
$exclude_files = @(
    "$target_file"
    "Makefile",
    "generate_links.ps1",
    "README.md"
)


function get_bates(string file_name){
    <# Example code:
        $bates = @()
        $testfile = "$PSScriptRoot\test.pdf"
        $bates = & $Pdf2Text $testfile - | Select-String -Pattern $BatesPattern
        return @{First = $bates[0]; Last = $bates[-1]; Count = $bates.Count}
        #!! Make sure to check for NONE!
    #>
    # Returns a hash table:
    $bates = @{First = ""; Last = ""; Count = 0}


}


$Directories = Get-ChildItem -Path ./ -File -Name -Recurse
$csv_lines = @()

class dir_object
{
    [ValidateNotNullOrEmpty()][string]$Dir
    [ValidateNotNullOrEmpty()][string]$Excel_Hyperlink
}

$Directories | ForEach-Object {
    $dir = %{$_ -replace "\\", "/"}
    if($exclude_files.Contains($dir)){
        "Skipping: $dir"
    } else {
        "Processing: $dir"
        $html_link = $dir |`
            %{$_ -replace "^", "<a href=`"file://"}|`
            %{$_ -replace "$", "`">link<a>"}
        $csv_lines += [dir_object]@{
            Dir = "$dir"
            Excel_Hyperlink = "=HYPERLINK(`"$dir`", `"Link`")"
        }
    }
}
"Done."
$csv_lines | Export-Csv -Path $target_file -NoTypeInformation
"Wrote: $target_file (This file can be opened with Excel.)"
