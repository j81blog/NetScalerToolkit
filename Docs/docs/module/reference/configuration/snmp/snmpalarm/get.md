---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSGetSNMPAlarm

## SYNOPSIS
Gets NetScaler snmpalarm configuration.

## SYNTAX

### All (Default)
```
Invoke-NSGetSNMPAlarm [-Filter <Hashtable>] [-ViewSummary] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [<CommonParameters>]
```

### ByName
```
Invoke-NSGetSNMPAlarm [-TrapName] <String> [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [<CommonParameters>]
```

### Count
```
Invoke-NSGetSNMPAlarm [-Count] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [<CommonParameters>]
```

## DESCRIPTION
Configuration for alarm resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSGetSNMPAlarm
```

### EXAMPLE 2
```
Invoke-NSGetSNMPAlarm -TrapName 'snmpalarm_example'
```

### EXAMPLE 3
```
Invoke-NSGetSNMPAlarm -Filter @{ servicetype = 'HTTP' }
```

## PARAMETERS

### -TrapName
Name of the SNMP alarm.
This parameter is required for identifying the SNMP alarm and cannot be modified.
Possible values = CPU-USAGE, AVERAGE-CPU, MEMORY, MGMT-CPU-USAGE, SYNFLOOD, TCP-SYNFLOOD, VSERVER-REQRATE, SERVICE-REQRATE, ENTITY-RXRATE, ENTITY-TXRATE, ENTITY-SYNFLOOD, SERVICE-MAXCLIENTS, HA-STATE-CHANGE, ENTITY-STATE, CONFIG-CHANGE, CONFIG-SAVE, SERVICEGROUP-MEMBER-REQRATE, SERVICEGROUP-MEMBER-MAXCLIENTS, MONITOR-RTO-THRESHOLD, LOGIN-FAILURE, SSL-CERT-EXPIRY, FAN-SPEED-LOW, VOLTAGE-LOW, VOLTAGE-HIGH, TEMPERATURE-HIGH, CPU-TEMPERATURE-HIGH, POWER-SUPPLY-FAILURE, DISK-USAGE-HIGH, INTERFACE-THROUGHPUT-LOW, MON_PROBE_FAILED, HA-VERSION-MISMATCH, HA-DISK-ENCRYPTION-MISMATCH, HA-SYNC-FAILURE, HA-NO-HEARTBEATS, HA-BAD-SECONDARY-STATE, INTERFACE-BW-USAGE, RATE-LIMIT-THRESHOLD-EXCEEDED, ENTITY-NAME-CHANGE, HA-PROP-FAILURE, IP-CONFLICT, PF-RL-RATE-THRESHOLD, PF-RL-PPS-THRESHOLD, PF-RL-RATE-PKTS-DROPPED, PF-RL-PPS-PKTS-DROPPED, APPFW-START-URL, APPFW-DENY-URL, APPFW-VIOLATIONS-TYPE, APPFW-REFERER-HEADER, APPFW-CSRF-TAG, APPFW-COOKIE, APPFW-FIELD-CONSISTENCY, APPFW-BUFFER-OVERFLOW, APPFW-FIELD-FORMAT, APPFW-FILE-UPLOAD-TYPE, APPFW-GRPC, APPFW-GRPC-WEB-JSON, APPFW-GRPC-WEB-TEXT, APPFW-JSON-DOS, APPFW-JSON-SQL, APPFW-JSON-XSS, APPFW-SAFE-COMMERCE, APPFW-SAFE-OBJECT, APPFW-SESSION-LIMIT, APPFW-SIGNATURE-MATCH, APPFW-POLICY-HIT, APPFW-XSS, APPFW-XML-XSS, APPFW-SQL, APPFW-XML-SQL, APPFW-XML-ATTACHMENT, APPFW-XML-DOS, APPFW-XML-VALIDATION, APPFW-XML-WSI, APPFW-XML-SCHEMA-COMPILE, APPFW-XML-SOAP-FAULT, APPFW-NEW-SIGNATURE-ADDED, APPFW-DEPLOY-RELAXATION-DP, APPFW-LEARNED-RULE-APPLIED-DYN-PROF, APPFW-CMD, APPFW-SCHEMA-ENDPOINT-NOTFOUND, APPFW-SCHEMA-METHOD-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-MISSING, APPFW-SCHEMA-VALUE-INCORRECT, APPFW-SCHEMA-CONTENTTYPE-UNSUPPORTED, APPFW-SCHEMA-PARAMETER-INVALID, APPFW-SCHEMA-OTHER, APPFW-SCHEMA-RELAXATION-RULE, APPFW-POSTBODYLIMIT, APPFW-JSON-CMD, APPFW-SQL-GRAM, APPFW-JSON-SQL-GRAM, APPFW-CMD-GRAM, APPFW-JSON-CMD-GRAM, APPFW-BLOCK-KEYWORD, APPFW-JSON-BLOCKKEYWORD, APPFW-BYPASS-LIST, APPFW-DENY-LIST, DNSKEY-EXPIRY, HA-LICENSE-MISMATCH, SSL-CARD-FAILED, SSL-CARD-NORMAL, WARM-RESTART-EVENT, HARD-DISK-DRIVE-ERRORS, COMPACT-FLASH-ERRORS, CALLHOME-UPLOAD-EVENT, 1024KEY-EXCHANGE-RATE, 2048KEY-EXCHANGE-RATE, 4096KEY-EXCHANGE-RATE, SSL-CUR-SESSION-INUSE, CLUSTER-NODE-HEALTH, CLUSTER-NODE-QUORUM, CLUSTER-VERSION-MISMATCH, CLUSTER-CCO-CHANGE, CLUSTER-OVS-CHANGE, CLUSTER-SYNC-FAILURE, CLUSTER-SYNC-PARTIAL-SUCCESS, CLUSTER-PROP-FAILURE, CLUSTER-PROP-EXEC-FAILURE, HA-STICKY-PRIMARY, INBAND-PROTOCOL-VERSION-MISMATCH, SSL-CHIP-REINIT, VRID-STATE-CHANGE, PORT-ALLOC-FAILED, LLDP-REMOTE-CHANGE, DUPLICATE-IPV6, PARTITION-CONFIG-EVENT, PARTITION-SWITCHED, LSN-PORTALLOC-FAILED, LSN-PORTQUOTA-EXCEED, LSN-SESSIONQUOTA-EXCEED, LSN-MEM-RECOVERY-KICKEDIN, VSERVER-SPILLOVER, INCONSISTENT-CONFIGURATION-IN-PPES, PARTITION-RATE-LIMIT, POOLED-LICENSE-ONGRACE, POOLED-LICENSE-PARTIAL, CLUSTER-BACKPLANE-HB-MISSING, GSLB-SITE-MEP-FLAP, DNS-MAXNEGCACHE-USAGE, DNS-MAXCACHE-USAGE, NS-LICENSE-EXPIRY, PKT-RATELIMITING-ATTACK, GSLB-SYNC-STATUS-FLIP, URLFILT-DB-UPDATE-STATUS, URLFILT-INIT-SDK, POOLED-LICENSE-CHECKOUT-FAILURE, MIGRATION-STARTED, MIGRATION-COMPLETE, ECDHE-EXCHANGE-RATE, BOT-SIGNATURE-UPDATE, APPFW-XMLPAYLOAD-CONTENT-TYPE-MISMATCH, PORT-ALLOC-EXCEED, KEK_UPDATE_SUCCESS, KEK_UPDATE_FAILURE, ADC-ANOMALY, SYSLOG-CONNECTION-DROPPED, SYSTEM_USER_PASSWORD_EXPIRY_WARNING, DNSSEC-KEY-AUTOMGMT-STATUS-FAILURE, DNSSEC-KEY-AUTOMGMT-STATUS-SUCCESS, CLOUD-REST-API-FAILURE, SSL-ASYM-CRYPTO-UTILIZATION, SSL-SYM-CRYPTO-UTILIZATION, INTERFACE-AUTO-RECOVERY, SYS-KERNEL-ERROR, AVG-MGMT-CPU-USE, EXTRA-MGMT-CPU-USE

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

