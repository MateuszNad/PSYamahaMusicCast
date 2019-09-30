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

# Set-YmSleepTimer

## SYNOPSIS
The function sets sleep timer.

## SYNTAX

```
Set-YmSleepTimer [-DeviceAddress] <String[]> [[-Minute] <Int32>] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The function sets sleep timer.
Default time is 30 minutes

## EXAMPLES

### EXAMPLE 1
```
Set-YmSleepTimer -DeviceAddress 10.10.0.30
```

The function set sleep timer on 30 minutes.

### EXAMPLE 2
```
timer-ym -DeviceAddress 10.10.0.30
```

The function set sleep timer on 30 minutes.

### EXAMPLE 3
```
Set-YmSleepTimer -DeviceAddress 10.10.0.30 -Minutes 120
```

The function set sleep timer on 2 hours.
The devices after this time, it will power off.

### EXAMPLE 4
```
Set-YmSleepTimer -DeviceAddress 10.10.0.30 -Minutes 0
```

Deactivating the sleep timer.

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

### -Minute
{{ Fill Minute Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 30
Accept pipeline input: False
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

