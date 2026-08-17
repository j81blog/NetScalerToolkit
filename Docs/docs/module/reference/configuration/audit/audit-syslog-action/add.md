---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddAuditSyslogAction

## SYNOPSIS
Creates a NetScaler auditsyslogaction resource.

## SYNTAX

```
Invoke-NSAddAuditSyslogAction [-Acl <String>] [-Alg <String>] [-AppFlowExPort <String>]
 [-ContentInSpecTionlog <String>] [-DateFormAt <String>] [-Denylistviolations <String>] [-DNS <String>]
 [-Domainresolveretry <Int32>] [-HTTPAuthtoken <String>] [-HTTPEndpointURL <String>] [-HTTPSChemaFile <String>]
 [-LbVServerName <String>] [-Logfacility <String>] -Loglevel <String[]> [-Lsn <String>]
 [-Managementlog <String[]>] [-MaxLogDataSizetohold <Int32>] [-Mgmtloglevel <String[]>] [-Name] <String>
 [-NetProfile <String>] [-ProtocolViolations <String>] [-ServerDomainName <String>] [-ServerIp <String>]
 [-ServerPort <Int32>] [-SSLInterception <String>] [-StreamAnalytics <String>] [-Subscriberlog <String>]
 [-SyslogCompliance <String>] [-TCP <String>] [-TCPProfileName <String>] [-Timezone <String>]
 [-TransPort <String>] [-URLFiltering <String>] [-UserDefinedAuditLog <String>] [-Session <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for system log action resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddAuditSyslogAction -Name 'example' -Loglevel ALL -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddAuditSyslogAction -Name 'example' -Loglevel ALL -WhatIf
```

## PARAMETERS

### -Acl
Log access control list (ACL) messages.
Possible values = ENABLED, DISABLED

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

### -Alg
Log alg info.
Possible values = ENABLED, DISABLED

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

### -AppFlowExPort
Export log messages to AppFlow collectors.
Appflow collectors are entities to which log messages can be sent so that some action can be performed on them.
Possible values = ENABLED, DISABLED

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

### -ContentInSpecTionlog
Log Content Inspection event information.
Possible values = ENABLED, DISABLED

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

### -DateFormAt
Format of dates in the logs.
Supported formats are: * MMDDYYYY.
-U.S.
style month/date/year format.
* DDMMYYYY - European style date/month/year format.
* YYYYMMDD - ISO style year/month/date format.
Possible values = MMDDYYYY, DDMMYYYY, YYYYMMDD

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

### -Denylistviolations
Log denylist violations.
Possible values = ENABLED, DISABLED

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

### -DNS
Log DNS related syslog messages.
Possible values = ENABLED, DISABLED

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

### -Domainresolveretry
Time, in seconds, for which the Citrix ADC waits before sending another DNS query to resolve the host name of the syslog server if the last query failed.
Default value: 5 Minimum value = 5 Maximum value = 20939

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

### -HTTPAuthtoken
Token for authenticating with the endpoint.
If the endpoint requires the Authorization header in a particular format, specify the complete format as the value to this parameter.
For eg., in case of splunk, the Authorization header is required to be of the form - Splunk \<auth-token\>.
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

### -HTTPEndpointURL
The URL at which to upload the logs messages on the endpoint.
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

### -HTTPSChemaFile
HTTP Schema file to input tokens to be sent in log message to log server.
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

### -LbVServerName
Name of the LB vserver.
Mutually exclusive with syslog serverIP/serverName.
Minimum length = 1 Maximum length = 127

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

### -Logfacility
Facility value, as defined in RFC 3164, assigned to the log message.
Log facility values are numbers 0 to 7 (LOCAL0 through LOCAL7).
Each number indicates where a specific message originated from, such as the Citrix ADC itself, the VPN, or external.
Possible values = LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4, LOCAL5, LOCAL6, LOCAL7

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

