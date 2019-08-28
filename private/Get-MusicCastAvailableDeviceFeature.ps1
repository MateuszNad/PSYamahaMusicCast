

<#
Invoke-WebRequest 'http://10.10.0.30/YamahaExtendedControl/v1/main/setPower?power=on'
Invoke-WebRequest 'http://10.10.0.30/YamahaExtendedControl/v1/main/setPower?power=standby'

Invoke-WebRequest 'http://10.10.0.30/YamahaExtendedControl/v1/main/setInput?input=aux'


Invoke-WebRequest 'http://10.10.0.30/YamahaExtendedControl/v1/main/setVolume?volume=up'
Invoke-WebRequest 'http://10.10.0.30/YamahaExtendedControl/v1/main/setVolume?volume=down'

#>

function Get-YmAvailableDeviceFeature {
    <#
.EXAMPLE
Get-YmAvailableDeviceFeature -DeviceAddress 10.10.0.30

.EXAMPLE
#>
    [cmdletbinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress
    )
    begin {

    }
    process {
        foreach ($Address in $DeviceAddress) {
            try {

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/getFeatures"
                $Response.Content | ConvertFrom-Json
            }
            catch {

            }
        }
    }
    end {

    }
}