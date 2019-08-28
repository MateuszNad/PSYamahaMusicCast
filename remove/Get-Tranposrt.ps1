# Stop 
# http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=stop
# Play 
# http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=play
# Previous 
# http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=previous
# Next 
# http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=next
# Fast Rewind - Start http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=fast_reverse_start
# Fast Rewind -Stop http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=fast_reverse_end
# Fast Forward -Start http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=fast_forward_start 
# Fast Forward -Stop http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=fast_forward_end

# # Do zastanowienia się jak to ustawić.
# Repeat (Toggle) http://$Address/YamahaExtendedControl/v1/netusb/toggleRepeat
# Shuffle (Toggle) http://$Address/YamahaExtendedControl/v1/netusb/toggleShuffle


function Skip-MusicCastNextPlayback {
    <#
    .EXAMPLE
    Get-MusicCastZoneInfo -DeviceAddress 10.10.0.30

    .EXAMPLE
#>
    [cmdletbinding()]
    [Alias('Skip-NextPlayback', 'Next-Playback', 'next')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )
    begin {

    }
    process {
        foreach ($Address in $DeviceAddress) {
            try {

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=next"
                $Response.Content | ConvertFrom-Json
            }
            catch {

            }
        }
    }
    end {

    }
}