### -Loglevel
Audit log level, which specifies the types of events to log.
Available values function as follows: * ALL - All events.
* EMERGENCY - Events that indicate an immediate crisis on the server.
* ALERT - Events that might require action.
* CRITICAL - Events that indicate an imminent server crisis.
* ERROR - Events that indicate some type of error.
* WARNING - Events that require action in the near future.
* NOTICE - Events that the administrator should know about.
* INFORMATIONAL - All but low-level events.
* DEBUG - All events, in extreme detail.
* NONE - No events.
Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Lsn
Log lsn info.
Possible values = ENABLED, DISABLED

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
Management log specifies the categories of log files to be exported.
It use destination and transport from PE params.
Available values function as follows: * ALL - All categories (SHELL, NSMGMT and ACCESS).
* SHELL - bash.log, and sh.log.
* ACCESS - auth.log, nsvpn.log, httpaccess.log, httperror.log, httpaccess-vpn.log and httperror-vpn.log.
* NSMGMT - notice.log and ns.log.
* NONE - No logs.
Possible values = ALL, SHELL, ACCESS, NSMGMT, NONE

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

### -MaxLogDataSizetohold
Max size of log data that can be held in NSB chain of server info.
Default value: 500 Minimum value = 50 Maximum value = 25600

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

### -Mgmtloglevel
Management log level, which specifies the types of events to log.
Available values function as follows: * ALL - All events.
* EMERGENCY - Events that indicate an immediate crisis on the server.
* ALERT - Events that might require action.
* CRITICAL - Events that indicate an imminent server crisis.
* ERROR - Events that indicate some type of error.
* WARNING - Events that require action in the near future.
* NOTICE - Events that the administrator should know about.
* INFORMATIONAL - All but low-level events.
* DEBUG - All events, in extreme detail.
* NONE - No events.
Possible values = ALL, EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG, NONE

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

### -Name
Name of the syslog action.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.) pound (#), space ( ), at (@), equals (=), colon (:), and underscore characters.
Cannot be changed after the syslog action is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my syslog action" or 'my syslog action').
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

### -NetProfile
Name of the network profile.
The SNIP configured in the network profile will be used as source IP while sending log messages.
Minimum length = 1 Maximum length = 127

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

### -ProtocolViolations
Log protocol violations.
Possible values = ALL, NONE

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

### -ServerDomainName
SYSLOG server name as a FQDN.
Mutually exclusive with serverIP/lbVserverName.
Minimum length = 1 Maximum length = 255

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

### -ServerIp
IP address of the syslog server.
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

### -ServerPort
Port on which the syslog server accepts connections.
Minimum value = 1

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

### -SSLInterception
Log SSL Interception event information.
Possible values = ENABLED, DISABLED

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

### -StreamAnalytics
Export log stream analytics statistics to syslog server.
Possible values = ENABLED, DISABLED

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

### -Subscriberlog
Log subscriber session event information.
Possible values = ENABLED, DISABLED

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

### -SyslogCompliance
Setting this parameter ensures that all the Audit Logs generated for this Syslog Action comply with an RFC.
For example, set it to RFC5424 to ensure RFC 5424 compliance.
Possible values = RFC5424

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

### -TCP
Log TCP messages.
Possible values = NONE, ALL

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

### -TCPProfileName
Name of the TCP profile whose settings are to be applied to the audit server info to tune the TCP connection parameters.
Minimum length = 1 Maximum length = 127

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

### -Timezone
Time zone used for date and timestamps in the logs.
Supported settings are: * GMT_TIME.
Coordinated Universal time.
* LOCAL_TIME.
Use the server's timezone setting.
Possible values = GMT_TIME, LOCAL_TIME

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

### -TransPort
Transport type used to send auditlogs to syslog server.
Default type is UDP.
Possible values = TCP, UDP, HTTP

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

### -URLFiltering
Log URL filtering event information.
Possible values = ENABLED, DISABLED

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

### -UserDefinedAuditLog
Log user-configurable log messages to syslog.
Setting this parameter to NO causes auditing to ignore all user-configured message actions.
Setting this parameter to YES causes auditing to log user-configured message actions that meet the other logging criteria.
Possible values = YES, NO

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

