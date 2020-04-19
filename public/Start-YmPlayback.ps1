<#
.Synopsis
     The function start a playback.

.DESCRIPTION
    The function start a playback

.EXAMPLE
    Start-YmPlayback -DeviceAddress 10.10.0.30

    Default the function doesn't return object, it only start a playback.

.EXAMPLE
    play-ym -DeviceAddress 10.10.0.30

    Default the function doesn't return object, it only start a playback.

.EXAMPLE
    Start-YmPlayback -DeviceAddress 10.10.0.30 -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

    The function with the parameter -PassThru returns information about result.

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Start-YmPlayback
{

    [cmdletbinding(SupportsShouldProcess)]
    [Alias('play-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline, Position = 0)]
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

                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=play"
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
