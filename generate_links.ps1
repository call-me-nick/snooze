# Build a CSV from a list of directories.
#  With hyperlinks.
# Needs to handle:
#   Excel hyperlinks.
#   Files with spaces in the name.
#   Only files, no directories.
$target_file = "./my_links.csv"
$Directories = Get-ChildItem -Path ./ -File -Name -Recurse
$csv_lines = @()

class dir_object
{
    [ValidateNotNullOrEmpty()][string]$Dir
    [ValidateNotNullOrEmpty()][string]$Excel_Hyperlink
}

$Directories | ForEach-Object {
    $dir = %{$_ -replace "\\", "/"}
    $html_link = $dir |`
        %{$_ -replace "^", "<a href=`"file://"}|`
        %{$_ -replace "$", "`">link<a>"}
    $csv_lines += [dir_object]@{
        Dir = "$dir"
        Excel_Hyperlink = "=HYPERLINK(`"$dir`", `"Link`")"
    }
}
$csv_lines | Export-Csv -Path $target_file -NoTypeInformation
"Wrote $target_file -> Now `"Import CSV`" in Excel"
