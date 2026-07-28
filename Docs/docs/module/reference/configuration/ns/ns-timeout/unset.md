---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetNsTimeout

## SYNOPSIS
Clears one or more NetScaler nstimeout resource properties.

## SYNTAX

```
Invoke-NSUnsetNsTimeout [-AnyClient] [-AnyServer] [-AnyTCPClient] [-AnyTCPServer] [-Client] [-Halfclose]
 [-HTTPClient] [-HTTPSErver] [-NewConnIdleTimeout] [-NonTCPZombie] [-ReducedfinTimeout] [-ReducedrstTimeout]
 [-Server] [-TCPClient] [-TCPServer] [-Zombie] [[-Session] <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for timeout resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetNsTimeout -AnyClient  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetNsTimeout -AnyClient  -WhatIf
```

## PARAMETERS

### -AnyClient
Global idle timeout, in seconds, for non-TCP client connections.
This value is over ridden by the client timeout that is configured on individual entities.
Default value: 0 Minimum value = 0 Maximum value = 31536000

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

### -AnyServer
Global idle timeout, in seconds, for non TCP server connections.
This value is over ridden by the server timeout that is configured on individual entities.
Default value: 0 Minimum value = 0 Maximum value = 31536000

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

### -AnyTCPClient
Global idle timeout, in seconds, for TCP client connections.
This value takes precedence over entity level timeout settings (vserver/service).
This is applicable only to transport protocol TCP.
Default value: 0 Minimum value = 0 Maximum value = 31536000

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

### -AnyTCPServer
Global idle timeout, in seconds, for TCP server connections.
This value takes precedence over entity level timeout settings ( vserver/service).
This is applicable only to transport protocol TCP.
Default value: 0 Minimum value = 0 Maximum value = 31536000

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

### -Client
Client idle timeout (in seconds).
If zero, the service-type default value is taken when service is created.
Default value: 0 Minimum value = 0 Maximum value = 18000

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

### -Halfclose
Idle timeout, in seconds, for connections that are in TCP half-closed state.
Default value: 10 Minimum value = 1 Maximum value = 600

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

### -HTTPClient
Global idle timeout, in seconds, for client connections of HTTP service type.
This value is over ridden by the client timeout that is configured on individual entities.
Default value: 0 Minimum value = 0 Maximum value = 18000

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

### -HTTPSErver
Global idle timeout, in seconds, for server connections of HTTP service type.
This value is over ridden by the server timeout that is configured on individual entities.
Default value: 0 Minimum value = 0 Maximum value = 18000

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

### -NewConnIdleTimeout
Timer interval, in seconds, for new TCP NATPCB connections on which no data was received.
Default value: 4 Minimum value = 1 Maximum value = 120

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

### -NonTCPZombie
Interval at which the zombie clean-up process for non-TCP connections should run.
Inactive IP NAT connections will be cleaned up.
Default value: 60 Minimum value = 1 Maximum value = 600

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

### -ReducedfinTimeout
Alternative idle timeout, in seconds, for closed TCP NATPCB connections.
Default value: 30 Minimum value = 1 Maximum value = 300

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

### -ReducedrstTimeout
Timer interval, in seconds, for abruptly terminated TCP NATPCB connections.
Default value: 0 Minimum value = 0 Maximum value = 300

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

### -Server
Server idle timeout (in seconds).
If zero, the service-type default value is taken when service is created.
Default value: 0 Minimum value = 0 Maximum value = 18000

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

### -TCPClient
Global idle timeout, in seconds, for non-HTTP client connections of TCP service type.
This value is over ridden by the client timeout that is configured on individual entities.
Default value: 0 Minimum value = 0 Maximum value = 18000

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

### -TCPServer
Global idle timeout, in seconds, for non-HTTP server connections of TCP service type.
This value is over ridden by the server timeout that is configured on entities.
Default value: 0 Minimum value = 0 Maximum value = 18000

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

### -Zombie
Interval, in seconds, at which the Citrix ADC zombie cleanup process must run.
This process cleans up inactive TCP connections.
Default value: 120 Minimum value = 1 Maximum value = 600

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

### -Session
The NetScaler session.
If omitted, the current default session is used.

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

### -IgnoreNotFound
Returns null instead of throwing for known NITRO not-found responses.

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

### -ReturnNullOnNotFound
Returns null instead of throwing for known NITRO not-found responses.

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

### -ThrowOnWarning
Treats NITRO warning responses as terminating errors.

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

### -PassThru
Returns the updated resource after the operation completes.

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

### System.Management.Automation.PSCustomObject
## NOTES
Generated from NetScaler NITRO API metadata.
Generated: 2026-06-01 21:28
Supported metadata versions: 13.1, 14.1.

## RELATED LINKS

