#Write-Host 'Hello, world!'
#Write-Host 'This is the second line.'
#$Directories = Get-ChildItem -Path C:\users\nickr\Desktop -Directory -Recurse
#$Directories = Get-ChildItem -Path ../ -Directory -Recurse
$Directories = Get-ChildItem -Path ./ -Name -Recurse
#Write-Output -InputObject $Directories | `
#    %{$_ -replace "\\", "/"} | `
#    %{$_ -replace "^", "<a href=\"file://>"} |\
foreach ($tdir in $Directories){
    $link = $tdir |`
        %{$_ -replace "\\", "/"}|`
        %{$_ -replace "^", "<a href=`"file://"}|`
        %{$_ -replace "$", "`">link<a>"}
    $simple_link = $tdir |`
        %{$_ -replace "\\", "/"}|`
        %{$_ -replace "^", "file://"}
    "$tdir,$link,$simple_link"
}

