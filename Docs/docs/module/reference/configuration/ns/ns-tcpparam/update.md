---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateNsTCPParam

## SYNOPSIS
Updates a NetScaler nstcpparam resource.

## SYNTAX

```
Invoke-NSUpdateNsTCPParam [[-Ackonpush] <String>] [[-AutosynCookieTimeout] <Int32>]
 [[-CompactTCPOptionnoop] <String>] [[-ConnFlushIfnomem] <String>] [[-ConnFlushThres] <Int32>]
 [[-Delayedack] <Int32>] [[-DelinkClientsErveronrst] <String>] [[-DownStaterst] <String>]
 [[-Enhancedisngeneration] <String>] [[-Initialcwnd] <Int32>] [[-KaProbeUpdatelastactivity] <String>]
 [[-Learnvsvrmss] <String>] [[-Limitedpersist] <String>] [[-MaxBurst] <Int32>] [[-MaxDynServerProbeS] <Int32>]
 [[-MaxPktpermss] <Int32>] [[-MaxSynackretx] <Int32>] [[-MaxSynhold] <Int32>] [[-MaxSynholdperProbe] <Int32>]
 [[-MaxTimewaitConn] <Int32>] [[-MinRto] <Int32>] [[-MpTCPChecksum] <String>]
 [[-MpTCPClosempTCPSessiononlastsfclose] <String>] [[-MpTCPConcloseonpassivesf] <String>]
 [[-MpTCPFastcloseoption] <String>] [[-MpTCPImmediatesfcloseonfin] <String>] [[-MpTCPMaxPendingsf] <Int32>]
 [[-MpTCPMaxSf] <Int32>] [[-MpTCPPendingjoinThreshold] <Int32>] [[-MpTCPReliableaddaddr] <String>]
 [[-MpTCPRtostoswitchsf] <Int32>] [[-MpTCPSendsfresetoption] <String>] [[-MpTCPSfreplaceTimeout] <Int32>]
 [[-MpTCPSfTimeout] <Int32>] [[-MpTCPUseBackupOndss] <String>] [[-MSSLEarndelay] <Int32>]
 [[-MSSLEarnInterval] <Int32>] [[-Nagle] <String>] [[-Oooqsize] <Int32>] [[-Pktperretx] <Int32>]
 [[-Recvbuffsize] <Int32>] [[-Rfc5961chlgacklimit] <Int32>] [[-Sack] <String>]
 [[-Sendresetreasoncode] <String>] [[-Slowstartincr] <Int32>] [[-Synattackdetection] <String>]
 [[-Synholdfastgiveup] <Int32>] [[-TCPFastopenCookieTimeout] <Int32>] [[-TCPFinTimeout] <Int32>]
 [[-TCPMaxRetries] <Int32>] [[-Ws] <String>] [[-Wsval] <Int32>] [[-Session] <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for tcp parameters resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateNsTCPParam  -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateNsTCPParam  -WhatIf
```

## PARAMETERS

### -Ackonpush
Send immediate positive acknowledgement (ACK) on receipt of TCP packets with PUSH flag.
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

### -AutosynCookieTimeout
Timeout for the server to function in syncookie mode after the synattack.
This is valid if TCP syncookie is disabled on the profile and server acts in non syncookie mode by default.
Default value: 30 Minimum value = 7 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -CompactTCPOptionnoop
If enabled, non-negotiated TCP options are removed from the received packet while proxying it.
By default, non-negotiated TCP options would be replaced by NOPs in the proxied packets.
This option is not applicable for Citrix ADC generated packets.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -ConnFlushIfnomem
Flush an existing connection if no memory can be obtained for new connection.
HALF_CLOSED_AND_IDLE: Flush a connection that is closed by us but not by peer, or failing that, a connection that is past configured idle time.
New connection fails if no such connection can be found.
FIFO: If no half-closed or idle connection can be found, flush the oldest non-management connection, even if it is active.
New connection fails if the oldest few connections are management connections.
Note: If you enable this setting, you should also consider lowering the zombie timeout and half-close timeout, while setting the Citrix ADC timeout.
See Also: connFlushThres argument below.
Default value: NSA_CONNFLUSH_NONE Possible values = NONE , HALFCLOSED_AND_IDLE, FIFO

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

