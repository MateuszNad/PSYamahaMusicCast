# Add test Author and Description

$ModuleManifestName = 'PSYamahaMusicCast.psd1'
$ModuleManifestPath = "$PSScriptRoot\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }

    It  'Passes Test-FunctionToExport' {
        $ExportedCommands = (Test-ModuleManifest -Path $ModuleManifestPath).ExportedCommands.Values.Name
        $BaseNameFunctionFile = (Get-ChildItem -Path "$PSScriptRoot\public").BaseName

        $Result = $BaseNameFunctionFile | Where-Object { $ExportedCommands -notcontains $_ }
        $Result.Count | Should Be 0
    }
}
