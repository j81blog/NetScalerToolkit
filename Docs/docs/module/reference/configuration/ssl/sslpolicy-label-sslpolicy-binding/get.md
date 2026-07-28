---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSGetSSLPolicyLabelSSLPolicyBinding

## SYNOPSIS
Gets NetScaler sslpolicylabel_sslpolicy_binding configuration.

## SYNTAX

### All (Default)
```
Invoke-NSGetSSLPolicyLabelSSLPolicyBinding [-Filter <Hashtable>] [-ViewSummary] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

### ByName
```
Invoke-NSGetSSLPolicyLabelSSLPolicyBinding [-LabelName] <String> [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

### Count
```
Invoke-NSGetSSLPolicyLabelSSLPolicyBinding [-Count] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the sslpolicy that can be bound to sslpolicylabel.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSGetSSLPolicyLabelSSLPolicyBinding
```

### EXAMPLE 2
```
Invoke-NSGetSSLPolicyLabelSSLPolicyBinding -LabelName 'sslpolicylabel_sslpolicy_binding_example'
```

### EXAMPLE 3
```
Invoke-NSGetSSLPolicyLabelSSLPolicyBinding -Filter @{ servicetype = 'HTTP' }
```

## PARAMETERS

### -LabelName
Name of the SSL policy label to which to bind policies.

```yaml
Type: String
Parameter Sets: ByName
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Filter
NITRO filter values as a hashtable.

```yaml
Type: Hashtable
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ViewSummary
Requests the NITRO summary view.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Count
Returns only the number of matching resources.

```yaml
Type: SwitchParameter
Parameter Sets: Count
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

