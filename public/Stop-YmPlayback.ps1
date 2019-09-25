<#
.Synopsis
     The function stop a playback.

.DESCRIPTION
    The function stop a playback

.EXAMPLE
    Stop-YmPlayback -DeviceAddress 10.10.0.30

    Default the function doesn't return object, it only stop a playback.

.EXAMPLE
    stop-ym -DeviceAddress 10.10.0.30

    Default the function doesn't return object, it only stop a playback.

.EXAMPLE
    Stop-YmPlayback -DeviceAddress 10.10.0.30 -PassThru

    response_code responde_message
    ------------- ----------------
                0 Successful request

    The function with the parameter -PassThru returns information about result.

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: stop, playback
    Notes:
    Changelog:
#>
function Stop-YmPlayback
{
    [cmdletbinding(SupportsShouldProcess)]
    [Alias('stop-ym')]
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

                    $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=stop"
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