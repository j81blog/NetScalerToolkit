---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetAppFlowParam

## SYNOPSIS
Clears one or more NetScaler appflowparam resource properties.

## SYNTAX

```
Invoke-NSUnsetAppFlowParam [-AAAUserName] [-AnalyticsAuthtoken] [-AppNameRefresh] [-AuditLogs] [-Cacheinsight]
 [-ClientTrafficonly] [-ConnectionChaining] [-CqarePortIng] [-Distributedtracing] [-Disttracingsamplingrate]
 [-EmailAddress] [-Events] [-FlowRecordInterval] [-GxsessionrePortIng] [-HTTPAuthorization] [-HTTPContentType]
 [-HTTPCookie] [-HTTPDomain] [-HTTPHost] [-HTTPLocation] [-HTTPMethod] [-HTTPQuerywithURL] [-HTTPReferer]
 [-HTTPSEtCookie] [-HTTPSEtCookie2] [-HTTPURL] [-HTTPUserAgent] [-HTTPVia] [-HTTPXforwardedfor]
 [-IdentifierName] [-IdentifiersessionName] [-LogstreamovernSIP] [-Lsnlogging] [-Metrics]
 [-Observationdomainid] [-ObservationdomainName] [-Observationpointid] [-SecurityinsightRecordInterval]
 [-Securityinsighttraffic] [-SkipcacheRedirectIonHTTPTransAction] [-Subscriberawareness]
 [-Subscriberidobfuscation] [-Subscriberidobfuscationalgo] [-TCPAttackcounterInterval] [-Templaterefresh]
 [-TimeseriesovernSIP] [-UDPPmtu] [-URLCategory] [-UsageRecordInterval] [-Videoinsight]
 [-WebSaasappusagerePortIng] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for AppFlow parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetAppFlowParam -AAAUserName ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetAppFlowParam -AAAUserName ENABLED -WhatIf
```

## PARAMETERS

### -AAAUserName
Enable AppFlow AAA Username logging.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -AnalyticsAuthtoken
Authentication token to be set by the agent.
Maximum length = 256

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

### -AppNameRefresh
Interval, in seconds, at which to send Appnames to the configured collectors.
Appname refers to the name of an entity (virtual server, service, or service group) in the Citrix ADC.
Default value: 600 Minimum value = 60 Maximum value = 3600

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

### -AuditLogs
Enable Auditlogs to be sent to the Telemetry Agent.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Cacheinsight
Flag to determine whether cache records need to be exported or not.
If this flag is true and IC is enabled, cache records are exported instead of L7 HTTP records.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -ClientTrafficonly
Generate AppFlow records for only the traffic from the client.
Default value: NO Possible values = YES, NO

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

### -ConnectionChaining
Enable connection chaining so that the client server flows of a connection are linked.
Also the connection chain ID is propagated across Citrix ADCs, so that in a multi-hop environment the flows belonging to the same logical connection are linked.
This id is also logged as part of appflow record.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -CqarePortIng
TCP CQA reporting enable/disable knob.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Distributedtracing
Enable generation of the distributed tracing templates in the Appflow records.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Disttracingsamplingrate
Sampling rate for Distributed Tracing.
Default value: 0 Minimum value = 0 Maximum value = 100

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

### -EmailAddress
Enable AppFlow user email-id logging.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Events
Enable Events to be sent to the Telemetry Agent.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -FlowRecordInterval
Interval, in seconds, at which to send flow records to the configured collectors.
Default value: 60 Minimum value = 60 Maximum value = 3600

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

### -GxsessionrePortIng
Enable this option for Gx session reporting.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPAuthorization
Include the HTTP Authorization header information.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPContentType
Include the HTTP Content-Type header sent from the server to the client to determine the type of the content sent.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPCookie
Include the cookie that was in the HTTP request the appliance received from the client.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPDomain
Include the http domain request to be exported.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPHost
Include the host identified in the HTTP request that the appliance received from the client.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPLocation
Include the HTTP location headers returned from the HTTP responses.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPMethod
Include the method that was specified in the HTTP request that the appliance received from the client.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPQuerywithURL
Include the HTTP query segment along with the URL that the Citrix ADC received from the client.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPReferer
Include the web page that was last visited by the client.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPSEtCookie
Include the Set-cookie header sent from the server to the client in response to a HTTP request.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPSEtCookie2
Include the Set-cookie header sent from the server to the client in response to a HTTP request.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPURL
Include the http URL that the Citrix ADC received from the client.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPUserAgent
Include the client application through which the HTTP request was received by the Citrix ADC.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPVia
Include the httpVia header which contains the IP address of proxy server through which the client accessed the server.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -HTTPXforwardedfor
Include the httpXForwardedFor header, which contains the original IP Address of the client using a proxy server to access the server.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -IdentifierName
Include the stream identifier name to be exported.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -IdentifiersessionName
Include the stream identifier session name to be exported.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -LogstreamovernSIP
To use the Citrix ADC IP to send Logstream records instead of the SNIP.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Lsnlogging
On enabling this option, the Citrix ADC will send the Large Scale Nat(LSN) records to the configured collectors.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Metrics
Enable Citrix ADC Stats to be sent to the Telemetry Agent.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Observationdomainid
An observation domain groups a set of Citrix ADCs based on deployment: cluster, HA etc.
A unique Observation Domain ID is required to be assigned to each such group.
Default value: 0 Minimum value = 1000

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

### -ObservationdomainName
Name of the Observation Domain defined by the observation domain ID.
Maximum length = 127

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

### -Observationpointid
An observation point ID is identifier for the NetScaler from which appflow records are being exported.
By default, the NetScaler IP is the observation point ID.
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

### -SecurityinsightRecordInterval
Interval, in seconds, at which to send security insight flow records to the configured collectors.
Default value: 600 Minimum value = 60 Maximum value = 3600

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

### -Securityinsighttraffic
Enable/disable the feature individually on appflow action.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -SkipcacheRedirectIonHTTPTransAction
Skip Cache http transaction.
This HTTP transaction is specific to Cache Redirection module.
In Case of Cache Miss there will be another HTTP transaction initiated by the cache server.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Subscriberawareness
Enable this option for logging end user MSISDN in L4/L7 appflow records.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Subscriberidobfuscation
Enable this option for obfuscating MSISDN in L4/L7 appflow records.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Subscriberidobfuscationalgo
Algorithm(MD5 or SHA256) to be used for obfuscating MSISDN.
Default value: MD5 Possible values = MD5, SHA256

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

### -TCPAttackcounterInterval
Interval, in seconds, at which to send tcp attack counters to the configured collectors.
If 0 is configured, the record is not sent.
Default value: 0 Minimum value = 0 Maximum value = 3600

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

### -Templaterefresh
Refresh interval, in seconds, at which to export the template data.
Because data transmission is in UDP, the templates must be resent at regular intervals.
Default value: 600 Minimum value = 60 Maximum value = 3600

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

### -TimeseriesovernSIP
To use the Citrix ADC IP to send Time series data such as metrics and events, instead of the SNIP.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -UDPPmtu
MTU, in bytes, for IPFIX UDP packets.
Default value: 1472 Minimum value = 128 Maximum value = 1472

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

### -URLCategory
Include the URL category record.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -UsageRecordInterval
On enabling this option, the NGS will send bandwidth usage record to configured collectors.
Default value: 0 Minimum value = 0 Maximum value = 7200

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

### -Videoinsight
Enable/disable the feature individually on appflow action.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -WebSaasappusagerePortIng
On enabling this option, NGS will send data used by Web/saas app at the end of every HTTP transaction to configured collectors.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

