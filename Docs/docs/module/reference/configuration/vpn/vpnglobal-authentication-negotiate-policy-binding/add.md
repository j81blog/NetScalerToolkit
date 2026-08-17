---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddVPNGlobalAuthenticationNegotiatePolicyBinding

## SYNOPSIS
Creates a NetScaler vpnglobal_authenticationnegotiatepolicy_binding resource.

## SYNTAX

```
Invoke-NSAddVPNGlobalAuthenticationNegotiatePolicyBinding [[-GotoPriorityExpression] <String>]
 [[-GroupExtrAction] <Boolean>] [[-PolicyName] <String>] [[-Priority] <Int32>] [[-Secondary] <Boolean>]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the authenticationnegotiatepolicy that can be bound to vpnglobal.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddVPNGlobalAuthenticationNegotiatePolicyBinding  -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddVPNGlobalAuthenticationNegotiatePolicyBinding  -WhatIf
```

## PARAMETERS

### -GotoPriorityExpression
Applicable only to advance vpn session policy.
An expression or other value specifying the priority of the next policy which will get evaluated if the current policy rule evaluates to TRUE.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupExtrAction
Bind the Authentication policy to a tertiary chain which will be used only for group extraction.
The user will not authenticate against this server, and this will only be called it primary and/or secondary authentication has succeeded.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -PolicyName
The name of the policy.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
Integer specifying the policy's priority.
The lower the priority number, the higher the policy's priority.
Maximum value for default syntax policies is 2147483647 and for classic policies is 64000.
Minimum value = 0 Maximum value = 2147483647

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Secondary
Bind the authentication policy as the secondary policy to use in a two-factor configuration.
A user must then authenticate not only to a primary authentication server but also to a secondary authentication server.
User groups are aggregated across both authentication servers.
The user name must be exactly the same on both authentication servers, but the authentication servers can require different passwords.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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
Position: 6
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

