<#
.Synopsis
    The function sets volume.

.DESCRIPTION
    The function sets volume.

.EXAMPLE
    Set-YmVolume -DeviceAddress 10.10.0.30

.EXAMPLE
    Set-YmVolume 10.10.0.30


.EXAMPLE
    volume-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmVolume
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias('volume-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory, Position = 1)]
        [ValidateRange(0, 100)]
        [int]$Volume
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
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=$Volume"
                    $ResponseObj = $Response.Content | ConvertFrom-Json

                    if ($ResponseObj.response_code -eq 0)
                    {
                        Get-YmStatus -DeviceAddress $DeviceAddress | Select-Object volume
                    }
                    else
                    {
                        $ResponseObj | Add-YmResponseCode
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
