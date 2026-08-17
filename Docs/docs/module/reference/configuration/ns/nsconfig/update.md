---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateNSConfig

## SYNOPSIS
Updates a NetScaler nsconfig resource.

## SYNTAX

```
Invoke-NSUpdateNSConfig [[-CIP] <String>] [[-CIPHeader] <String>] [[-CookieVersion] <String>]
 [[-CrPortRange] <String>] [[-ExclusivequotaMaxClient] <Int32>] [[-Exclusivequotaspillover] <Int32>]
 [[-FtpPortRange] <String>] [[-GrantquotaMaxClient] <Int32>] [[-Grantquotaspillover] <Int32>]
 [[-HTTPPort] <String>] [[-Ifnum] <String[]>] [[-Ipaddress] <String>] [[-MaxConn] <Int32>] [[-MaxReq] <Int32>]
 [[-NetMask] <String>] [[-Nsvlan] <Int32>] [[-PmtuMin] <Int32>] [[-PmtuTimeout] <Int32>]
 [[-SecureCookie] <String>] [[-Securemanagementtd] <Int32>] [[-Securemanagementtraffic] <String>]
 [[-Tagged] <String>] [[-Timezone] <String>] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for system config resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateNSConfig  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateNSConfig  -WhatIf
```

## PARAMETERS

### -CIP
The option to control (enable or disable) the insertion of the actual client IP address into the HTTP header request passed from the client to one, some, or all servers attached to the system.
The passed address can then be accessed through a minor modification to the server.
l If cipHeader is specified, it will be used as the client IP header.
l If it is not specified, then the value that has been set by the set ns config CLI command will be used as the client IP header.
Possible values = ENABLED, DISABLED

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

### -CIPHeader
The text that will be used as the client IP header.
Minimum length = 1

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

### -CookieVersion
The version of the cookie inserted by system.
Possible values = 0, 1

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

### -CrPortRange
Port range for cache redirection services.
Minimum length = 1 Maximum length = 65535

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

### -ExclusivequotaMaxClient
The percentage of maxClient to be given to PEs.
Default value: 80 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exclusivequotaspillover
The percentage of spillover threshold to be given to PEs.
Default value: 80 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -FtpPortRange
Port range configured for FTP services.
Minimum length = 1024 Maximum length = 64000

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GrantquotaMaxClient
The percentage of shared quota to be granted at a time for maxClient.
Default value: 10 Minimum value = 0 Maximum value = 100

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

### -Grantquotaspillover
The percentage of shared quota to be granted at a time for spillover.
Default value: 10 Minimum value = 0 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -HTTPPort
The HTTP ports on the Web server.
This allows the system to perform connection off-load for any client request that has a destination port matching one of these configured ports.
Minimum value = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ifnum
Interfaces of the appliances that must be bound to the NSVLAN.
Minimum length = 1

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ipaddress
IP address of the Citrix ADC.
Commonly referred to as NSIP address.
This parameter is mandatory to bring up the appliance.
Minimum length = 1

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

### -MaxConn
The maximum number of connections that will be made from the system to the web server(s) attached to it.
The value entered here is applied globally to all attached servers.
Minimum value = 0 Maximum value = 4294967294

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxReq
The maximum number of requests that the system can pass on a particular connection between the system and a server attached to it.
Setting this value to 0 allows an unlimited number of requests to be passed.
Minimum value = 0 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetMask
Netmask corresponding to the IP address.
This parameter is mandatory to bring up the appliance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nsvlan
VLAN (NSVLAN) for the subnet on which the IP address resides.
Minimum value = 2 Maximum value = 4094

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

### -PmtuMin
The minimum Path MTU.
Default value: 576 Minimum value = 168 Maximum value = 1500

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

### -PmtuTimeout
The timeout value in minutes.
Default value: 10 Minimum value = 1 Maximum value = 1440

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

### -SecureCookie
enable/disable secure flag for persistence cookie.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 19
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Securemanagementtd
This positive integer identifies Management traffic domain.
If not specified, defaults to 4094.
Minimum value = 0 Maximum value = 4094

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

### -Securemanagementtraffic
This enabled secure management traffic handling.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 21
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tagged
Specifies that the interfaces will be added as 802.1q tagged interfaces.
Packets sent on these interface on this VLAN will have an additional 4-byte 802.1q tag which identifies the VLAN.
To use 802.1q tagging, the switch connected to the appliance's interfaces must also be configured for tagging.
Default value: YES Possible values = YES, NO

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

### -Timezone
Name of the timezone.
Default value: CoordinatedUniversalTime Minimum length = 1 Maximum length = 64

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

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 24
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

