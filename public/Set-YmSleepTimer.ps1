<#
.Synopsis
    The function sets sleep timer.

.DESCRIPTION
    The function sets sleep timer. Default time is 30 minutes

.EXAMPLE
    Set-YmSleepTimer -DeviceAddress 10.10.0.30

    The function set sleep timer on 30 minutes.

.EXAMPLE
    timer-ym -DeviceAddress 10.10.0.30

    The function set sleep timer on 30 minutes.

.EXAMPLE
    Set-YmSleepTimer -DeviceAddress 10.10.0.30 -Minutes 120

    The function set sleep timer on 2 hours. The devices after this time, it will power off.

.EXAMPLE
    Set-YmSleepTimer -DeviceAddress 10.10.0.30 -Minutes 0

    Deactivating the sleep timer.

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmSleepTimer
{

    [cmdletbinding(SupportsShouldProcess)]
    [Alias('timer-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory = $false, Position = 1)]
        [int]$Minute = 30,
        [switch]$PassThru
    )
    begin
    {

    }
    process
    {
        if ($PSCmdlet.ShouldProcess($DeviceAddress))
        {
            foreach ($Address in $DeviceAddress)
            {
                try
                {

                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setSleep?sleep=$Minutes"
                    if ($PassThru)
                    {
                        $Response.Content | ConvertFrom-Json | Add-YmResponseCode
                    }
                }
                catch
                {
                    Write-Warning $PSItem
                }
            }
        }
    }
    end
    {

    }
}
