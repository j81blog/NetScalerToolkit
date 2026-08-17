---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateLbparameter

## SYNOPSIS
Updates a NetScaler lbparameter resource.

## SYNTAX

```
Invoke-NSUpdateLbparameter [[-Allowboundsvcremoval] <String>] [[-ComputedadcCookieAttribute] <String>]
 [[-ConsolidatedlConn] <String>] [[-CookiePassphrase] <String>] [[-DBSTTL] <Int32>]
 [[-DropmqttjumboMessage] <String>] [[-HTTPOnlyCookieFlag] <String>] [[-LbHashAlgorithm] <String>]
 [[-LbHashFingers] <Int32>] [[-LiteraladcCookieAttribute] <String>] [[-MaxPipelinenat] <Int32>]
 [[-MonItorConnectionClose] <String>] [[-MonItorskipMaxClient] <String>] [[-Preferdirectroute] <String>]
 [[-Proximityfromself] <String>] [[-RADIUSMessageAuthenticator] <String>] [[-RetainServiceState] <String>]
 [[-Startuprrfactor] <Int32>] [[-StoremqttClientIdandUserName] <String>] [[-UndefAction] <String>]
 [[-UseencryptedPersistenceCookie] <String>] [[-UsePortForHashLb] <String>]
 [[-UsesecuredPersistenceCookie] <String>] [[-VServerSpecIficmac] <String>] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for LB parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateLbparameter  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateLbparameter  -WhatIf
```

## PARAMETERS

### -Allowboundsvcremoval
This is used, to enable/disable the option of svc/svcgroup removal, if it is bound to one or more vserver.
If it is enabled, the svc/svcgroup can be removed, even if it bound to vservers.
If disabled, an error will be thrown, when the user tries to remove a svc/svcgroup without unbinding from its vservers.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -ComputedadcCookieAttribute
ComputedADCCookieAttribute accepts ns variable as input in form of string starting with $ (to understand how to configure ns variable, please check man add ns variable).
policies can be configured to modify this variable for every transaction and the final value of the variable after policy evaluation will be appended as attribute to Citrix ADC cookie (for example: LB cookie persistence , GSLB sitepersistence, CS cookie persistence, LB group cookie persistence).
Only one of ComputedADCCookieAttribute, LiteralADCCookieAttribute can be set.
Sample usage - add ns variable lbvar -type TEXT(100) -scope Transaction add ns assignment lbassign -variable $lbvar -set "\\\\";SameSite=Strict\\\\"" add rewrite policy lbpol \<valid policy expression\> lbassign bind rewrite global lbpol 100 next -type RES_OVERRIDE set lb param -ComputedADCCookieAttribute "$lbvar" For incoming client request, if above policy evaluates TRUE, then SameSite=Strict will be appended to ADC generated cookie.

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

### -ConsolidatedlConn
To find the service with the fewest connections, the virtual server uses the consolidated connection statistics from all the packet engines.
The NO setting allows consideration of only the number of connections on the packet engine that received the new connection.
Default value: YES Possible values = YES, NO

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

### -CookiePassphrase
Use this parameter to specify the passphrase used to generate secured persistence cookie value.
It specifies the passphrase with a maximum of 31 characters.

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

### -DBSTTL
Specify the TTL for DNS record for domain based service.
The default value of ttl is 0 which indicates to use the TTL received in DNS response for monitors.
Default value: 0

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

### -DropmqttjumboMessage
When this option is enabled, MQTT messages of length greater than 64k will be dropped and the client/server connections will be reset.
Default value: YES Possible values = YES, NO

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

### -HTTPOnlyCookieFlag
Include the HttpOnly attribute in persistence cookies.
The HttpOnly attribute limits the scope of a cookie to HTTP requests and helps mitigate the risk of cross-site scripting attacks.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -LbHashAlgorithm
This option dictates the hashing algorithm used for hash based LB methods (URLHASH, DOMAINHASH, SOURCEIPHASH, DESTINATIONIPHASH, SRCIPDESTIPHASH, SRCIPSRCPORTHASH, TOKEN, USER_TOKEN, CALLIDHASH).
Default value: DEFAULT Possible values = DEFAULT, PRAC, JARH

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LbHashFingers
This option is used to specify the number of fingers to be used in PRAC and JARH algorithms for hash based LB methods.
Increasing the number of fingers might give better distribution of traffic at the expense of additional memory.
Default value: 256 Minimum value = 1 Maximum value = 1024

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

