---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSPing6

## SYNOPSIS
Sends a NetScaler ping6 request.

## SYNTAX

```
Invoke-NSPing6 [-HostName] <String> [-B <Int32>] [-C <Int32>] [-I <String>] [-M <Boolean>] [-N <Boolean>]
 [-P <String>] [-Q <Boolean>] [-S <String>] [-T <Int32>] [-V <Int32>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

## DESCRIPTION
Configuration for 0 resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSPing6 -HostName '192.0.2.10' -C 1 -I 'example' -S 'example'
```

## PARAMETERS

### -HostName
Address of host to ping.
Minimum length = 1 Maximum length = 256

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -B
Set socket buffer size.
If used, should be used with roughly +100 then the datalen (-s option).
The default value is 8192.
Minimum value = 132 Maximum value = 131071

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -C
Number of packets to send.
The default value is infinite.
For Nitro API, defalut value is taken as 5.
Minimum value = 1 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -I
Waiting time, in seconds.
The default value is 1 second.
Minimum value = 0 Maximum value = 65535

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -M
By default, ping6 asks the kernel to fragment packets to fit into the minimum IPv6 MTU.The -m option will suppress the behavior for unicast packets.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -N
Numeric output only.
No name resolution.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -P
Pattern to fill in packets.
Can be up to 16 bytes, useful for diagnosing data-dependent problems.
Minimum length = 1 Maximum length = 32

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Q
Quiet output.
Only summary is printed.
For Nitro API, this flag is set by default.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -S
Data size, in bytes.
The default value is 32.
Minimum value = 0 Maximum value = 65527

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -T
Traffic Domain Id.
Minimum value = 1 Maximum value = 4094

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -V
VLAN ID for link local address.
Minimum value = 1 Maximum value = 4094

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
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
Position: Named
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

