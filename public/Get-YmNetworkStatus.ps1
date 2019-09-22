
<#
.Synopsis
    The function returns information about network configuration.

.DESCRIPTION
    The function returns information about network configuration.

.EXAMPLE
    Get-YmNetworkStatus -DeviceAddress 10.10.0.30

    response_code     : 0
    network_name      : Room
    connection        : wireless_lan
    dhcp              : False
    ip_address        : 10.10.0.30
    subnet_mask       : 255.255.255.224
    default_gateway   : 10.10.0.1
    dns_server_1      : 10.10.0.1
    dns_server_2      : 10.10.0.1
    wireless_lan      : @{ssid=OknoNaSwiat; type=wpa2-psk(aes); key=; ch=10; strength=86}
    wireless_direct   : @{ssid=CD-NT670 D63156; type=none; key=}
    musiccast_network : @{ready=True; device_type=standard; child_num=0; ch=0; initial_join_running=False}
    mac_address       : @{wired_lan=00A0DED63156; wireless_lan=209148B6B5EA; wireless_direct=209148B6B5EB}
    airplay_pin       :
    responde_message  : Successful request

.EXAMPLE
    przyklad_2

.LINK
    Author: autor
    Link: akademiapowershell.pl

    Date: 26-08-2019
    Version: version
    Keywords: keywords
    Notes:
    Changelog:
#>
function Get-YmNetworkStatus
{
    [cmdletbinding()]
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

                $Response = Invoke-WebRequest -Uri "http://$Address/YamahaExtendedControl/v1/system/getNetworkStatus"
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
