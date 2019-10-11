<#
.Synopsis
    The function returns information about what's currently playing.

.DESCRIPTION
    The function returns information about what's currently playing.

.EXAMPLE
    Get-YmPlayingInfo  -DeviceAddress 10.10.0.30

    response_code     : 0
    input             : spotify
    play_queue_type   : system
    playback          : play
    repeat            : off
    shuffle           : off
    play_time         : -60000
    total_time        : 0
    artist            : Jax Jones
    album             : All Day And Night
    track             : All Day And Night - Jax Jones & Martin Solveig Present Europa
    albumart_url      : /YamahaRemoteControl/AlbumART/AlbumART9276.jpg
    albumart_id       : 9276
    usb_devicetype    : unknown
    auto_stopped      : False
    attribute         : 16777631
    repeat_available  : {}
    shuffle_available : {}
    responde_message  : Successful request

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
function Get-YmPlayingInfo
{
    [cmdletbinding()]
    [Alias('info-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
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
                $TypeInput = (Get-YmTypeInput -DeviceAddress $Address).Type

                # http://192.168.5.219/YamahaExtendedControl/v1/netusb/getPresetInfo
                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/$TypeInput/getPlayInfo"
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