### -ConnFlushThres
Flush an existing connection (as configured through -connFlushIfNoMem FIFO) if the system has more than specified number of connections, and a new connection is to be established.
Note: This value may be rounded down to be a whole multiple of the number of packet engines running.
Minimum value = 1

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

### -Delayedack
Timeout for TCP delayed ACK, in milliseconds.
Default value: 100 Minimum value = 10 Maximum value = 300

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

### -DelinkClientsErveronrst
If enabled, Delink client and server connection, when there is outstanding data to be sent to the other side.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -DownStaterst
Flag to switch on RST on down services.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Enhancedisngeneration
If enabled, increase the ISN variation in SYN-ACKs sent by the NetScaler.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Initialcwnd
Initial maximum upper limit on the number of TCP packets that can be outstanding on the TCP link to the server.
Default value: 10 Minimum value = 1 Maximum value = 44

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

### -KaProbeUpdatelastactivity
Update last activity for KA probes.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Learnvsvrmss
Enable or disable maximum segment size (MSS) learning for virtual servers.
Default value: DISABLED Possible values = ENABLED, DISABLED

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

### -Limitedpersist
Limit the number of persist (zero window) probes.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -MaxBurst
Maximum number of TCP segments allowed in a burst.
Default value: 6 Minimum value = 1 Maximum value = 255

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

### -MaxDynServerProbeS
Maximum number of probes that Citrix ADC can send out in 10 milliseconds, to dynamically learn a service.
Citrix ADC probes for the existence of the origin in case of wildcard virtual server or services.
Default value: 7 Minimum value = 1 Maximum value = 65535

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

### -MaxPktpermss
Maximum number of TCP packets allowed per maximum segment size (MSS).
Minimum value = 0 Maximum value = 1460

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

### -MaxSynackretx
When 'syncookie' is disabled in the TCP profile that is bound to the virtual server or service, and the number of TCP SYN+ACK retransmission by Citrix ADC for that virtual server or service crosses this threshold, the Citrix ADC responds by using the TCP SYN-Cookie mechanism.
Default value: 100 Minimum value = 100 Maximum value = 1048576

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

### -MaxSynhold
Limit the number of client connections (SYN) waiting for status of probe system wide.
Any new SYN packets will be dropped.
Default value: 16384 Minimum value = 256 Maximum value = 65535

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

### -MaxSynholdperProbe
Limit the number of client connections (SYN) waiting for status of single probe.
Any new SYN packets will be dropped.
Default value: 128 Minimum value = 1 Maximum value = 255

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

### -MaxTimewaitConn
Maximum number of connections to hold in the TCP TIME_WAIT state on a packet engine.
New connections entering TIME_WAIT state are proactively cleaned up.
Default value: 7000 Minimum value = 1

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

### -MinRto
Minimum retransmission timeout, in milliseconds, specified in 10-millisecond increments (value must yield a whole number if divided by 10).
Default value: 1000 Minimum value = 10 Maximum value = 64000

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

### -MpTCPChecksum
Use MPTCP DSS checksum.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -MpTCPClosempTCPSessiononlastsfclose
Allow to send DATA FIN or FAST CLOSE on mptcp connection while sending FIN or RST on the last subflow.
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

### -MpTCPConcloseonpassivesf
Accept DATA_FIN/FAST_CLOSE on passive subflow.
Default value: ENABLED Possible values = ENABLED, DISABLED

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

### -MpTCPFastcloseoption
Allow to select option ACK or RESET to force the closure of an MPTCP connection abruptly.
Default value: ACK Possible values = ACK, RESET

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 25
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPImmediatesfcloseonfin
Allow subflows to close immediately on FIN before the DATA_FIN exchange is completed at mptcp level.
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

