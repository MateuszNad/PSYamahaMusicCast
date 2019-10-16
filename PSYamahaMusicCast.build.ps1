param (
    [Parameter(Mandatory = $false)]
    [string]$ModuleName,
    [Parameter(Mandatory = $false)]
    [ValidateSet('Development', 'Production')]
    $Configuration = 'Development'

)

# Default
task . RemoveImport

task tests InstallDependencies, Analyze, Test
task version InstallDependencies, Analyze, Test, UpdateVersion

if (-not ($PSBoundParameters.ModuleName))
{
    $ModuleName = Split-Path -Path $BuildRoot -Leaf
}

task TestModuleName {
    Write-Output $ModuleName
}

task RemoveImport {
    if (Get-Module $ModuleName)
    {
        Remove-Module -Name $ModuleName
    }
    Import-Module $BuildRoot
}

task CheckFunction {
    $Manifest = Test-ModuleManifest -Path ".\$ModuleName.psd1"
    $BaseName = (Get-ChildItem -Path  '.\public').BaseName


    $BaseName | Where-Object { $Manifest.ExportedCommands.Values.Name -notcontains $_ }
    ",'{0}'" -f (($BaseName | Where-Object { $Manifest.ExportedCommands.Values.Name -notcontains $_ }) -join "','") | Clip
}

# Pre-requisites
task InstallDependencies {
    Install-Module Pester -Force -Scope 'CurrentUser'
    Install-Module PSScriptAnalyzer -Force -Scope 'CurrentUser'
    Install-Module platyPs -Force -Scope 'CurrentUser'
}

#region Task to Update the PowerShell Module Help Files.
task UpdateHelp {
    Import-Module ".\$ModuleName" -Force
    Update-MarkdownHelp .\docs
    New-ExternalHelp -Path .\docs -OutputPath .\en-US -Force
}

task Analyze {
    $scriptAnalyzerParams = @{
        Path        = "$BuildRoot\public"
        Severity    = @('Error', 'Warning')
        Recurse     = $true
        Verbose     = $false
        ExcludeRule = 'PSUseDeclaredVarsMoreThanAssignments', 'PSUseSingularNouns'
    }

    $saResults = Invoke-ScriptAnalyzer @scriptAnalyzerParams
    # $saResults | ConvertTo-Html | Out-File -FilePath "$BuildRoot\tests\result.$ModuleName.scriptAnalyzer.html" -Force

    if ($saResults)
    {
        $saResults | Format-Table
        throw "One or more PSScriptAnalyzer errors/warnings where found."
    }
}

task Test {
    $invokePesterParams = @{
        Strict       = $true
        PassThru     = $true
        Verbose      = $false
        EnableExit   = $false
        OutputFormat = 'NUnitXml'
        OutputFile   = "$BuildRoot\tests\result.$ModuleName.test.xml"
    }

    # Publish Test Results as NUnitXml
    $testResults = Invoke-Pester ".\$((($BuildFile -split '\\')[-1] -split '\.')[0] + '.Tests.ps1')" @invokePesterParams

    $numberFails = $testResults.FailedCount
    assert($numberFails -eq 0) ('Failed "{0}" unit tests.' -f $numberFails)
}

task CopyFiles {
    # Copy Module Files to Output Folder
    $OutputPath = ".\output\$ModuleName"
    if (-not (Test-Path $OutputPath))
    {
        $null = New-Item -Path $OutputPath -ItemType Directory
    }

    '.\en-US\', '.\lib\' , '.\bin\' , '.\public\' , '.\private\' , '.\tests\' |
        ForEach-Object {
            if (Test-Path $_)
            {
                Copy-Item -Path $_ -Filter *.* -Recurse -Destination $OutputPath -Force
            }
        }

    # Copy Module Manifest files
    Copy-Item -Path @(
        ".\README.md"
        ".\$ModuleName.psd1"
        ".\$ModuleName.psm1"
        ".\$ModuleName.Format.ps1xml"
    ) -Destination $OutputPath -Force
}

task UpdateVersion {
    $manifestPath = ".\$ModuleName.psd1"

    # Import PlatyPS.
    Import-Module -Name PlatyPS

    # Start by importing the manifest to determine the version, then add 1 to the Build
    $manifest = Test-ModuleManifest -Path $manifestPath
    [System.Version]$Version = $manifest.Version
    [String]$NewVersion = New-Object -TypeName System.Version -ArgumentList ($version.Major, $version.Minor, ($version.Build + 1))
    Write-Output -InputObject ('New Module version: {0}' -f $newVersion)

    #Update Module with new version
    Update-ModuleManifest -ModuleVersion $newVersion -Path $manifestPath -ReleaseNotes $ReleaseNotes
}

task Clean {
    # Clean output folder
    if ((Test-Path .\output))
    {
        Remove-Item -Path .\Output -Recurse -Force
    }
}

task CleanTest {
    [array]$Files = "test\result.PSNps.scriptAnalyzer.html", "test\result.PSNps.test.xml", "remove", ".vscode"
    $Files | Foreach-Object {
        Remove-Item -Path (Join-Path -Path $BuildRoot -ChildPath $_) -Recurse -Force
    }
}

task Publish -If ($Configuration -eq 'Production') {
    try
    {
        $params = @{
            Path        = ('{0}\Output\{1}' -f $PSScriptRoot, $ModuleName )
            NuGetApiKey = $Env:NuGetApiKey
            ErrorAction = 'Stop'
        }
        Publish-Module @params
        Write-Output "$ModuleName PowerShell Module version published to the PowerShell Gallery"
    }
    catch
    {
        throw $_
    }
}