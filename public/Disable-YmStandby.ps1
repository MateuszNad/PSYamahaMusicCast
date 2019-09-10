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
function Disable-YmStandby
{

    [cmdletbinding()]
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

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/setAutoPowerStandby?enable=false"
                if ($PassThru)
                {
                    $Response.Content | ConvertFrom-Json | Add-YmResponseCode
                }
            }
            catch
            {

            }
        }
    }
    end
    {

    }
}
