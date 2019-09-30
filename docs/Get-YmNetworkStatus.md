---
external help file: PSYamahaMusicCast-help.xml
Module Name: PSYamahaMusicCast
online version: Author: autor
Link: akademiapowershell.pl

Date: 26-08-2019
Version: version
Keywords: keywords
Notes:
Changelog:
schema: 2.0.0
---

# Get-YmNetworkStatus

## SYNOPSIS
The function returns information about network configuration.

## SYNTAX

```
Get-YmNetworkStatus [-DeviceAddress] <String[]> [<CommonParameters>]
```

## DESCRIPTION
The function returns information about network configuration.

## EXAMPLES

### EXAMPLE 1
```
Get-YmNetworkStatus -DeviceAddress 10.10.0.30
```

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

### EXAMPLE 2
```
przyklad_2
```

## PARAMETERS

### -DeviceAddress
{{ Fill DeviceAddress Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Author: autor
Link: akademiapowershell.pl

Date: 26-08-2019
Version: version
Keywords: keywords
Notes:
Changelog:](Author: autor
Link: akademiapowershell.pl

Date: 26-08-2019
Version: version
Keywords: keywords
Notes:
Changelog:)

