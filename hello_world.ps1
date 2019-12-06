Write-Host 'Hello, world!'
Write-Host 'This is the second line.'
$Directories = Get-ChildItem -Path C:\users\nickr\Desktop -Directory -Recursive
Write-Output -InputObject $Directories


