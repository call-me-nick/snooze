Write-Host 'Hello, world!'
Write-Host 'This is the second line.'
#$Directories = Get-ChildItem -Path C:\users\nickr\Desktop -Directory -Recurse
#$Directories = Get-ChildItem -Path ../ -Directory -Recurse
$Directories = Get-ChildItem -Path ../ -Name -Recurse
Write-Output -InputObject $Directories


