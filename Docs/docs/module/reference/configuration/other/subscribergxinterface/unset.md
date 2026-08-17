---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetSubscribergxinterface

## SYNOPSIS
Clears one or more NetScaler subscribergxinterface resource properties.

## SYNTAX

```
Invoke-NSUnsetSubscribergxinterface [-CerRequestTimeout] [-HealthCheck] [-HealthCheckttl]
 [-Holdonsubscriberabsence] [-Idlettl] [-Negativettl] [-NegativettllimitedSuccess] [-Purgesdbongxfailure]
 [-RequestRetryattempts] [-RequestTimeout] [-RevalidationTimeout] [-Service] [-ServicePathavp]
 [-ServicePathvendorid] [-VServer] [[-Session] <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for Gx interface Parameters resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetSubscribergxinterface -CerRequestTimeout  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetSubscribergxinterface -CerRequestTimeout  -WhatIf
```

## PARAMETERS

### -CerRequestTimeout
q!Healthcheck request timeout, in seconds, after which the Citrix ADC considers that no CCA packet received to the initiated CCR.
After this time Citrix ADC should send again CCR to PCRF server.
!.
Default value: 0 Minimum value = 0 Maximum value = 86400

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

### -HealthCheck
q!Set this setting to yes if Citrix ADC should send DWR packets to PCRF server.
When the session is idle, healthcheck timer expires and DWR packets are initiated in order to check that PCRF server is active.
By default set to No.
!.
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

### -HealthCheckttl
q!Healthcheck timeout, in seconds, after which the DWR will be sent in order to ensure the state of the PCRF server.
Any CCR, CCA, RAR or RRA message resets the timer.
!.
Default value: 30 Minimum value = 6 Maximum value = 86400

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

### -Holdonsubscriberabsence
Set this setting to yes if Citrix ADC needs to Hold pakcets till subscriber session is fetched from PCRF.
Else set to NO.
By default set to yes.
If this setting is set to NO, then till Citrix ADC fetches subscriber from PCRF, default subscriber profile will be applied to this subscriber if configured.
If default subscriber profile is also not configured an undef would be raised to expressions which use Subscriber attributes.
. Default value: YES Possible values = YES, NO

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

### -Idlettl
q!Idle Time, in seconds, after which the Gx CCR-U request will be sent after any PCRF activity on a session.
Any RAR or CCA message resets the timer.
Zero value disables the idle timeout.
!.
Default value: 900 Minimum value = 0 Maximum value = 86400

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

### -Negativettl
q!Negative TTL, in seconds, after which the Gx CCR-I request will be resent for sessions that have not been resolved by PCRF due to server being down or no response or failed response.
Instead of polling the PCRF server constantly, negative-TTL makes Citrix ADC stick to un-resolved session.
Meanwhile Citrix ADC installs a negative session to avoid going to PCRF.
For Negative Sessions, Netcaler inherits the attributes from default subscriber profile if default subscriber is configured.
A default subscriber could be configured as 'add subscriber profile *'.
Or these attributes can be inherited from Radius as well if Radius is configued.
Zero value disables the Negative Sessions.
And Citrix ADC does not install Negative sessions even if subscriber session could not be fetched.
!.
Default value: 600 Minimum value = 0 Maximum value = 86400

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

### -NegativettllimitedSuccess
Set this to YES if Citrix ADC should create negative session for Result-Code DIAMETER_LIMITED_SUCCESS (2002) received in CCA-I.
If set to NO, regular session is created.
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

### -Purgesdbongxfailure
Set this setting to YES if needed to purge Subscriber Database in case of Gx failure.
By default set to NO.
. Default value: NO Possible values = YES, NO

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

### -RequestRetryattempts
If the request does not complete within requestTimeout time, the request is retransmitted for requestRetryAttempts time.
Default value: 3

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

### -RequestTimeout
q!Time, in seconds, within which the Gx CCR request must complete.
If the request does not complete within this time, the request is retransmitted for requestRetryAttempts time.
If still reuqest is not complete then default subscriber profile will be applied to this subscriber if configured.
If default subscriber profile is also not configured an undef would be raised to expressions which use Subscriber attributes.
Zero disables the timeout.
!.
Default value: 10 Minimum value = 0 Maximum value = 86400

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

### -RevalidationTimeout
q!Revalidation Timeout, in seconds, after which the Gx CCR-U request will be sent after any PCRF activity on a session.
Any RAR or CCA message resets the timer.
Zero value disables the idle timeout.
!.
Default value: 0 Minimum value = 0 Maximum value = 86400

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

### -Service
Name of DIAMETER/SSL_DIAMETER service corresponding to PCRF to which the Gx connection is established.
The service type of the service must be DIAMETER/SSL_DIAMETER.
Mutually exclusive with vserver parameter.
Therefore, you cannot set both Service and the Virtual Server in the Gx Interface.
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

### -ServicePathavp
The AVP code in which PCRF sends service path applicable for subscriber.
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

### -ServicePathvendorid
The vendorid of the AVP in which PCRF sends service path for subscriber.

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

### -VServer
Name of the load balancing, or content switching vserver to which the Gx connections are established.
The service type of the virtual server must be DIAMETER/SSL_DIAMETER.
Mutually exclusive with the service parameter.
Therefore, you cannot set both service and the Virtual Server in the Gx Interface.
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

