---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUpdateHTTPProfile

## SYNOPSIS
Updates a NetScaler nshttpprofile resource.

## SYNTAX

```
Invoke-NSUpdateHTTPProfile [-AdptTimeout <String>] [-AllowonlywordCharactersAndhyphen <String>]
 [-Altsvc <String>] [-Altsvcvalue <String>] [-ApdexcltResponseTimeThreshold <Int32>]
 [-ClientIphdrexpr <String>] [-CMPOnpush <String>] [-ConMultiPlex <String>] [-Dropextracrlf <String>]
 [-DropextraData <String>] [-Dropinvalreqs <String>] [-GrpcHoldlimit <Int32>] [-GrpcHoldTimeout <Int32>]
 [-GrpcLengthDelimitation <String>] [-HostHeaderValidation <String>] [-HTTP2 <String>]
 [-HTTP2altsvcframe <String>] [-HTTP2direct <String>] [-HTTP2extendedConnEct <String>]
 [-HTTP2HeaderTablesize <Int32>] [-HTTP2initialConnWindowsize <Int32>] [-HTTP2initialwindowsize <Int32>]
 [-HTTP2MaxConcurrentstreams <Int32>] [-HTTP2MaxEmptyframesperMin <Int32>] [-HTTP2MaxFramesize <Int32>]
 [-HTTP2MaxHeaderListsize <Int32>] [-HTTP2MaxPingframesperMin <Int32>] [-HTTP2MaxResetframesperMin <Int32>]
 [-HTTP2MaxRxresetframesperMin <Int32>] [-HTTP2MaxSettingsFramesperMin <Int32>] [-HTTP2MinSeverConn <Int32>]
 [-HTTP2strictCipher <String>] [-HTTP3 <String>] [-HTTP3MaxHeaderBlockedstreams <Int32>]
 [-HTTP3MaxHeaderFieldSectionsize <Int32>] [-HTTP3MaxHeaderTablesize <Int32>] [-HTTP3MinSeverConn <Int32>]
 [-HTTP3WebTransPort <String>] [-HTTPPipelinebuffsize <Int32>] [-Incomphdrdelay <Int32>]
 [-MarkConnReqinval <String>] [-MarkHTTP09inval <String>] [-MarkHTTPHeaderExtrawsError <String>]
 [-Markrfc7230noncompliantinval <String>] [-Marktracereqinval <String>] [-MaxDuplicateHeaderFieldS <Int32>]
 [-MaxHeaderFieldLen <Int32>] [-MaxHeaderLen <Int32>] [-MaxReq <Int32>] [-MaxReusepool <Int32>]
 [-MinReusepool <Int32>] [-Name] <String> [-PassProtocolUpgrade <String>] [-Persistentetag <String>]
 [-ReqTimeout <Int32>] [-ReqTimeoutAction <String>] [-ReusepoolTimeout <Int32>] [-Rtsptunnel <String>]
 [-WebLog <String>] [-WebSocket <String>] [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound]
 [-ThrowOnWarning] [-PassThru] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for HTTP profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUpdateHTTPProfile -Name 'example' -PassThru
```

### EXAMPLE 2
```
Invoke-NSUpdateHTTPProfile -Name 'example' -WhatIf
```

## PARAMETERS

### -AdptTimeout
Adapts the configured request timeout based on flow conditions.
The timeout is increased or decreased internally and applied on the flow.
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

### -AllowonlywordCharactersAndhyphen
When enabled allows only the word characters \[A-Za-z0-9_\] and hyphen \[-\] in the request/response header names and the connection will be reset for the other characters.
When disabled allows any visible (printing) characters (%21-%7E) except delimiters (double quotes and "(),/:;\<=\>?@\[\]{}").
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

### -Altsvc
Choose whether to enable support for Alternative Services.
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

### -Altsvcvalue
Configure a custom Alternative Services header value that should be inserted in the response to advertise a HTTP/SSL/HTTP_QUIC vserver.

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

### -ApdexcltResponseTimeThreshold
This option sets the satisfactory threshold (T) for client response time in milliseconds to be used for APDEX calculations.
This means a transaction responding in less than this threshold is considered satisfactory.
Transaction responding between T and 4*T is considered tolerable.
Any transaction responding in more than 4*T time is considered frustrating.
Citrix ADC maintains stats for such tolerable and frustrating transcations.
And client response time related apdex counters are only updated on a vserver which receives clients traffic.
Default value: 500 Minimum value = 1 Maximum value = 3600000

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

### -ClientIphdrexpr
Name of the header that contains the real client IP address.

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

### -CMPOnpush
Start data compression on receiving a TCP packet with PUSH flag set.
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

### -ConMultiPlex
Reuse server connections for requests from more than one client connections.
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

