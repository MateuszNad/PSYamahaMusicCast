<#
.Synopsis
    The function returns information about sleep timer.

.DESCRIPTION
    The function returns information about sleep timer.

.EXAMPLE
    Get-YmSleepTimer  -DeviceAddress 10.10.0.30

    sleep
    -----
        0

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Get-YmSleepTimer
{
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )

    $Status = Get-YmStatus -DeviceAddress $DeviceAddress
    $Status | Select-Object -Property Sleep
}