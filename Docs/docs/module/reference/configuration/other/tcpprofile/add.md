---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSAddTCPProfile

## SYNOPSIS
Creates a NetScaler nstcpprofile resource.

## SYNTAX

```
Invoke-NSAddTCPProfile [-Ackaggregation <String>] [-Ackonpush <String>] [-ApplyadaptiveTCP <String>]
 [-Buffersize <Int32>] [-Burstratecontrol <String>] [-ClientIpTCPOption <String>]
 [-ClientIpTCPOptionnumber <Int32>] [-Delayedack <Int32>] [-DropestConnOnTimeout <String>]
 [-DrophalfclosedConnOnTimeout <String>] [-Dsack <String>] [-Dupackthresh <Int32>]
 [-Dynamicreceivebuffering <String>] [-Ecn <String>] [-EstablishClientConn <String>] [-Fack <String>]
 [-Flavor <String>] [-Frto <String>] [-Hystart <String>] [-Initialcwnd <Int32>] [-Ka <String>]
 [-KaConnIdletime <Int32>] [-KaMaxProbeS <Int32>] [-KaProbeInterval <Int32>]
 [-KaProbeUpdatelastactivity <String>] [-MaxBurst <Int32>] [-MaxCwnd <Int32>] [-MaxPktpermss <Int32>]
 [-MinRto <Int32>] [-Mpcapablecbit <String>] [-MpTCP <String>] [-MpTCPDropDataOnpreestsf <String>]
 [-MpTCPFastopen <String>] [-MpTCPSessionTimeout <Int32>] [-Mss <Int32>] [-Nagle <String>] [-Name] <String>
 [-Oooqsize <Int32>] [-Pktperretx <Int32>] [-RateqMax <Int32>] [-Rfc5961compliance <String>]
 [-RstMaxAck <String>] [-Rstwindowattenuate <String>] [-Sack <String>] [-Sendbuffsize <Int32>]
 [-SendClientPortInTCPOption <String>] [-Slowstartincr <Int32>] [-SlowstartThreshold <Int32>]
 [-Spoofsyndrop <String>] [-SynCookie <String>] [-TaillossProbe <String>] [-TCPFastopen <String>]
 [-TCPFastopenCookieSize <Int32>] [-TCPMode <String>] [-TCPRate <Int32>] [-TCPSegoffload <String>]
 [-Timestamp <String>] [-Ws <String>] [-Wsval <Int32>] [-Session <PSObject>] [-IgnoreNotFound]
 [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for TCP profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSAddTCPProfile -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSAddTCPProfile -Name 'example' -WhatIf
```

## PARAMETERS

### -Ackaggregation
Enable or disable ACK Aggregation.
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

### -Ackonpush
Send immediate positive acknowledgement (ACK) on receipt of TCP packets with PUSH flag.
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

### -ApplyadaptiveTCP
Apply Adaptive TCP optimizations.
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

### -Buffersize
TCP buffering size, in bytes.
Default value: TCP_DEFAULT_BUFFSIZE Minimum value = 8190 Maximum value = 20971520

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

### -Burstratecontrol
TCP Burst Rate Control DISABLED/FIXED/DYNAMIC.
FIXED requires a TCP rate to be set.
Default value: DISABLED Possible values = DISABLED, FIXED, DYNAMIC

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

### -ClientIpTCPOption
Client IP in TCP options.
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

### -ClientIpTCPOptionnumber
ClientIP TCP Option number.
Default value: DISABLED Minimum value = 1 Maximum value = 254

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

### -Delayedack
Timeout for TCP delayed ACK, in milliseconds.
Default value: 100 Minimum value = 10 Maximum value = 300

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

### -DropestConnOnTimeout
Silently drop tcp established connections on idle timeout.
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

### -DrophalfclosedConnOnTimeout
Silently drop tcp half closed connections on idle timeout.
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

### -Dsack
Enable or disable DSACK.
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

### -Dupackthresh
TCP dupack threshold.
Default value: 3 Minimum value = 1 Maximum value = 15

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

### -Dynamicreceivebuffering
Enable or disable dynamic receive buffering.
When enabled, allows the receive buffer to be adjusted dynamically based on memory and network conditions.
Note: The buffer size argument must be set for dynamic adjustments to take place.
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

### -Ecn
Enable or disable TCP Explicit Congestion Notification.
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

### -EstablishClientConn
Establishing Client Client connection on First data/ Final-ACK / Automatic.
Default value: AUTOMATIC Possible values = AUTOMATIC, CONN_ESTABLISHED, ON_FIRST_DATA

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

### -Fack
Enable or disable FACK (Forward ACK).
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

### -Flavor
Set TCP congestion control algorithm.
Default value: BIC Possible values = Default, Westwood, BIC, CUBIC, Nile, BBR

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

### -Frto
Enable or disable FRTO (Forward RTO-Recovery).
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

### -Hystart
Enable or disable CUBIC Hystart.
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

### -Initialcwnd
Initial maximum upper limit on the number of TCP packets that can be outstanding on the TCP link to the server.
Default value: TCP_DEFAULT_INITIALCWND Minimum value = 1 Maximum value = 44

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

### -Ka
Send periodic TCP keep-alive (KA) probes to check if peer is still up.
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

### -KaConnIdletime
Duration, in seconds, for the connection to be idle, before sending a keep-alive (KA) probe.
Minimum value = 1 Maximum value = 4095

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

### -KaMaxProbeS
Number of keep-alive (KA) probes to be sent when not acknowledged, before assuming the peer to be down.
Minimum value = 1 Maximum value = 254

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

### -KaProbeInterval
Time interval, in seconds, before the next keep-alive (KA) probe, if the peer does not respond.
Minimum value = 1 Maximum value = 4095

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

