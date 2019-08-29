<#
.Synopsis
     krotki_opis
    
.DESCRIPTION
    dlugi_opis
    
.EXAMPLE
    przyklad_1
    
.EXAMPLE
    przyklad_2
    
.LINK
    Author: autor 
    Link: akademiapowershell.pl
    
    Date: 26-08-2019
    Version: version
    eywords: keywords
    Notes: 
    Changelog:
#>
function Set-YmSleepTimer {

    [cmdletbinding()]
    [Alias('timer-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory = $false)]
        [int]$Minutes = 30,
        [switch]$PassThru
    )
    begin {

    }
    process {
        foreach ($Address in $DeviceAddress) {
            try {

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setSleep?sleep=$Minutes"
                if ($PassThru) {
                    $Response.Content | ConvertFrom-Json | Add-YmResponseCode
                }            
            }
            catch {

            }
        }
    }
    end {

    }
}


function Get-YmSleepTimer {
    <#
    .EXAMPLE
    Get-YmZoneInfo -DeviceAddress 10.10.0.30

    .EXAMPLE
#>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )
    
    $Status = Get-YmStatus -DeviceAddress $DeviceAddress
    $Status | Select-Object -Property Sleep
}

function Stop-YmSleepTimer {
    <#
    .EXAMPLE
    Get-YmZoneInfo -DeviceAddress 10.10.0.30

    .EXAMPLE
#>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )
    Set-YmSleepTimer -DeviceAddress $DeviceAddress -Minutes 0
}