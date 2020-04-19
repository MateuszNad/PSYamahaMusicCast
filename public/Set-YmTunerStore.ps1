
<#
.Synopsis
    The function saves a present settings tuner frequency

.DESCRIPTION
    The function saves a present settings tuner frequency

.EXAMPLE
    Set-YmTunerStore -$DeviceAddress 10.10.0.30 -Number 2

.EXAMPLE
    Set-YmTunerStore -$DeviceAddress 10.10.0.30 -Number 2 -PassThru

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmTunerStore
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias()]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory)]
        [int]$Number,
        [switch]$PassThru

    )
    begin
    {

    }
    process
    {
        if ($PSCmdlet.ShouldProcess($DeviceAddress))
        {

            foreach ($Address in $DeviceAddress)
            {
                try
                {

                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/tuner/storePreset?num=$Number"
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
    }
    end
    {

    }
}