### -LiteraladcCookieAttribute
String configured as LiteralADCCookieAttribute will be appended as attribute for Citrix ADC cookie (for example: LB cookie persistence , GSLB site persistence, CS cookie persistence, LB group cookie persistence).
Sample usage - set lb parameter -LiteralADCCookieAttribute ";SameSite=None".

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

### -MaxPipelinenat
Maximum number of concurrent requests to allow on a single client connection, which is identified by the \<clientip:port\>-\<vserver ip:port\> tuple.
This parameter is applicable to ANY service type and all UDP service types (except DNS) and only when "svrTimeout" is set to zero.
A value of 0 (zero) applies no limit to the number of concurrent requests allowed on a single client connection.

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

### -MonItorConnectionClose
Close monitoring connections by sending the service a connection termination message with the specified bit set.
Default value: FIN Possible values = RESET, FIN

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

### -MonItorskipMaxClient
When a monitor initiates a connection to a service, do not check to determine whether the number of connections to the service has reached the limit specified by the service's Max Clients setting.
Enables monitoring to continue even if the service has reached its connection limit.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Preferdirectroute
Perform route lookup for traffic received by the Citrix ADC, and forward the traffic according to configured routes.
Do not set this parameter if you want a wildcard virtual server to direct packets received by the appliance to an intermediary device, such as a firewall, even if their destination is directly connected to the appliance.
Route lookup is performed after the packets have been processed and returned by the intermediary device.
Default value: YES Possible values = YES, NO

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

### -Proximityfromself
Use the ADC location instead of client IP for static proximity LB or GSLB decision.
Default value: NO Possible values = YES, NO

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

### -RADIUSMessageAuthenticator
If enabled, NetScaler will verify the message authenticator and also generate message authenticator if not present.
Default value: NO Possible values = YES, NO

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RetainServiceState
This option is used to retain the original state of service or servicegroup member when an enable server command is issued.
Default value: OFF Possible values = ON, OFF

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 17
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Startuprrfactor
Number of requests, per service, for which to apply the round robin load balancing method before switching to the configured load balancing method, thus allowing services to ramp up gradually to full load.
Until the specified number of requests is distributed, the Citrix ADC is said to be implementing the slow start mode (or startup round robin).
Implemented for a virtual server when one of the following is true: * The virtual server is newly created.
* One or more services are newly bound to the virtual server.
* One or more services bound to the virtual server are enabled.
* The load balancing method is changed.
This parameter applies to all the load balancing virtual servers configured on the Citrix ADC, except for those virtual servers for which the virtual server-level slow start parameters (New Service Startup Request Rate and Increment Interval) are configured.
If the global slow start parameter and the slow start parameters for a given virtual server are not set, the appliance implements a default slow start for the virtual server, as follows: * For a newly configured virtual server, the appliance implements slow start for the first 100 requests received by the virtual server.
* For an existing virtual server, if one or more services are newly bound or newly enabled, or if the load balancing method is changed, the appliance dynamically computes the number of requests for which to implement startup round robin.
It obtains this number by multiplying the request rate by the number of bound services (it includes services that are marked as DOWN).
For example, if the current request rate is 20 requests/s and ten services are bound to the virtual server, the appliance performs startup round robin for 200 requests.
Not applicable to a virtual server for which a hash based load balancing method is configured.

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

### -StoremqttClientIdandUserName
This option allows to store the MQTT clientid and username in transactional logs.
Default value: NO Possible values = YES, NO

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

### -UndefAction
Action to perform when policy evaluation creates an UNDEF condition.
Available settings function as follows: * NOLBACTION - Does not consider LB action in making LB decision.
* RESET - Reset the request and notify the user, so that the user can resend the request.
* DROP - Drop the request without sending a response to the user.
Default value: "NOLBACTION"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 20
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseencryptedPersistenceCookie
Encode persistence cookie values using SHA2 hash.
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

### -UsePortForHashLb
Include the port number of the service when creating a hash for hash based load balancing methods.
With the NO setting, only the IP address of the service is considered when creating a hash.
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

### -UsesecuredPersistenceCookie
Encode persistence cookie values using SHA2 hash.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -VServerSpecIficmac
Allow a MAC-mode virtual server to accept traffic returned by an intermediary device, such as a firewall, to which the traffic was previously forwarded by another MAC-mode virtual server.
The second virtual server can then distribute that traffic across the destination server farm.
Also useful when load balancing Branch Repeater appliances.
Note: The second virtual server can also send the traffic to another set of intermediary devices, such as another set of firewalls.
If necessary, you can configure multiple MAC-mode virtual servers to pass traffic successively through multiple sets of intermediary devices.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Session
The NetScaler session.
If omitted, the current default session is used.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
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

