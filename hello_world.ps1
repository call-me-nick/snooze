# Build a CSV from a list of directories.
#  With hyperlinks.
# Needs to handle:
#   Excel hyperlinks.
#   Files with spaces in the name.
$Directories = Get-ChildItem -Path ./ -Name -Recurse
$csv_lines = @()

class dir_object
{
    [ValidateNotNullOrEmpty()][string]$Dir
    [ValidateNotNullOrEmpty()][string]$LibreOffice_Hyperlink
    [ValidateNotNullOrEmpty()][string]$HTML_Link
    [ValidateNotNullOrEmpty()][string]$Simple_Link
}

$Directories | ForEach-Object {
    $dir = %{$_ -replace "\\", "/"}
    $html_link = $dir |`
        %{$_ -replace "^", "<a href=`"file://"}|`
        %{$_ -replace "$", "`">link<a>"}
    $csv_lines += [dir_object]@{
        Dir = "$dir"
        LibreOffice_Hyperlink = "=HYPERLINK(`"$dir`", `"Link`")"
        HTML_Link = "$html_link"
        Simple_Link = "file://$dir"
    }
}
$csv_lines | Export-Csv -Path ./my_links.csv -NoTypeInformation
"Wrote ./my_links.csv -> Now `"Import CSV`" in Excel"
