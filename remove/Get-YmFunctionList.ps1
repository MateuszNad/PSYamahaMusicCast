
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
function Get-YmFunctionList {

    [cmdletbinding()]
    [Alias()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$DeviceAddress,
        [Parameter(Mandatory = $false)]
        [int]$Minutes = 30
    )
    begin {

    }
    process {
        foreach ($Address in $DeviceAddress) {
            try {
                $Response = Invoke-WebRequest -Uri "http://10.10.0.30/YamahaExtendedControl/v1/system/getFeatures"
                $Obj = $Response.Content | ConvertFrom-Json

                $Obj.system.func_list
            }
            catch {

            }
        }
    }
    end {

    }
}
# $Response = Invoke-WebRequest -Uri "http://10.10.0.30/YamahaExtendedControl/v1/system/getFeatures"
# $Obj = $Response.Content | ConvertFrom-Json

# $Obj.system.func_list
# $Obj.system.input_list
# $Obj.tuner.func_list.
# $Obj.netusb