---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nssession/clear/
schema: 2.0.0
---

# Clear-NSSession

## SYNOPSIS
Clears the active NetScaler session.

## SYNTAX

```
Clear-NSSession [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Removes the session object held by the module so later commands no longer have a
default session.
This only discards the local reference.
Use Disconnect-NSNode
instead when the NetScaler session should also be logged out.

## EXAMPLES

### EXAMPLE 1
```
Clear-NSSession
```

Forgets the active session without logging out on the NetScaler.

## PARAMETERS

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

[https://netscalertoolkit.j81.nl/module/reference/common/nssession/clear/](https://netscalertoolkit.j81.nl/module/reference/common/nssession/clear/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


