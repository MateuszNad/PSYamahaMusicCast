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
function Set-YmTunerFrequency
{

    [cmdletbinding()]
    [Alias('set-frequency')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory)]
        [ValidateRange(87500, 108000)]
        [int]$Frequency,
        [ValidateSet('fm', 'am')]
        [string]$Band = 'fm'
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
                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/tuner/setFreq?band=fm&tuning=direct&num=$Frequency"
                $ResponseObj = $Response.Content | ConvertFrom-Json

                if ($ResponseObj.response_code -eq 0)
                {
                    Get-YmStatus -DeviceAddress $DeviceAddress
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