### -KaProbeUpdatelastactivity
Update last activity for the connection after receiving keep-alive (KA) probes.
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

### -MaxBurst
Maximum number of TCP segments allowed in a burst.
Default value: 6 Minimum value = 1 Maximum value = 255

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

### -MaxCwnd
TCP Maximum Congestion Window.
Default value: 524288 Minimum value = 8190 Maximum value = 20971520

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

### -MaxPktpermss
Maximum number of TCP packets allowed per maximum segment size (MSS).
Minimum value = 0 Maximum value = 1460

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

### -MinRto
Minimum retransmission timeout, in milliseconds, specified in 10-millisecond increments (value must yield a whole number if divided by 10).
Default value: 1000 Minimum value = 10 Maximum value = 64000

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

### -Mpcapablecbit
Set C bit in MP-CAPABLE Syn-Ack sent by Citrix ADC.
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

### -MpTCP
Enable or disable Multipath TCP.
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

### -MpTCPDropDataOnpreestsf
Enable or disable silently dropping the data on Pre-Established subflow.
When enabled, DSS data packets are dropped silently instead of dropping the connection when data is received on pre established subflow.
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

### -MpTCPFastopen
Enable or disable Multipath TCP fastopen.
When enabled, DSS data packets are accepted before receiving the third ack of SYN handshake.
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

### -MpTCPSessionTimeout
MPTCP session timeout in seconds.
If this value is not set, idle MPTCP sessions are flushed after vserver's client idle timeout.
Default value: 0 Minimum value = 0 Maximum value = 86400

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

### -Mss
Maximum number of octets to allow in a TCP data segment.
Default value: TCP_DEFAULT_CLIENT_MSS Minimum value = 0 Maximum value = 9176

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

### -Nagle
Enable or disable the Nagle algorithm on TCP connections.
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

### -Name
Name for a TCP profile.
Must begin with a letter, number, or the underscore \\(_\\) character.
Other characters allowed, after the first character, are the hyphen \\(-\\), period \\(.\\), hash \\(\#\\), space \\( \\), at \\(@\\), colon \\(:\\), and equal \\(=\\) characters.
The name of a TCP profile cannot be changed after it is created.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks \\(for example, "my tcp profile" or 'my tcp profile'\\).
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

### -Oooqsize
Maximum size of out-of-order packets queue.
A value of 0 means no limit.
Default value: TCP_DEFAULT_MAX_OOO_PKTS Minimum value = 0 Maximum value = 65535

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

### -Pktperretx
Maximum limit on the number of packets that should be retransmitted on receiving a partial ACK.
Default value: 1 Minimum value = 1 Maximum value = 512

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

### -RateqMax
Maximum connection queue size in bytes, when BurstRateControl is used.
Default value: 0 Minimum value = 0 Maximum value = 1000000000

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

### -Rfc5961compliance
Enable or disable RFC 5961 compliance to protect against tcp spoofing(RST/SYN/Data).
When enabled, will be compliant with RFC 5961.
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

### -RstMaxAck
Enable or disable acceptance of RST that is out of window yet echoes highest ACK sequence number.
Useful only in proxy mode.
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

### -Rstwindowattenuate
Enable or disable RST window attenuation to protect against spoofing.
When enabled, will reply with corrective ACK when a sequence number is invalid.
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

### -Sack
Enable or disable Selective ACKnowledgement (SACK).
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

### -Sendbuffsize
TCP Send Buffer Size.
Default value: TCP_DEFAULT_SENDBUFFSIZE Minimum value = 8190 Maximum value = 20971520

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

### -SendClientPortInTCPOption
Send Client Port number along with Client IP in TCP-Options.
ClientIpTcpOption must be ENABLED.
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

### -Slowstartincr
Multiplier that determines the rate at which slow start increases the size of the TCP transmission window after each acknowledgement of successful transmission.
Default value: 2 Minimum value = 1 Maximum value = 100

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

### -SlowstartThreshold
TCP Slow Start Threhsold Value.
Default value: 524288 Minimum value = 8190 Maximum value = 20971520

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

### -Spoofsyndrop
Enable or disable drop of invalid SYN packets to protect against spoofing.
When disabled, established connections will be reset when a SYN packet is received.
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

### -SynCookie
Enable or disable the SYNCOOKIE mechanism for TCP handshake with clients.
Disabling SYNCOOKIE prevents SYN attack protection on the Citrix ADC.
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

### -TaillossProbe
TCP tail loss probe optimizations.
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

### -TCPFastopen
Enable or disable TCP Fastopen.
When enabled, NS can receive or send Data in SYN or SYN-ACK packets.
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

### -TCPFastopenCookieSize
TCP FastOpen Cookie size.
This accepts only even numbers.
Odd number is trimmed down to nearest even number.
Default value: 8 Minimum value = 4 Maximum value = 16

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

### -TCPMode
TCP Optimization modes TRANSPARENT / ENDPOINT.
Default value: TRANSPARENT Possible values = TRANSPARENT, ENDPOINT

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

### -TCPRate
TCP connection payload send rate in Kb/s.
Default value: 0 Minimum value = 0 Maximum value = 10000000

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

### -TCPSegoffload
Offload TCP segmentation to the NIC.
If set to AUTOMATIC, TCP segmentation will be offloaded to the NIC, if the NIC supports it.
Default value: AUTOMATIC Possible values = AUTOMATIC, DISABLED

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

### -Timestamp
Enable or Disable TCP Timestamp option (RFC 1323).
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

### -Ws
Enable or disable window scaling.
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

### -Wsval
Factor used to calculate the new window size.
This argument is needed only when window scaling is enabled.
Default value: TCP_DEFAULT_WSVAL Minimum value = 0 Maximum value = 14

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

