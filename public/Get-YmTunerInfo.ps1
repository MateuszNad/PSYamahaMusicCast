
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
    Keywords: keywords
    Notes:
    Changelog:
#>
function Get-YmTunerInfo
{
    [cmdletbinding()]
    [Alias('tuner-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
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
                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/tuner/getPlayInfo"
                $Response.Content | ConvertFrom-Json
            }
            catch
            {
                Write-Warning "xxxx"
            }
        }
    }
    end
    {

    }
}
