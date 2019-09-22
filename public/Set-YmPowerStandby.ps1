<#
.Synopsis
    The function switches the device on standby.

.DESCRIPTION
    The function switches the device on standby.

.EXAMPLE
    Set-YmPowerStandby -DeviceAddress 10.10.0.30 -PassThru

.EXAMPLE
    Set-YmPowerStandby -DeviceAddress 10.10.0.30 -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

.EXAMPLE
    standby-ym -DeviceAddress 10.10.0.30

.EXAMPLE
    poweroff-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Set-YmPowerStandby
{
    [cmdletbinding()]
    [Alias('standby-ym', 'Set-YmPowerOff', 'poweroff-ym')]
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

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v2/main/setPower?power=standby"
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
