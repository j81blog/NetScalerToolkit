---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSGetResponderGlobalResponderPolicyBinding

## SYNOPSIS
Gets NetScaler responderglobal_responderpolicy_binding configuration.

## SYNTAX

### All (Default)
```
Invoke-NSGetResponderGlobalResponderPolicyBinding [-Filter <Hashtable>] [-ViewSummary] [-Type <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

### Count
```
Invoke-NSGetResponderGlobalResponderPolicyBinding [-Count] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

## DESCRIPTION
Binding object showing the responderpolicy that can be bound to responderglobal.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSGetResponderGlobalResponderPolicyBinding
```

### EXAMPLE 2
```
Invoke-NSGetResponderGlobalResponderPolicyBinding -Filter @{ servicetype = 'HTTP' }
```

## PARAMETERS

### -Filter
{{ Fill Filter Description }}

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

### -Type
Specifies the bind point whose policies you want to display.
Available settings function as follows: * REQ_OVERRIDE - Request override.
Binds the policy to the priority request queue.
* REQ_DEFAULT - Binds the policy to the default request queue.
* OTHERTCP_REQ_OVERRIDE - Binds the policy to the non-HTTP TCP priority request queue.
* OTHERTCP_REQ_DEFAULT - Binds the policy to the non-HTTP TCP default request queue..
* SIPUDP_REQ_OVERRIDE - Binds the policy to the SIP UDP priority response queue..
* SIPUDP_REQ_DEFAULT - Binds the policy to the SIP UDP default response queue.
* RADIUS_REQ_OVERRIDE - Binds the policy to the RADIUS priority response queue..
* RADIUS_REQ_DEFAULT - Binds the policy to the RADIUS default response queue.
* MSSQL_REQ_OVERRIDE - Binds the policy to the Microsoft SQL priority response queue..
* MSSQL_REQ_DEFAULT - Binds the policy to the Microsoft SQL default response queue.
* MYSQL_REQ_OVERRIDE - Binds the policy to the MySQL priority response queue.
* MYSQL_REQ_DEFAULT - Binds the policy to the MySQL default response queue.
* HTTPQUIC_REQ_OVERRIDE - Binds the policy to the HTTP_QUIC override response queue.
* HTTPQUIC_REQ_DEFAULT - Binds the policy to the HTTP_QUIC default response queue.
Possible values = REQ_OVERRIDE, REQ_DEFAULT, OVERRIDE, DEFAULT, OTHERTCP_REQ_OVERRIDE, OTHERTCP_REQ_DEFAULT, SIPUDP_REQ_OVERRIDE, SIPUDP_REQ_DEFAULT, SIPTCP_REQ_OVERRIDE, SIPTCP_REQ_DEFAULT, MSSQL_REQ_OVERRIDE, MSSQL_REQ_DEFAULT, MYSQL_REQ_OVERRIDE, MYSQL_REQ_DEFAULT, NAT_REQ_OVERRIDE, NAT_REQ_DEFAULT, DIAMETER_REQ_OVERRIDE, DIAMETER_REQ_DEFAULT, RADIUS_REQ_OVERRIDE, RADIUS_REQ_DEFAULT, DNS_REQ_OVERRIDE, DNS_REQ_DEFAULT, MQTT_REQ_OVERRIDE, MQTT_REQ_DEFAULT, MQTT_JUMBO_REQ_OVERRIDE, MQTT_JUMBO_REQ_DEFAULT, QUIC_OVERRIDE, QUIC_DEFAULT, HTTPQUIC_REQ_OVERRIDE, HTTPQUIC_REQ_DEFAULT

```yaml
Type: String
Parameter Sets: All
Aliases:

Required: False
Position: Named
Default value: None
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

