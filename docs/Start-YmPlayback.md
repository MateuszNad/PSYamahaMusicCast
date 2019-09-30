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

# Start-YmPlayback

## SYNOPSIS
The function start a playback.

## SYNTAX

```
Start-YmPlayback [-DeviceAddress] <String[]> [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The function start a playback

## EXAMPLES

### EXAMPLE 1
```
Start-YmPlayback -DeviceAddress 10.10.0.30
```

Default the function doesn't return object, it only start a playback.

### EXAMPLE 2
```
play-ym -DeviceAddress 10.10.0.30
```

Default the function doesn't return object, it only start a playback.

### EXAMPLE 3
```
Start-YmPlayback -DeviceAddress 10.10.0.30 -PassThru
```

response_code responde_message
------------- ----------------
            0 Successful request

The function with the parameter -PassThru returns information about result.

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

### -PassThru
{{ Fill PassThru Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
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

