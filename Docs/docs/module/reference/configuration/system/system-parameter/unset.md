---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSystemParameter

## SYNOPSIS
Clears one or more NetScaler systemparameter resource properties.

## SYNTAX

```
Invoke-NSUnsetSystemParameter [-Basicauth] [-CLILoglevel] [-Daystoexpire] [-Denylist] [-Denylistlogging]
 [-Doppler] [-FipsUserMode] [-Forcepasswordchange] [-GoogleAnalytics] [-LocalAuth] [-MaxSessionperUser]
 [-MinPasswordlen] [-NatpcbforceFlushLimit] [-NatpcbrstonTimeout] [-Passwordhistorycontrol] [-Promptstring]
 [-Pwdhistorycount] [-RbaonResponse] [-Reauthonauthparamchange] [-RemovesensitiveFileS] [-RestrictedTimeout]
 [-Strongpassword] [-Timeout] [-TotalauthTimeout] [-Wafprotection] [-Warnpriorndays] [[-Session] <PSObject>]
 [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Configuration for system parameter resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSystemParameter -Basicauth ENABLED -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSystemParameter -Basicauth ENABLED -WhatIf
```

## PARAMETERS

### -Basicauth
Enable or disable basic authentication for Nitro API.
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

### -CLILoglevel
Audit log level, which specifies the types of events to log for cli executed commands.
Available values function as follows: * EMERGENCY - Events that indicate an immediate crisis on the server.
* ALERT - Events that might require action.
* CRITICAL - Events that indicate an imminent server crisis.
* ERROR - Events that indicate some type of error.
* WARNING - Events that require action in the near future.
* NOTICE - Events that the administrator should know about.
* INFORMATIONAL - All but low-level events.
* DEBUG - All events, in extreme detail.
Default value: INFORMATIONAL Possible values = EMERGENCY, ALERT, CRITICAL, ERROR, WARNING, NOTICE, INFORMATIONAL, DEBUG

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

### -Daystoexpire
Password expiry days for all the system users.
The daystoexpire value ranges from 30 to 255.
Minimum value = 30 Maximum value = 255

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

### -Denylist
Enable or disable denylist protection.
The available options are: * ON - Denylist feature is enabled.
* OFF - Denylist feature is disabled.
Default value: ON Possible values = ON, OFF

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

### -Denylistlogging
Enable or disable denylist protection logging.
The available options are: * ON - Denylist logging is enabled.
* OFF - Denylist logging is disabled.
Default value: OFF Possible values = ON, OFF

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

### -Doppler
Enable or disable Doppler.
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

### -FipsUserMode
Use this option to set the FIPS mode for key user-land processes.
When enabled, these user-land processes will operate in FIPS mode.
In this mode, these processes will use FIPS 140-2 certified crypto algorithms.
With a FIPS license, it is enabled by default and cannot be disabled.
Without a FIPS license, it is disabled by default, wherein these user-land processes will not operate in FIPS mode.
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

### -Forcepasswordchange
Enable or disable force password change for nsroot user.
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

### -GoogleAnalytics
Enable or disable Google analytics.
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

### -LocalAuth
When enabled, local users can access Citrix ADC even when external authentication is configured.
When disabled, local users are not allowed to access the Citrix ADC, Local users can access the Citrix ADC only when the configured external authentication servers are unavailable.
This parameter is not applicable to SSH Key-based authentication.
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

### -MaxSessionperUser
Maximum number of client connection allowed per user.The maxsessionperuser value ranges from 1 to 40.
Minimum value = 1 Maximum value = 40

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

### -MinPasswordlen
Minimum length of system user password.
When strong password is enabled default minimum length is 8.
User entered value can be greater than or equal to 8.
Default mininum value is 1 when strong password is disabled.
Maximum value is 127 in both cases.
Minimum value = 1 Maximum value = 127

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

### -NatpcbforceFlushLimit
Flush the system if the number of Network Address Translation Protocol Control Blocks (NATPCBs) exceeds this value.
Default value: 2147483647 Minimum value = 1000

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

### -NatpcbrstonTimeout
Send a reset signal to client and server connections when their NATPCBs time out.
Avoids the buildup of idle TCP connections on both the sides.
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

