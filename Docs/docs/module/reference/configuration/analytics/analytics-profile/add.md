---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddAnalyticsProfile

## SYNOPSIS
Creates a NetScaler analyticsprofile resource.

## SYNTAX

```
Invoke-NSAddAnalyticsProfile [-AllHTTPHeaderS <String>] [-AnalyticsAuthtoken <String>]
 [-AnalyticsEndpointContentType <String>] [-AnalyticsEndpointmetaData <String>]
 [-AnalyticsEndpointURL <String>] [-AuditLogs <String>] [-Collectors <String>] [-CqarePortIng <String>]
 [-DataFormAtFile <String>] [-Events <String>] [-GrpcStatus <String>] [-HTTPAuthentication <String>]
 [-HTTPClientsIdemeasurements <String>] [-HTTPContentType <String>] [-HTTPCookie <String>]
 [-HTTPCustomHeaderS <String[]>] [-HTTPDomainName <String>] [-HTTPHost <String>] [-HTTPLocation <String>]
 [-HTTPMethod <String>] [-HTTPPageTracking <String>] [-HTTPReferer <String>] [-HTTPSEtCookie <String>]
 [-HTTPSEtCookie2 <String>] [-HTTPURL <String>] [-HTTPURLQuery <String>] [-HTTPUserAgent <String>]
 [-HTTPVia <String>] [-HTTPXforwardedforHeader <String>] [-Integratedcache <String>]
 [-Managementlog <String[]>] [-Metrics <String>] [-MetricsexPortFrequency <Int32>] [-Name] <String>
 [-OutputMode <String>] [-SchemaFile <String>] [-ServeMode <String>] [-TCPBurstrePortIng <String>]
 [-Topn <String>] -Type <String> [-URLCategory <String>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Analytics profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddAnalyticsProfile -Name 'example' -Type 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddAnalyticsProfile -Name 'example' -Type 'example' -WhatIf
```

## PARAMETERS

### -AllHTTPHeaderS
On enabling this option, the Citrix ADC will log all the request and response headers.
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

### -AnalyticsAuthtoken
Token for authenticating with the endpoint.
If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter.
For eg., in case of splunk, the Authorizaiton header is required to be of the form - Splunk \<auth-token\>.
Maximum length = 256

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

### -AnalyticsEndpointContentType
By default, application/json content-type is used.
If this needs to be overridden, specify the value.
Maximum length = 128

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

### -AnalyticsEndpointmetaData
If the endpoint requires some metadata to be present before the actual json data, specify the same.
Maximum length = 128

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

### -AnalyticsEndpointURL
The URL at which to upload the analytics data on the endpoint.
Maximum length = 256

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

### -AuditLogs
This option indicates the whether auditlog should be sent to the REST collector.
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

### -Collectors
The collector can be an IP, an appflow collector name, a service or a vserver.
If IP is specified, the transport is considered as logstream and default port of 5557 is taken.
If collector name is specified, the collector properties are taken from the configured collector.
If service is specified, the configured service is assumed as the collector.
If vserver is specified, the services bound to it are considered as collectors and the records are load balanced.
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

### -CqarePortIng
On enabling this option, the Citrix ADC will log TCP CQA parameters.
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

### -DataFormAtFile
This option is for configuring the file containing the data format and metadata required by the analytics endpoint.
Maximum length = 64

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

### -Events
This option indicates the whether events should be sent to the REST collector.
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

### -GrpcStatus
On enabling this option, the Citrix ADC will log the gRPC status headers.
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

### -HTTPAuthentication
On enabling this option, the Citrix ADC will log Authentication header.
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

### -HTTPClientsIdemeasurements
On enabling this option, the Citrix ADC will insert a javascript into the HTTP response to collect the client side page-timings and will send the same to the configured collectors.
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

### -HTTPContentType
On enabling this option, the Citrix ADC will log content-length header.
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

### -HTTPCookie
On enabling this option, the Citrix ADC will log cookie header.
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

### -HTTPCustomHeaderS
Specify the list of custom headers to be exported in web transaction records.
Minimum length = 1

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HTTPDomainName
On enabling this option, the Citrix ADC will log domain name.
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

### -HTTPHost
On enabling this option, the Citrix ADC will log the Host header in appflow records.
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

### -HTTPLocation
On enabling this option, the Citrix ADC will log location header.
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

### -HTTPMethod
On enabling this option, the Citrix ADC will log the method header in appflow records.
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

### -HTTPPageTracking
On enabling this option, the Citrix ADC will link the embedded objects of a page together.
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

### -HTTPReferer
On enabling this option, the Citrix ADC will log the referer header in appflow records.
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

### -HTTPSEtCookie
On enabling this option, the Citrix ADC will log set-cookie header.
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

### -HTTPSEtCookie2
On enabling this option, the Citrix ADC will log set-cookie2 header.
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

### -HTTPURL
On enabling this option, the Citrix ADC will log the URL in appflow records.
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

### -HTTPURLQuery
On enabling this option, the Citrix ADC will log URL Query.
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

### -HTTPUserAgent
On enabling this option, the Citrix ADC will log User-Agent header.
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

### -HTTPVia
On enabling this option, the Citrix ADC will Via header.
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

### -HTTPXforwardedforHeader
On enabling this option, the Citrix ADC will log X-Forwarded-For header.
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

### -Integratedcache
On enabling this option, the Citrix ADC will log the Integrated Caching appflow records.
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

### -Managementlog
This option indicates the whether managementlog should be sent to the REST collector.
Default value: DEFAULT_MANAGEMENTLOG Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Metrics
This option indicates the whether metrics should be sent to the REST collector.
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

### -MetricsexPortFrequency
This option is for configuring the metrics export frequency in seconds, frequency value must be in \[30,300\] seconds range.
Default value: 30 Minimum value = 30 Maximum value = 300

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

### -Name
Name for the analytics profile.
Must begin with an ASCII alphabetic or underscore (_) character, and must contain only ASCII alphanumeric, underscore, hash (#), period (.), space, colon (:), at (@), equals (=), and hyphen (-) characters.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my appflow profile" or 'my appflow profile').
Minimum length = 1 Maximum length = 127

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

### -OutputMode
This option indicates the format of REST API POST body.
It depends on the consumer of the analytics data.
Default value: avro, Possible values = avro, prometheus, influx, json

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

### -SchemaFile
This option is for configuring json schema file containing a list of counters to be exported by metricscollector.
Maximum length = 64

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

### -ServeMode
This option is for setting the mode of how data is provided.
Default value: Push Possible values = Push, Pull

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

### -TCPBurstrePortIng
On enabling this option, the Citrix ADC will log TCP burst parameters.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -Topn
On enabling this topn support, the topn information of the stream identifier this profile is bound to will be exported to the analytics endpoint.
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

### -Type
This option indicates what information needs to be collected and exported.
Possible values = global, webinsight, tcpinsight, securityinsight, videoinsight, hdxinsight, gatewayinsight, timeseries, lsninsight, botinsight, CIinsight, udpinsight, ngsinsight, streaminsight

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

### -URLCategory
On enabling this option, the Citrix ADC will send the URL category record.
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

