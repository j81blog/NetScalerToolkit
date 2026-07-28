---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nssession/set/
schema: 2.0.0
---

# Set-NSSession

## SYNOPSIS
Sets the active NetScaler session.

## SYNTAX

```
Set-NSSession [-Session] <PSObject> [<CommonParameters>]
```

## DESCRIPTION
Stores a session object as the module default, so later commands can be called
without passing -Session.
Connect-NSNode already does this, so this function is
mainly used to switch back to an earlier session when working with more than one
NetScaler in the same console.

## EXAMPLES

### EXAMPLE 1
```
Set-NSSession -Session $productionSession
```

Makes a previously stored session the active one.

### EXAMPLE 2
```
$lab = Connect-NSNode -ManagementUrl https://lab.example.local -Credential $cred -PassThru
```

$prod = Connect-NSNode -ManagementUrl https://prod.example.local -Credential $cred -PassThru
$lab | Set-NSSession

Connects to two NetScalers and switches the active session back to the lab node.

## PARAMETERS

### -Session
Session object to make active, as returned by Connect-NSNode -PassThru or
Get-NSSession.
Accepts pipeline input.

```yaml
Type: PSObject
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

[https://netscalertoolkit.j81.nl/module/reference/common/nssession/set/](https://netscalertoolkit.j81.nl/module/reference/common/nssession/set/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


