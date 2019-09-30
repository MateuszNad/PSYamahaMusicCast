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

# Get-YmStatus

## SYNOPSIS
The function returns current status the device.

## SYNTAX

```
Get-YmStatus [-DeviceAddress] <String[]> [<CommonParameters>]
```

## DESCRIPTION
The function returns current status the device.

## EXAMPLES

### EXAMPLE 1
```
Get-YmStatus  -DeviceAddress 10.10.0.30
```

response_code       : 0
power               : on
sleep               : 0
volume              : 22
mute                : False
max_volume          : 63
input               : tuner
distribution_enable : True
link_control        : standard
link_audio_quality  : compressed
disable_flags       : 0
responde_message    : Successful request

### EXAMPLE 2
```
status-ym -DeviceAddress 10.10.0.30
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

