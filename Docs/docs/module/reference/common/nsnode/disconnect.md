---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nsnode/disconnect/
schema: 2.0.0
---

# Disconnect-NSNode

## SYNOPSIS
Disconnects from a NetScaler node.

## SYNTAX

```
Disconnect-NSNode [[-Session] <PSObject>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Logs out the NetScaler session and clears it from the module.
Sessions that use
NITRO header authentication have no server-side session to end, so for those the
local session is simply discarded.

When the session was created with -HA, the primary and secondary node sessions
are logged out as well.

## EXAMPLES

### EXAMPLE 1
```
Disconnect-NSNode
```

Logs out the active session.

### EXAMPLE 2
```
Disconnect-NSNode -Session $labSession
```

Logs out a specific session while leaving the active session untouched.

## PARAMETERS

### -Session
Session to disconnect.
Defaults to the active session from Get-NSSession.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: (Get-NSSession)
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

[https://netscalertoolkit.j81.nl/module/reference/common/nsnode/disconnect/](https://netscalertoolkit.j81.nl/module/reference/common/nsnode/disconnect/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


