

<#
.Synopsis
    The function skips to next a stored tuner frequency.

.DESCRIPTION
    The function skips to next a stored tuner frequency.

.EXAMPLE
    Set-YmTunerNext -DeviceAddress 10.10.0.30

.EXAMPLE
    Set-YmTunerNext -DeviceAddress 10.10.0.30 -PassThru

.EXAMPLE
    tuner-next -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmTunerNext
{

    [cmdletbinding(SupportsShouldProcess)]
    [Alias('tuner-next')]
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
        if ($PSCmdlet.ShouldProcess($DeviceAddress))
        {
            foreach ($Address in $DeviceAddress)
            {
                try
                {

                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/tuner/switchPreset?dir=next"
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
