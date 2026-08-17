---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateNsparam

## SYNOPSIS
Updates a NetScaler nsparam resource.

## SYNTAX

```
Invoke-NSUpdateNsparam [[-AdvancedAnalyticsStats] <String>] [[-AftpallowrandomsourcePort] <String>]
 [[-CIP] <String>] [[-CIPHeader] <String>] [[-CookieVersion] <String>] [[-CrPortRange] <String>]
 [[-ExclusivequotaMaxClient] <Int32>] [[-Exclusivequotaspillover] <Int32>] [[-FtpPortRange] <String>]
 [[-GrantquotaMaxClient] <Int32>] [[-Grantquotaspillover] <Int32>] [[-HTTPPort] <String>]
 [[-IcaPortS] <String>] [[-InternalUserLogin] <String>] [[-Ipttl] <Int32>] [[-MaxConn] <Int32>]
 [[-MaxReq] <Int32>] [[-MgmtHTTPPort] <Int32>] [[-MgmtHTTPSPort] <Int32>] [[-PmtuMin] <Int32>]
 [[-PmtuTimeout] <Int32>] [[-ProxyProtocol] <String>] [[-SecureCookie] <String>] [[-SecureicaPortS] <String>]
 [[-ServicePathingressvlan] <Int32>] [[-TCPCip] <String>] [[-Timezone] <String>] [[-UseProxyPort] <String>]
 [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Citrix ADC parameters resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateNsparam  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateNsparam  -WhatIf
```

## PARAMETERS

### -AdvancedAnalyticsStats
Disable/Enable advanace analytics stats.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -AftpallowrandomsourcePort
Allow the FTP server to come from a random source port for active FTP data connections.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CIP
Enable or disable the insertion of the actual client IP address into the HTTP header request passed from the client to one, some, or all servers attached to the system.
The passed address can then be accessed through a minor modification to the server.
* If the CIP header is specified, it will be used as the client IP header.
* If the CIP header is not specified, the value that has been set will be used as the client IP header.
Possible values = ENABLED, DISABLED

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

### -CIPHeader
Text that will be used as the client IP address header.
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CookieVersion
Version of the cookie inserted by the system.
Possible values = 0, 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CrPortRange
Port range for cache redirection services.
Minimum length = 1 Maximum length = 65535

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExclusivequotaMaxClient
Percentage of maxClient threshold to be divided equally among PEs.
Default value: 80 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exclusivequotaspillover
Percentage of spillover threshold to be divided equally among PEs.
Default value: 80 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FtpPortRange
Minimum and maximum port (port range) that FTP services are allowed to use.
Minimum length = 1024 Maximum length = 64000

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GrantquotaMaxClient
Percentage of shared pool value granted to PE once PE exhausts the local exclusive quota.
Where shared pool is the remaining maxclient quota after distribution of exclusive quota to PEs.
Example: In a 2 PE NetScaler system if configured maxclient is 100 and exclusive quota is 80 percent then each PE will get 40 as local exclusive quota and 20 will be in shared pool.
If configured grantQuota is 20 percent, then after exhausting its local exclusive quota PE borrows from shared pool in chunks of 4 i.e.
20 percent of 20.
Default value: 10 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Grantquotaspillover
Percentage of shared pool value granted to PE once PE exhausts the local exclusive quota.
Where shared pool is the remaining spillover quota after distribution of exclusive quota to PEs.
Example: In a 2 PE NetScaler system if configured spillover is 100 and exclusive quota is 80 percent then each PE will get 40 as local exclusive quota and 20 will be in shared pool.
If configured grantQuota is 20 percent, then after exhausting its local exclusive quota PE borrows from shared pool in chunks of 4 i.e.
20 percent of 20.
Default value: 10 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -HTTPPort
HTTP ports on the web server.
This allows the system to perform connection off-load for any client request that has a destination port matching one of these configured ports.
Minimum value = 1 Maximum value = 65535

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IcaPortS
The ICA ports on the Web server.
This allows the system to perform connection off-load for any client request that has a destination port matching one of these configured ports.
Minimum value = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InternalUserLogin
Enables/disables the internal user from logging in to the appliance.
Before disabling internal user login, you must have key-based authentication set up on the appliance.
The file name for the key pair must be "ns_comm_key".
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ipttl
Set the IP Time to Live (TTL) and Hop Limit value for all outgoing packets from Citrix ADC.
Default value: 255 Minimum value = 1 Maximum value = 255

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxConn
Maximum number of connections that will be made from the appliance to the web server(s) attached to it.
The value entered here is applied globally to all attached servers.
Default value: 0 Minimum value = 0 Maximum value = 4294967294

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxReq
Maximum number of requests that the system can pass on a particular connection between the appliance and a server attached to it.
Setting this value to 0 allows an unlimited number of requests to be passed.
This value is overridden by the maximum number of requests configured on the individual service.
Minimum value = 0 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MgmtHTTPPort
This allow the configuration of management HTTP port.
Default value: 80 Minimum value = 1 Maximum value = 65534

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 18
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MgmtHTTPSPort
This allows the configuration of management HTTPS port.
Default value: 443 Minimum value = 1 Maximum value = 65534

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PmtuMin
Minimum path MTU value that Citrix ADC will process in the ICMP fragmentation needed message.
If the ICMP message contains a value less than this value, then this value is used instead.
Default value: 576 Minimum value = 168 Maximum value = 1500

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PmtuTimeout
Interval, in minutes, for flushing the PMTU entries.
Default value: 10 Minimum value = 1 Maximum value = 1440

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProxyProtocol
Disable/Enable v1 or v2 proxy protocol header for client info insertion.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 22
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecureCookie
Enable or disable secure flag for persistence cookie.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 23
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecureicaPortS
The Secure ICA ports on the Web server.
This allows the system to perform connection off-load for any client request that has a destination port matching one of these configured ports.
Minimum value = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServicePathingressvlan
VLAN on which the subscriber traffic arrives on the appliance.
Minimum value = 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TCPCip
Enable or disable the insertion of the client TCP/IP header in TCP payload passed from the client to one, some, or all servers attached to the system.
The passed address can then be accessed through a minor modification to the server.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 26
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timezone
Time zone for the Citrix ADC.
Name of the time zone should be specified as argument.
Default value: CoordinatedUniversalTime Minimum length = 1 Maximum length = 63

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 27
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseProxyPort
Enable/Disable use_proxy_port setting.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 28
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
Position: 29
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

