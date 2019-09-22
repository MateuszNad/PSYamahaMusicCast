<#
.Synopsis
    The functions sets tuner frequency.

.DESCRIPTION
    The functions sets tuner frequency.

.EXAMPLE


.EXAMPLE


.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmTunerFrequency
{
    [cmdletbinding()]
    [Alias('set-frequency')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory, Position = 1)]
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