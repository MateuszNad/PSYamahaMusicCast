
<#
.Synopsis
     The function returns basic informations about device

.DESCRIPTION
    The function returns basic informations about device.
    For instance model, system version, device id.

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
function Get-YmDeviceInformation
{

    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
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
                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/getDeviceInfo"
                $Response.Content | ConvertFrom-Json | Add-YmResponseCode
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
