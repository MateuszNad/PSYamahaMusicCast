<#
.Synopsis
     krotki_opis
    
.DESCRIPTION
    dlugi_opis
    
.EXAMPLE
    przyklad_1
    
.EXAMPLE
    przyklad_2
    
.LINK
    Author: autor 
    Link: akademiapowershell.pl
    
    Date: 26-08-2019
    Version: version
    eywords: keywords
    Notes: 
    Changelog:
#>
function Skip-YmPreviousPlayback {

    [cmdletbinding()]
    [Alias('previous-ym')]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )
    begin {

    }
    process {
        foreach ($Address in $DeviceAddress) {
            try {

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/netusb/setPlayback?playback=previous"
                $Response.Content | ConvertFrom-Json
            }
            catch {

            }
        }
    }
    end {

    }
}