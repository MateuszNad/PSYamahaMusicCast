<#
.Synopsis
    The function go to next a track.

.DESCRIPTION
    The function go to next a track.

.EXAMPLE
    Skip-YmNextPlayback -DeviceAddress 10.10.0.30

    Default the function doesn't return object, it only next track.

.EXAMPLE
    next-ym -DeviceAddress 10.10.0.30

    Default the function doesn't return object, it only next track.

.EXAMPLE
    Skip-YmNextPlayback -DeviceAddress 10.10.0.30 -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

    The function with the parameter -PassThru returns information about result.

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    eywords: keywords
    Notes:
    Changelog:
#>
function Skip-YmNextPlayback
{
    [cmdletbinding()]
    [Alias('next-ym')]
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

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=next"
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