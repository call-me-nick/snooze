# Build a CSV from a list of directories.
#  With hyperlinks.
# Needs to handle:
#   Excel hyperlinks
#   Files with spaces in the name.
$Directories = Get-ChildItem -Path ./ -Name -Recurse
$csv_lines = @() #@("Dir,LibreOffice_Hyperlink,HTML_Link,Simple_Link")
#foreach ($dir in $Directories){
#    $dir = $dir | %{$_ -replace "\\", "/"}
#    $html_link = $dir |`
#        %{$_ -replace "^", "<a href=`"file://"}|`
#        %{$_ -replace "$", "`">link<a>"}
#    $csv_lines += "$dir,=HYPERLINK(`"$dir`"),$html_link,file://$dir"
#}
#foreach ($dir in $Directories){
$dir_object = New-Object -Type my_object_type
$Directories | ForEach-Object {
    #$dir = $dir | %{$_ -replace "\\", "/"}
    $dir = %{$_ -replace "\\", "/"}
    $html_link = $dir |`
        %{$_ -replace "^", "<a href=`"file://"}|`
        %{$_ -replace "$", "`">link<a>"}
    $csv_lines += [dir_object]@{
        Dir = "$dir"
        LibreOffice_Hyperlink = "=HYPERLINK(`"$dir`")"
        HTML_Link = "$html_link"
        SimpleLink = "file://$dir"
    }
}
$csv_lines | Export-Csv -Path ./my_links.csv -NoTypeInformation
"Wrote ./my_links.csv -> Now `"Import CSV`" in Excel"
