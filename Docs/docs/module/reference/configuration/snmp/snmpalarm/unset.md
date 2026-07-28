---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSNMPAlarm

## SYNOPSIS
Clears one or more NetScaler snmpalarm resource properties.

## SYNTAX

```
Invoke-NSUnsetSNMPAlarm [-TrapName] <String> [-Logging] [-Normalvalue] [-Severity] [-State] [-ThresholdValue]
 [-Time] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for alarm resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSNMPAlarm -TrapName 'example' -Logging ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSNMPAlarm -TrapName 'example' -Logging ENABLED -WhatIf
```

## PARAMETERS

### -TrapName
Name of the SNMP alarm.
This parameter is required for identifying the SNMP alarm and cannot be modified.
Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE

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

### -Logging
Logging status of the alarm.
When logging is enabled, the Citrix ADC logs every trap message that is generated for this alarm.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Normalvalue
Value for the normal threshold.
A trap message is generated if the value of the respective attribute falls to or below this value after exceeding the high threshold.
Minimum value = 1

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

### -Severity
Severity level assigned to trap messages generated by this alarm.
The severity levels are, in increasing order of severity, Informational, Warning, Minor, Major, and Critical.
This parameter is useful when you want the Citrix ADC to send trap messages to a trap listener on the basis of severity level.
Trap messages with a severity level lower than the specified level (in the trap listener entry) are not sent.
Default value: Unknown Possible values = Critical, Major, Minor, Warning, Informational

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

### -State
Current state of the SNMP alarm.
The Citrix ADC generates trap messages only for SNMP alarms that are enabled.
Some alarms are enabled by default, but you can disable them.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -ThresholdValue
Value for the high threshold.
The Citrix ADC generates an SNMP trap message when the value of the attribute associated with the alarm is greater than or equal to the specified high threshold value.
Minimum value = 1

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

### -Time
Interval, in seconds, at which the Citrix ADC generates SNMP trap messages when the conditions specified in the SNMP alarm are met.Can be specified for the following alarms: SYNFLOOD, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS,HA-BAD-SECONDARY-STATE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-BKHB-FAILED, PORT-ALLOC-FAILED, COMPACT-FLASH-ERRORS, HARD-DISK-DRIVE-ERRORS and APPFW traps.
Default trap time intervals: SYNFLOOD and APPFW traps = 1sec, PORT-ALLOC-FAILED = 3600sec(1 hour), PORT-ALLOC-EXCEED = 3600sec(1 hour), SYSLOG-CONNECTION-DROPPED = 3600sec(1 hour), Other Traps = 86400sec(1 day).
Default value: 1

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

