
function Get-YmInputList {
    param(
        [Parameter(Mandatory)]
        [string]$DeviceAddress
    )
    (Get-YmAvailableDeviceFeature -DeviceAddress $DeviceAddress).System.input_list
}


function Get-YmFunctionList {
    param(
        [Parameter(Mandatory)]
        [string]$DeviceAddress
    )
    (Get-YmAvailableDeviceFeature -DeviceAddress $DeviceAddress).System.func_list
}