<#
.Synopsis
    The function disable standby on the device

.DESCRIPTION
    The function disable standby on the device

.EXAMPLE
    Disable-YmStandby -DevicesAddress '10.10.0.1'

    The function
.EXAMPLE
    Disable-YmStandby '10.10.0.1'

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    eywords: keywords
    Notes:
    Changelog:
#>
function Disable-YmStandby
{

    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
        [switch]$PassThru

    )
    begin
    {

    }
    process
    {
        foreach ($Address in $DeviceAddress)
        {
            try
            {
                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/setAutoPowerStandby?enable=false"
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
    end
    {

    }
}
