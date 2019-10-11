
<p align="left">
  <a href="https://www.powershellgallery.com/packages/PSYamahaMusicCast"><img src="https://img.shields.io/azure-devops/build/mnadobnik/e0b7e400-0d25-496b-90c1-d3d3224f163c/4"></a>
  <a href="https://www.powershellgallery.com/packages/PSYamahaMusicCast"><img src="https://img.shields.io/powershellgallery/v/PSYamahaMusicCast.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSYamahaMusicCast"><img src="https://img.shields.io/powershellgallery/p/PSYamahaMusicCast.svg"></a>
  <a href="https://twitter.com/MateuszNadobnik"><img src="https://img.shields.io/twitter/follow/MateuszNadobnik.svg?label=Twitter%20%40MateuszNadobnik&style=social"></a>
  <a href="https://akademiapowershell.pl"><img src="https://img.shields.io/badge/Blog-AkademiaPowerShell-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/mnadobnik/"><img src="https://img.shields.io/badge/LinkedIn-mnadobnik-0077B5.svg?logo=LinkedIn"></a>
</p>



# PSYamahaMusicCast
**PSYamahaMusicCast** is PowerShell module allows control the Yamaha devices which have got the [MusicCast](https://europe.yamaha.com/en/products/contents/audio_visual/musiccast/index.html) system.

**PSYamahaMusicCast** now has 25 functions:
- Disable-YmStandby
- Enable-YmStandby
- Get-YmDeviceInformation
- Get-YmNetworkStatus
- Get-YmSleepTimer
- Get-YmStatus
- Get-YmPlayingInfo
- Get-YmTunerInfo
- Set-YmInput
- Set-YmMuteOff
- Set-YmMuteOn
- Set-YmPowerOn
- Set-YmPowerStandby
- Set-YmSleepTimer
- Set-YmTunerFrequency
- Set-YmTunerNext
- Set-YmTunerPrevious
- Set-YmTunerStore
- Set-YmVolume
- Set-YmVolumeDown
- Set-YmVolumeUp
- Skip-YmNextPlayback
- Skip-YmPreviousPlayback
- Start-YmPlayback
- Stop-YmPlayback
- Stop-YmSleepTimer

## ChangeLog

- 0.1.5 - 11.10.2019
  - New function - Get-YmPlayingInfo

- 0.1.4.2 - 29.09.2019
  - Beta version

## To install

```powershell
Install-Module -Name PSYamahaMusicCast -Force
```

Force isn't really necessary but they do skip errors in case some appear.

## And to update

```powershell
Update-Module -Name PSYamahaMusicCast
```

Whenever there's new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen **PowerShell** session if you have already used module before updating it.

## Tip
Add to your profile a default value for parameter DeviceAddress. It will help you on easier use the functions of PSYamahaMusicCast.

```powershell
$PSDefaultParameterValues.Add("*-Ym*:DeviceAddress", "10.10.0.30")
```

## Examples

The command will turn on your device, sets the input to a tuner and increases volume up by one.

```powershell
Set-YmPowerOn -DeviceAddress 10.10.0.30
Set-YmInput -DeviceAddress 10.10.0.30 -Input tuner
Set-YmVolume  -DeviceAddress
```

or easier (when we add `PSDefaultParameterValues`)

```powershell
poweron-ym
input-ym -Input tuner
up-ym
```

The command will turn on your device, sets the input to Spotify and skips to next track.

```powershell
poweron-ym
input-ym -Input spotify
next-ym

info-ym

# response_code     : 0
# input             : spotify
# play_queue_type   : system
# playback          : play
# repeat            : off
# shuffle           : off
# play_time         : -60000
# total_time        : 0
# artist            : Alicia Keys
# album             : The Element Of Freedom
# track             : Empire State of Mind (Part II) Broken Down
# albumart_url      : /YamahaRemoteControl/AlbumART/AlbumART9294.jpg
# albumart_id       : 9294
# usb_devicetype    : unknown
# auto_stopped      : False
# attribute         : 16777631
# repeat_available  : {}
# shuffle_available : {}
# responde_message  : Successful request
```
