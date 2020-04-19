<#
.Synopsis
    The function returns current status the device.

.DESCRIPTION
    The function returns current status the device.

.EXAMPLE
    Get-YmStatus  -DeviceAddress 10.10.0.30

    response_code       : 0
    power               : on
    sleep               : 0
    volume              : 22
    mute                : False
    max_volume          : 63
    input               : tuner
    distribution_enable : True
    link_control        : standard
    link_audio_quality  : compressed
    disable_flags       : 0
    responde_message    : Successful request

.EXAMPLE
    status-ym -DeviceAddress 10.10.0.30

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Get-YmStatus
{
    [cmdletbinding()]
    [Alias('status-ym')]
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
                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/main/getStatus"
                $Response.Content | ConvertFrom-Json | Add-YmResponseCode
            }
            catch
            {
                Write-Warning $PSItem
            }
        }
    }
    end
    {

    }
}