### -MpTCPMaxPendingsf
Maximum number of subflow connections supported in pending join state per mptcp connection.
Default value: 4 Minimum value = 0 Maximum value = 4

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 27
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPMaxSf
Maximum number of subflow connections supported in established state per mptcp connection.
Default value: 4 Minimum value = 2 Maximum value = 6

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 28
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPPendingjoinThreshold
Maximum system level pending join connections allowed.
Default value: 0 Minimum value = 0 Maximum value = 4294967294

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 29
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPReliableaddaddr
If enabled, Citrix ADC retransmits MPTCP ADD-ADDR option if echo response is not received within the timeout interval.
The retransmission is attempted only once.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 30
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPRtostoswitchsf
Number of RTO's at subflow level, after which MPCTP should start using other subflow.
Default value: 2 Minimum value = 1 Maximum value = 6

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 31
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPSendsfresetoption
Allow MPTCP subflows to send TCP RST Reason (MP_TCPRST) Option while sending TCP RST.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 32
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPSfreplaceTimeout
The minimum idle time value in seconds for idle mptcp subflows after which the sublow is replaced by new incoming subflow if maximum subflow limit is reached.
The priority for replacement is given to those subflow without any transaction.
Default value: 10 Minimum value = 0 Maximum value = 31536000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 33
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPSfTimeout
The timeout value in seconds for idle mptcp subflows.
If this timeout is not set, idle subflows are cleared after cltTimeout of vserver.
Default value: 0 Minimum value = 0 Maximum value = 31536000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 34
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MpTCPUseBackupOndss
When enabled, if NS receives a DSS on a backup subflow, NS will start using that subflow to send data.
And if disabled, NS will continue to transmit on current chosen subflow.
In case there is some error on a subflow (like RTO's/RST etc.) then NS can choose a backup subflow irrespective of this tunable.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 35
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSSLEarndelay
Frequency, in seconds, at which the virtual servers learn the Maximum segment size (MSS) from the services.
The argument to enable maximum segment size (MSS) for virtual servers must be enabled.
Default value: 3600 Minimum value = 1 Maximum value = 1048576

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 36
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MSSLEarnInterval
Duration, in seconds, to sample the Maximum Segment Size (MSS) of the services.
The Citrix ADC determines the best MSS to set for the virtual server based on this sampling.
The argument to enable maximum segment size (MSS) for virtual servers must be enabled.
Default value: 180 Minimum value = 1 Maximum value = 1048576

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 37
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Nagle
Enable or disable the Nagle algorithm on TCP connections.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 38
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Oooqsize
Maximum size of out-of-order packets queue.
A value of 0 means no limit.
Default value: 300 Minimum value = 0 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 39
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Pktperretx
Maximum limit on the number of packets that should be retransmitted on receiving a partial ACK.
Default value: 1 Minimum value = 1 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 40
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Recvbuffsize
TCP Receive buffer size.
Default value: 8190 Minimum value = 8190 Maximum value = 20971520

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 41
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Rfc5961chlgacklimit
Limits number of Challenge ACK sent per second, as recommended in RFC 5961(Improving TCP's Robustness to Blind In-Window Attacks).
Default value: 0 Minimum value = 0 Maximum value = 2147483647

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 42
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sack
Enable or disable Selective ACKnowledgement (SACK).
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 43
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sendresetreasoncode
If enabled, NetScaler includes a debug code indicating the reason for the reset in the TCP Window header field of outgoing TCP RST segments.
Default value: DISABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 44
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Slowstartincr
Multiplier that determines the rate at which slow start increases the size of the TCP transmission window after each acknowledgement of successful transmission.
Default value: 2 Minimum value = 1 Maximum value = 100

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 45
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Synattackdetection
Detect TCP SYN packet flood and send an SNMP trap.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 46
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Synholdfastgiveup
Maximum threshold.
After crossing this threshold number of outstanding probes for origin, the Citrix ADC reduces the number of connection retries for probe connections.
Default value: 1024 Minimum value = 256 Maximum value = 65535

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 47
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TCPFastopenCookieTimeout
Timeout in seconds after which a new TFO Key is computed for generating TFO Cookie.
If zero, the same key is used always.
If timeout is less than 120seconds, NS defaults to 120seconds timeout.
Default value: 0 Minimum value = 0 Maximum value = 31536000

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 48
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TCPFinTimeout
The amount of time in seconds, after which a TCP connnection in the TCP TIME-WAIT state is flushed.
Default value: 40 Minimum value = 10 Maximum value = 240

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 49
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -TCPMaxRetries
Number of RTO's after which a connection should be freed.
Default value: 7 Minimum value = 1 Maximum value = 7

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 50
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Ws
Enable or disable window scaling.
Default value: ENABLED Possible values = ENABLED, DISABLED

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 51
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wsval
Factor used to calculate the new window size.
This argument is needed only when the window scaling is enabled.
Default value: 8 Minimum value = 0 Maximum value = 14

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 52
Default value: 0
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
Position: 53
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

