

<#
.Synopsis
    The function skips to previous a stored tuner frequency

.DESCRIPTION
    The function skips to previous a stored tuner frequency

.EXAMPLE
    Set-YmTunerPrevious -DeviceAddress 10.10.0.30

.EXAMPLE
    Set-YmTunerPrevious -DeviceAddress 10.10.0.30 -PassThru

.EXAMPLE
    tuner-previous -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmTunerPrevious
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias('tuner-previous')]
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

                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/tuner/switchPreset?dir=previous"
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
