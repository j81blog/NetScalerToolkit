---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddVariable

## SYNOPSIS
Creates a NetScaler nsvariable resource.

## SYNTAX

```
Invoke-NSAddVariable [-Comment <String>] [-Expires <Int32>] [-Iffull <String>] [-Ifnovalue <String>]
 [-Ifvaluetoobig <String>] [-Init <String>] [-Name] <String> [-Scope <String>] -Type <String>
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for variable resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddVariable -Name 'example' -Type 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddVariable -Name 'example' -Type 'example' -WhatIf
```

## PARAMETERS

### -Comment
Comments associated with this variable.

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

### -Expires
Value expiration in seconds.
If the value is not referenced within the expiration period it will be deleted.
0 (the default) means no expiration.
Minimum value = 0 Maximum value = 31622400

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

### -Iffull
Action to perform if an assignment to a map exceeds its configured max-entries: lru - (default) reuse the least recently used entry in the map.
undef - force the assignment to return an undefined (Undef) result to the policy executing the assignment.
Default value: lru Possible values = undef, lru

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

### -Ifnovalue
Action to perform if on a variable reference in an expression if the variable is single-valued and uninitialized or if the variable is a map and there is no value for the specified key: init - (default) initialize the single-value variable, or create a map entry for the key and the initial value, using the -init value or its default.
undef - force the expression evaluation to return an undefined (Undef) result to the policy executing the expression.
Default value: init Possible values = undef, init

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

### -Ifvaluetoobig
Action to perform if an value is assigned to a text variable that exceeds its configured max-size, or if a key is used that exceeds its configured max-size: truncate - (default) truncate the text string to the first max-size bytes and proceed.
undef - force the assignment or expression evaluation to return an undefined (Undef) result to the policy executing the assignment or expression.
Default value: truncate Possible values = undef, truncate

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

### -Init
Initialization value for this variable, to which a singleton variable or map entry will be set if it is referenced before an assignment action has assigned it a value.
If the singleton variable or map entry already has been assigned a value, setting this parameter will have no effect on that variable value.
Default: 0 for ulong, NULL for text.

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

### -Name
Variable name.
This follows the same syntax rules as other expression entity names: It must begin with an alpha character (A-Z or a-z) or an underscore (_).
The rest of the characters must be alpha, numeric (0-9) or underscores.
It cannot be re or xp (reserved for regular and XPath expressions).
It cannot be an expression reserved word (e.g.
SYS or HTTP).
It cannot be used for an existing expression object (HTTP callout, patset, dataset, stringmap, or named expression).
Minimum length = 1

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

### -Scope
Scope of the variable: global - (default) one set of values visible across all Packet Engines on a standalone Citrix ADC, an HA pair, or all nodes of a cluster transaction - one value for each request-response transaction (singleton variables only; no expiration).
Default value: global Possible values = global, transaction

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

### -Type
Specification of the variable type; one of the following: ulong - singleton variable with an unsigned 64-bit value.
text(value-max-size) - singleton variable with a text string value.
map(text(key-max-size),ulong,max-entries) - map of text string keys to unsigned 64-bit values.
map(text(key-max-size),text(value-max-size),max-entries) - map of text string keys to text string values.
where value-max-size is a positive integer that is the maximum number of bytes in a text string value.
key-max-size is a positive integer that is the maximum number of bytes in a text string key.
max-entries is a positive integer that is the maximum number of entries in a map variable.
For a global singleton text variable, value-max-size \<= 64000.
For a global map with ulong values, key-max-size \<= 64000.
For a global map with text values, key-max-size + value-max-size \<= 64000.
max-entries is a positive integer that is the maximum number of entries in a map variable.
This has a theoretical maximum of 2^64-1, but in actual use will be much smaller, considering the memory available for use by the map.
Example: map(text(10),text(20),100) specifies a map of text string keys (max size 10 bytes) to text string values (max size 20 bytes), with 100 max entries.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
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