### -Dropextracrlf
Drop any extra 'CR' and 'LF' characters present after the header.
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

### -DropextraData
Drop any extra data when server sends more data than the specified content-length.
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

### -Dropinvalreqs
Drop invalid HTTP requests or responses.
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

### -GrpcHoldlimit
Maximum size in bytes allowed to buffer gRPC packets till trailer is received.
Default value: 131072 Minimum value = 0 Maximum value = 33554432

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

### -GrpcHoldTimeout
Maximum time in milliseconds allowed to buffer gRPC packets till trailer is received.
The value should be in multiples of 100.
Default value: 1000 Minimum value = 0 Maximum value = 180000

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

### -GrpcLengthDelimitation
Set to DISABLED for gRPC without a length delimitation.
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

### -HostHeaderValidation
Validates the length of the Host header and its syntax.
Also includes validation of the port number if specified.
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

### -HTTP2
Choose whether to enable support for HTTP/2.
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

### -HTTP2altsvcframe
Choose whether to enable support for sending HTTP/2 ALTSVC frames.
When enabled, the ADC sends HTTP/2 ALTSVC frames to HTTP/2 clients, instead of the Alt-Svc response header field.
Not applicable to servers.
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

### -HTTP2direct
Choose whether to enable support for Direct HTTP/2.
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

### -HTTP2extendedConnEct
Choose whether to enable HTTP/2 Extended CONNECT mechanism.
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

### -HTTP2HeaderTablesize
Maximum size of the header compression table used to decode header blocks, in bytes.
Default value: 4096 Minimum value = 0 Maximum value = 131072

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

### -HTTP2initialConnWindowsize
Initial window size for connection level flow control, in bytes.
Default value: 65535 Minimum value = 65535 Maximum value = 67108864

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

### -HTTP2initialwindowsize
Initial window size for stream level flow control, in bytes.
Default value: 65535 Minimum value = 8192 Maximum value = 20971520

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

### -HTTP2MaxConcurrentstreams
Maximum number of concurrent streams that is allowed per connection.
Default value: 100 Minimum value = 0 Maximum value = 1000

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

### -HTTP2MaxEmptyframesperMin
Maximum number of empty frames allowed in HTTP2 connection per minute.
Default value: 60 Minimum value = 1 Maximum value = 360000

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

### -HTTP2MaxFramesize
Maximum size of the frame payload that the Citrix ADC is willing to receive, in bytes.
Default value: 16384 Minimum value = 16384 Maximum value = 32768

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

### -HTTP2MaxHeaderListsize
Maximum size of header list that the Citrix ADC is prepared to accept, in bytes.
NOTE: The actual plain text header size that the Citrix ADC accepts is limited by maxHeaderLen.
Please change maxHeaderLen parameter as well when modifying http2MaxHeaderListSize.
Default value: 24576 Minimum value = 8192 Maximum value = 131071

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

### -HTTP2MaxPingframesperMin
Maximum number of PING frames allowed in HTTP2 connection per minute.
Default value: 60 Minimum value = 1 Maximum value = 360000

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

### -HTTP2MaxResetframesperMin
Maximum number of outgoing RST_STREAM frames allowed in HTTP/2 connection per minute.
Default value: 90 Minimum value = 1 Maximum value = 360000

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

### -HTTP2MaxRxresetframesperMin
Maximum number of incoming RST_STREAM frames allowed in HTTP/2 connection per minute.
Default value: 0 Minimum value = 0 Maximum value = 360000

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

### -HTTP2MaxSettingsFramesperMin
Maximum number of SETTINGS frames allowed in HTTP2 connection per minute.
Default value: 15 Minimum value = 1 Maximum value = 360000

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

### -HTTP2MinSeverConn
Minimum number of HTTP2 connections established to backend server, on receiving HTTP requests from client before multiplexing the streams into the available HTTP/2 connections.
Default value: 20 Minimum value = 1 Maximum value = 360000

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

### -HTTP2strictCipher
Choose whether to enable strict HTTP/2 cipher selection.
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

### -HTTP3
Choose whether to enable support for HTTP/3.
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

### -HTTP3MaxHeaderBlockedstreams
Maximum number of HTTP/3 streams that can be blocked while HTTP/3 headers are being decoded.
Default value: 100 Minimum value = 1 Maximum value = 500

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

### -HTTP3MaxHeaderFieldSectionsize
Maximum size of the HTTP/3 header field section, in bytes.
Default value: 24576 Minimum value = 8192 Maximum value = 131072

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

### -HTTP3MaxHeaderTablesize
Maximum size of the HTTP/3 QPACK dynamic header table, in bytes.
Default value: 4096 Minimum value = 0 Maximum value = 131072

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

