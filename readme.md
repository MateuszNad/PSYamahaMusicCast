
<p align="left">
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

- 0.1.3.0 - 22.09.2019
  - Beta version

## To install

```powershell
Install-Module -Name PSYamahaMusicCast -Force
```

Force aren't really nessecary but they do skip errors in case some appear.

## And to update

```powershell
Update-Module -Name PSYamahaMusicCast
```

Whenever there's new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen **PowerShell** session if you have already used module before updating it.

## Tip
Add to your profile default value for parameter DeviceAddress. It will help you on easier use the functions of PSYamahaMusicCast.

```powershell
$PSDefaultParameterValues.Add("*-Ym*:DeviceAddress", "10.10.0.30")
```