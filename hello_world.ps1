# Build a CSV from a list of directories.
#  With hyperlinks.
$Directories = Get-ChildItem -Path ./ -Name -Recurse
$csv_lines = @()
foreach ($dir in $Directories){
    $dir = $dir | %{$_ -replace "\\", "/"}
    $html_link = $dir |`
        %{$_ -replace "^", "<a href=`"file://"}|`
        %{$_ -replace "$", "`">link<a>"}
    $csv_lines += "$dir,=HYPERLINK(`"$dir`"),$html_link,file://$dir"
}
Export-Csv `
    -InputObject $csv_lines `
    -Property Dir,LibreOffice_Hyperlink,HTML_Link,Simple_Link `
    -Path ./my_links.csv
"Wrote ./my_links.csv"
"Use `"Import CSV`" in Excel"
