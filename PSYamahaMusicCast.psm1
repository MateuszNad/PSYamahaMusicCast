# Script variable
$script:PSModuleRoot = $PSScriptRoot

Get-ChildItem "$PSScriptRoot\public\*.ps1" | ForEach-Object {
    . $_.FullName
}

Get-ChildItem "$PSScriptRoot\private\*.ps1" | ForEach-Object {
    . $_.FullName
}