### -HTTP3MinSeverConn
Minimum number of HTTP/3 connections established to backend server, on receiving HTTP requests from client before multiplexing the streams into the available HTTP/3 connections.
Default value: 20 Minimum value = 1 Maximum value = 360000

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

### -HTTP3WebTransPort
Choose whether to enable support for WebTransport over HTTP/3.
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

### -HTTPPipelinebuffsize
Application pipeline request buffering size, in bytes.
Default value: 131072 Minimum value = 131072 Maximum value = 20971520

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

### -Incomphdrdelay
Maximum time to wait, in milliseconds, between incomplete header packets.
If the header packets take longer to arrive at Citrix ADC, the connection is silently dropped.
Default value: 7000 Minimum value = 1 Maximum value = 360000

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

### -MarkConnReqinval
Mark CONNECT requests as invalid.
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

### -MarkHTTP09inval
Mark HTTP/0.9 requests as invalid.
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

### -MarkHTTPHeaderExtrawsError
Mark Http header with extra white space as invalid.
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

### -Markrfc7230noncompliantinval
Mark RFC7230 non-compliant transaction as invalid.
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

### -Marktracereqinval
Mark TRACE requests as invalid.
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

### -MaxDuplicateHeaderFieldS
Maximum number of allowed occurrences of header fields that share the same field name.
This threshold is enforced only for well-known header field names recognized by NetScaler.
If the value is set to 0, then it will be similar to previous behavior, Where we store only 15 duplicate headers and rest are parsed and send to the server.
Default value: 0 Minimum value = 0 Maximum value = 15

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

### -MaxHeaderFieldLen
Number of bytes allowed for header field for HTTP header.
If number of bytes exceeds beyond configured value, then request will be marked invalid.
Default value: 24820 Minimum value = 2048 Maximum value = 122880

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

### -MaxHeaderLen
Number of bytes to be queued to look for complete header before returning error.
If complete header is not obtained after queuing these many bytes, request will be marked as invalid and no L7 processing will be done for that TCP connection.
Default value: 24820 Minimum value = 2048 Maximum value = 122880

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

### -MaxReq
Maximum number of requests allowed on a single connection.
Zero implies no limit on the number of requests.
Default value: 0 Minimum value = 0 Maximum value = 65534

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

### -MaxReusepool
Maximum limit on the number of connections, from the Citrix ADC to a particular server that are kept in the reuse pool.
This setting is helpful for optimal memory utilization and for reducing the idle connections to the server just after the peak time.
Zero implies no limit on reuse pool size.
If non-zero value is given, it has to be greater than or equal to the number of running Packet Engines.
Default value: 0 Minimum value = 0 Maximum value = 360000

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

### -MinReusepool
Minimum limit on the number of connections, from the Citrix ADC to a particular server that are kept in the reuse pool.
This setting is helpful for optimal memory utilization and for reducing the idle connections to the server just after the peak time.
Zero implies no limit on reuse pool size.
Default value: 0 Minimum value = 0 Maximum value = 360000

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
Name for an HTTP profile.
Must begin with a letter, number, or the underscore \\(_\\) character.
Other characters allowed, after the first character, are the hyphen \\(-\\), period \\(.\\), hash \\(\#\\), space \\( \\), at \\(@\\), colon \\(:\\), and equal \\(=\\) characters.
The name of a HTTP profile cannot be changed after it is created.
CLI Users: If the name includes one or more spaces, enclose the name in double or single quotation marks \\(for example, "my http profile" or 'my http profile'\\).
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

### -PassProtocolUpgrade
Pass protocol upgrade request to the server.
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

### -Persistentetag
Generate the persistent Citrix ADC specific ETag for the HTTP response with ETag header.
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

### -ReqTimeout
Time, in seconds, within which the HTTP request must complete.
If the request does not complete within this time, the specified request timeout action is executed.
Zero disables the timeout.
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

### -ReqTimeoutAction
Action to take when the HTTP request does not complete within the specified request timeout duration.
You can configure the following actions: * RESET - Send RST (reset) to client when timeout occurs.
* DROP - Drop silently when timeout occurs.
* Custom responder action - Name of the responder action to trigger when timeout occurs, used to send custom message.

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

### -ReusepoolTimeout
Idle timeout (in seconds) for server connections in re-use pool.
Connections in the re-use pool are flushed, if they remain idle for the configured timeout.
Default value: 0 Minimum value = 0 Maximum value = 31536000

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

### -Rtsptunnel
Allow RTSP tunnel in HTTP.
Once application/x-rtsp-tunnelled is seen in Accept or Content-Type header, Citrix ADC does not process Layer 7 traffic on this connection.
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

### -WebLog
Enable or disable web logging.
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

### -WebSocket
HTTP connection to be upgraded to a web socket connection.
Once upgraded, Citrix ADC does not process Layer 7 traffic on this connection.
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

