
<#
.Synopsis
     The function enable standby on the device

.DESCRIPTION
    The function enable standby on the device

.EXAMPLE
    Enable-YmStandby -DeviceAddress '10.10.0.1'

.EXAMPLE
    przyklad_2

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Enable-YmStandby
{

    [cmdletbinding()]
    [Alias()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
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

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/setAutoPowerStandby?enable=true"
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