---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSDeleteVPNVServerAuthenticationOAuthIDPPolicyBinding

## SYNOPSIS
Removes a NetScaler vpnvserver_authenticationoauthidppolicy_binding resource.

## SYNTAX

```
Invoke-NSDeleteVPNVServerAuthenticationOAuthIDPPolicyBinding [-Name] <String> [-Policy <String>]
 [-Secondary <Boolean>] [-GroupExtrAction <Boolean>] [-Bindpoint <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the authenticationoauthidppolicy that can be bound to vpnvserver.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSDeleteVPNVServerAuthenticationOAuthIDPPolicyBinding -Name 'example' -Policy 'policy_example' -Secondary $true -GroupExtrAction $true -Bindpoint REQUEST -Confirm:$false
```

### EXAMPLE 2
```
Invoke-NSGetVPNVServerAuthenticationOAuthIDPPolicyBinding -Name 'vpnvserver_authenticationoauthidppolicy_binding_example' | Invoke-NSDeleteVPNVServerAuthenticationOAuthIDPPolicyBinding -Confirm:$false
```

## PARAMETERS

### -Name
Name of the virtual server.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Policy
The name of the policy, if any, bound to the VPN virtual server.

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

### -Secondary
Binds the authentication policy as the secondary policy to use in a two-factor configuration.
A user must then authenticate not only via a primary authentication method but also via a secondary authentication method.
User groups are aggregated across both.
The user name must be exactly the same for both authentication methods, but they can require different passwords.

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

### -GroupExtrAction
Binds the authentication policy to a tertiary chain which will be used only for group extraction.
The user will not authenticate against this server, and this will only be called if primary and/or secondary authentication has succeeded.

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

### -Bindpoint
Bind point to which to bind the policy.
Applies only to rewrite and cache policies.
If you do not set this parameter, the policy is bound to REQ_DEFAULT or RES_DEFAULT, depending on whether the policy rule is a response-time or a request-time expression.
Possible values = REQUEST, RESPONSE, ICA_REQUEST, OTHERTCP_REQUEST, AAA_REQUEST, AAA_RESPONSE

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

