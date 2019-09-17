<#
.Synopsis
    The function volumes down.

.DESCRIPTION
    The function volumes down.

.EXAMPLE
    Set-YmVolumeDown -DeviceAddress 10.10.0.30

.EXAMPLE
    down-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    eywords: keywords
    Notes:
    Changelog:
#>
function Set-YmVolumeDown
{

    [Alias('down-ym')]
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory = $false, ParameterSetName = 'InStep')]
        [int]$InStep
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
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=down&step=$InStep"
                    $ResponseObj = $Response.Content | ConvertFrom-Json
                }
                else
                {
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/setVolume?volume=down"
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