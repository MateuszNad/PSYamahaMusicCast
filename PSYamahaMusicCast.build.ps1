# Default 
task . RemoveImport
# Only Testy
task tests InstallDependencies, Analyze, Test
# Publish
task pub InstallDependencies, Analyze, Test, Publish
# Local Publish
task version InstallDependencies, Analyze, Test, UpdateVersion

$ModuleName = Split-Path -Path $BuildRoot -Leaf


task RemoveImport {
    if (Get-Module $ModuleName) {
        Remove-Module -Name $ModuleName
    }
    Import-Module $BuildRoot
}


task InstallDependencies {
    #Install-Module Pester -Force
    Install-Module PSScriptAnalyzer -Force
    #Install-Module dbatools -Force
}

task Analyze {
    $scriptAnalyzerParams = @{
        Path        = "$BuildRoot\public"
        Severity    = @('Error', 'Warning')
        Recurse     = $true
        Verbose     = $false
        ExcludeRule = 'PSUseDeclaredVarsMoreThanAssignments'
    }

    $saResults = Invoke-ScriptAnalyzer @scriptAnalyzerParams
    $saResults | ConvertTo-Html | Out-File -FilePath "$BuildRoot\test\result.$ModuleName.scriptAnalyzer.html" -Force

    if ($saResults) {
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
        OutputFile   = "$BuildRoot\test\result.$ModuleName.test.xml" 
    }

    # Publish Test Results as NUnitXml
    $testResults = Invoke-Pester ".\$((($BuildFile -split '\\')[-1] -split '\.')[0] + '.Tests.ps1')" @invokePesterParams 

    $numberFails = $testResults.FailedCount
    assert($numberFails -eq 0) ('Failed "{0}" unit tests.' -f $numberFails)
}

task Clean {
    [array]$Files = "test\result.PSYamahaMusicCast.scriptAnalyzer.html", "test\result.PSYamahaMusicCast.test.xml", "remove", ".vscode"
    $Files | ForEach-Object {
        Remove-Item -Path (Join-Path -Path $BuildRoot -ChildPath $_) -Recurse -Force
    }
}

task Publish {
    Publish-Module -Path $BuildRoot -Repository SiSPsModulesRepo
}

task UpdateVersion {
    try {
        $moduleManifestFile = ((($BuildFile -split '\\')[-1] -split '\.')[0] + '.psd1')
        $manifestContent = Get-Content $moduleManifestFile -Raw
        [version]$version = [regex]::matches($manifestContent, "ModuleVersion\s*=\s*\'(?<version>(\d+\.)?(\d+\.)?(\d+\.)?(\*|\d+))'") | ForEach-Object { $_.groups['version'].value }
        $newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, ($version.Build + 1), $version.Revision

        $replacements = "ModuleVersion = '$newVersion'"
        $manifestContent = $manifestContent -replace "ModuleVersion\s*=\s*\'(?<version>(\d+\.)?(\d+\.)?(\d+\.)?(\*|\d+))'", $replacements

        $manifestContent | Set-Content -Path "$BuildRoot\$moduleManifestFile"
    }
    catch {
        Write-Error -Message $_.Exception.Message
        $host.SetShouldExit($LastExitCode)
    }
}


