<#
.Synopsis
    The function turns off  the sleep timer.

.DESCRIPTION
    The function turns off  the sleep timer. The function sets sleep timer to 0.

.EXAMPLE
    Stop-YmSleepTimer -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Stop-YmSleepTimer
{
    [cmdletbinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress
    )
    if ($PSCmdlet.ShouldProcess($DeviceAddress))
    {
        Set-YmSleepTimer -DeviceAddress $DeviceAddress -Minute 0
    }
}
