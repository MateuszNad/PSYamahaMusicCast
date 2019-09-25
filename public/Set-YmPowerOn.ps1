<#
.Synopsis
    The function powers on the device.

.DESCRIPTION
    The function powers on the device.

.EXAMPLE
    Set-YmPowerOn -DeviceAddress 10.10.0.30

.EXAMPLE
    Set-YmPowerOn -DeviceAddress 10.10.0.30

    response_code responde_message
    ------------- ----------------
                0 Successful request
.EXAMPLE
    poweron-ym  -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmPowerOn
{

    [cmdletbinding(SupportsShouldProcess)]
    [Alias('poweron-ym')]
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
                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v2/main/setPower?power=on"
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