### -Passwordhistorycontrol
Enables or disable password expiry feature for system users.
If the feature is ENABLED, by default the last 6 passwords of users will be maintained and will not be allowed to reuse same.
When the feature is enabled the daystoexpire, warnpriorndays and pwdhistoryCount will be set with default values.
The values can only be set in system for system parameter.
It cannot be unset.
It is possible to set and unset the values for daytoexpire and warnpriorndays in system groups.
Default values if feature is ENABLED: daystoexpire: 30 warnpriorndays: 5 pwdhistoryCount: 6 If the feature is DISABLED the values cannot be set or unset in system parameter and system groups.
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

### -Promptstring
String to display at the command-line prompt.
Can consist of letters, numbers, hyphen (-), period (.), hash (#), space ( ), at (@), equal (=), colon (:), underscore (_), and the following variables: * %u - Will be replaced by the user name.
* %h - Will be replaced by the hostname of the Citrix ADC.
* %t - Will be replaced by the current time in 12-hour format.
* %T - Will be replaced by the current time in 24-hour format.
* %d - Will be replaced by the current date.
* %s - Will be replaced by the state of the Citrix ADC.
Note: The 63-character limit for the length of the string does not apply to the characters that replace the variables.
Minimum length = 1

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

### -Pwdhistorycount
Number of passwords to be maintained as history for system users.
The pwdhistorycount value ranges from 1 to 10.
Minimum value = 1 Maximum value = 10

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

### -RbaonResponse
Enable or disable Role-Based Authentication (RBA) on responses.
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

### -Reauthonauthparamchange
Enable or disable External user reauthentication when authentication parameter changes.
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

### -RemovesensitiveFileS
Use this option to remove the sensitive files from the system like authorise keys, public keys etc.
The commands which will remove sensitive files when this system paramter is enabled are rm cluster instance, rm cluster node, rm ha node, clear config full, join cluster and add cluster instance.
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

### -RestrictedTimeout
Enable/Disable the restricted timeout behaviour.
When enabled, timeout cannot be configured beyond admin configured timeout and also it will have the \[minimum - maximum\] range check.
When disabled, timeout will have the old behaviour.
By default the value is disabled.
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

### -Strongpassword
After enabling strong password (enableall / enablelocal - not included in exclude list), all the passwords / sensitive information must have - Atleast 1 Lower case character, Atleast 1 Upper case character, Atleast 1 numeric character, Atleast 1 special character ( ~, \`, !, @, #, $, %, ^, &, *, -, _, =, +, {, }, \[, \], |, \, :, \<, \>, /, ., ,, " ").
Exclude list in case of enablelocal is - NS_FIPS, NS_CRL, NS_RSAKEY, NS_PKCS12, NS_PKCS8, NS_LDAP, NS_TACACS, NS_TACACSACTION, NS_RADIUS, NS_RADIUSACTION, NS_ENCRYPTION_PARAMS.
So no Strong Password checks will be performed on these ObjectType commands for enablelocal case.
Default value: disabled Possible values = enableall, enablelocal, disabled

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

### -Timeout
CLI session inactivity timeout, in seconds.
If Restrictedtimeout argument is enabled, Timeout can have values in the range \[300-86400\] seconds.
If Restrictedtimeout argument is disabled, Timeout can have values in the range \[0, 10-100000000\] seconds.
Default value is 900 seconds.

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

### -TotalauthTimeout
Total time a request can take for authentication/authorization.
Default value: 20 Minimum value = 5 Maximum value = 120

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

### -Wafprotection
Configure WAF protection for endpoints used by NetScaler management interfaces.
The available options are: * DEFAULT - NetScaler decides which endpoints have WAF protection enabled.
* GUI - Endpoints used by the Management GUI Interface are WAF protected.
* DISABLED - WAF protection is disabled.
Default value: DEFAULT Possible values = DEFAULT, DISABLED, GUI

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

### -Warnpriorndays
Number of days before which password expiration warning would be thrown with respect to daystoexpire.
The warnpriorndays value ranges from 5 to 40.
Minimum value = 5 Maximum value = 40

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

