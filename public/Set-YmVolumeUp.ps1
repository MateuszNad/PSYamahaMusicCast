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
function Set-YmVolumeUp
{

    [cmdletbinding()]
    [Alias('up-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory = $false, ParameterSetName = 'InStep')]
        [int]$InStep,
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
                if ($InStep)
                {
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=up&step=$InStep"
                    $ResponseObj = $Response.Content | ConvertFrom-Json
                }
                else
                {
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=up"
                    $ResponseObj = $Response.Content | ConvertFrom-Json
                }
                
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

            }
        }
    }
    end
    {

    }
}




