---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddDNSKey

## SYNOPSIS
Creates a NetScaler dnskey resource.

## SYNTAX

```
Invoke-NSAddDNSKey [-Autorollover <String>] [-Expires <Int32>] [-KeyName] <String>
 [-Notificationperiod <Int32>] [-Password <String>] -PrivateKey <String> -PublicKey <String>
 [-Revoke <Boolean>] [-RolloverMethod <String>] [-Ttl <Int32>] [-UnitS1 <String>] [-UnitS2 <String>]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for dns key resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddDNSKey -KeyName 'example' -PrivateKey 'example' -PublicKey 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddDNSKey -KeyName 'example' -PrivateKey 'example' -PublicKey 'example' -WhatIf
```

## PARAMETERS

### -Autorollover
Flag to enable/disable key rollover automatically.
Note: * Key name will be appended with _AR1 for successor key.
For e.g.
current key=k1, successor key=k1_AR1.
* Key name can be truncated if current name length is more than 58 bytes to accomodate the suffix.
Default value: DISABLED Possible values = ENABLED, DISABLED

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
Time period for which to consider the key valid, after the key is used to sign a zone.
Default value: 120 Minimum value = 1 Maximum value = 32767

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

### -KeyName
Name of the public-private key pair to publish in the zone.
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

### -Notificationperiod
Time at which to generate notification of key expiration, specified as number of days, hours, or minutes before expiry.
Must be less than the expiry period.
The notification is an SNMP trap sent to an SNMP manager.
To enable the appliance to send the trap, enable the DNSKEY-EXPIRY SNMP alarm.
In case autorollover option is enabled, rollover for successor key will be intiated at this time.
No notification trap will be sent.
Default value: 7 Minimum value = 1 Maximum value = 32767

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

### -Password
Passphrase for reading the encrypted public/private DNS keys.
Minimum length = 1

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

### -PrivateKey
File name of the private key.

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

### -PublicKey
File name of the public key.

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

### -Revoke
Revoke the key.
Note: This operation is non-reversible.

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

### -RolloverMethod
Method used for automatic rollover.
* Key type: ZSK, Method: PrePublication or DoubleSignature.
* Key type: KSK, Method: DoubleRRSet.
Possible values = PrePublication, DoubleSignature, DoubleRRSet

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

### -Ttl
Time to Live (TTL), in seconds, for the DNSKEY resource record created in the zone.
TTL is the time for which the record must be cached by the DNS proxies.
If the TTL is not specified, either the DNS zone's minimum TTL or the default value of 3600 is used.
Default value: 3600 Minimum value = 0 Maximum value = 2147483647

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

### -UnitS1
Units for the expiry period.
Default value: DAYS Possible values = MINUTES, HOURS, DAYS

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

### -UnitS2
Units for the notification period.
Default value: DAYS Possible values = MINUTES, HOURS, DAYS

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

