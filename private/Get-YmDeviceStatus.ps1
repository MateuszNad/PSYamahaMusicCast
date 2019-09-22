
<#
.Synopsis


.DESCRIPTION


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
function Get-YmDeviceStatus
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

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/getFuncStatus"
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