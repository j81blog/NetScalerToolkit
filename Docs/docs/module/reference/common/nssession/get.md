---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version: https://netscalertoolkit.j81.nl/module/reference/common/nssession/get/
schema: 2.0.0
---

# Get-NSSession

## SYNOPSIS
Gets the active NetScaler session.

## SYNTAX

```
Get-NSSession [<CommonParameters>]
```

## DESCRIPTION
Returns the session object stored by Connect-NSNode or Set-NSSession.
Most
functions in this module fall back to this session when no -Session is passed,
so this is mainly useful for inspecting the current connection or passing it
explicitly to another command.

Returns nothing when no session is active.

## EXAMPLES

### EXAMPLE 1
```
Get-NSSession
```

Returns the active session object, or nothing when not connected.

### EXAMPLE 2
```
(Get-NSSession).ManagementUrl
```

Shows which NetScaler the current session is connected to.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://netscalertoolkit.j81.nl/module/reference/common/nssession/get/](https://netscalertoolkit.j81.nl/module/reference/common/nssession/get/)

[https://netscalertoolkit.j81.nl/](https://netscalertoolkit.j81.nl/)


