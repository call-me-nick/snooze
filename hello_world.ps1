#Write-Host 'Hello, world!'
#Write-Host 'This is the second line.'
#$Directories = Get-ChildItem -Path C:\users\nickr\Desktop -Directory -Recurse
#$Directories = Get-ChildItem -Path ../ -Directory -Recurse
$Directories = Get-ChildItem -Path ../ -Name -Recurse
#Write-Output -InputObject $Directories | `
#    %{$_ -replace "\\", "/"} | `
#    %{$_ -replace "^", "<a href=\"file://>"} |\
foreach ($the_dir in $Directories){
    the_link = $the_dir |`
        %{$_ -replace "\\", "/"}|`
        %{$_ -replace "^", "<a href=`"file://"}|`
        %{$_ -replace "$", "`">link<a>"}
    "$the_dir,$the_link"
}

