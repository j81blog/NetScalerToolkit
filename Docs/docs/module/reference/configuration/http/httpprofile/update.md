# Invoke-NSUpdateHTTPProfile

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSUpdateHTTPProfile [-AdptTimeout <String>] [-AllowonlywordCharactersAndhyphen <String>] [-Altsvc <String>] [-Altsvcvalue <String>] [-ApdexcltResponseTimeThreshold <Int32>] [-ClientIphdrexpr <String>] [-CMPOnpush <String>] [-ConMultiPlex <String>] [-Dropextracrlf <String>] [-DropextraData <String>] [-Dropinvalreqs <String>] [-GrpcHoldlimit <Int32>] [-GrpcHoldTimeout <Int32>] [-GrpcLengthDelimitation <String>] [-HostHeaderValidation <String>] [-HTTP2 <String>] [-HTTP2altsvcframe <String>] [-HTTP2direct <String>] [-HTTP2extendedConnEct <String>] [-HTTP2HeaderTablesize <Int32>] [-HTTP2initialConnWindowsize <Int32>] [-HTTP2initialwindowsize <Int32>] [-HTTP2MaxConcurrentstreams <Int32>] [-HTTP2MaxEmptyframesperMin <Int32>] [-HTTP2MaxFramesize <Int32>] [-HTTP2MaxHeaderListsize <Int32>] [-HTTP2MaxPingframesperMin <Int32>] [-HTTP2MaxResetframesperMin <Int32>] [-HTTP2MaxRxresetframesperMin <Int32>] [-HTTP2MaxSettingsFramesperMin <Int32>] [-HTTP2MinSeverConn <Int32>] [-HTTP2strictCipher <String>] [-HTTP3 <String>] [-HTTP3MaxHeaderBlockedstreams <Int32>] [-HTTP3MaxHeaderFieldSectionsize <Int32>] [-HTTP3MaxHeaderTablesize <Int32>] [-HTTP3MinSeverConn <Int32>] [-HTTP3WebTransPort <String>] [-HTTPPipelinebuffsize <Int32>] [-Incomphdrdelay <Int32>] [-MarkConnReqinval <String>] [-MarkHTTP09inval <String>] [-MarkHTTPHeaderExtrawsError <String>] [-Markrfc7230noncompliantinval <String>] [-Marktracereqinval <String>] [-MaxDuplicateHeaderFieldS <Int32>] [-MaxHeaderFieldLen <Int32>] [-MaxHeaderLen <Int32>] [-MaxReq <Int32>] [-MaxReusepool <Int32>] [-MinReusepool <Int32>] -Name <String> [-PassProtocolUpgrade <String>] [-Persistentetag <String>] [-ReqTimeout <Int32>] [-ReqTimeoutAction <String>] [-ReusepoolTimeout <Int32>] [-Rtsptunnel <String>] [-WebLog <String>] [-WebSocket <String>] [-Session <PSObject>] [-IgnoreNotFound <SwitchParameter>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-PassThru <SwitchParameter>]
```

## Parameters

### -AdptTimeout

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -AllowonlywordCharactersAndhyphen

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Altsvc

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Altsvcvalue

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ApdexcltResponseTimeThreshold

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -ClientIphdrexpr

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CMPOnpush

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Confirm

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `cf`

### -ConMultiPlex

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dropextracrlf

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DropextraData

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dropinvalreqs

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -GrpcHoldlimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -GrpcHoldTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -GrpcLengthDelimitation

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HostHeaderValidation

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP2

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP2altsvcframe

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP2direct

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP2extendedConnEct

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP2HeaderTablesize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2initialConnWindowsize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2initialwindowsize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxConcurrentstreams

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxEmptyframesperMin

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxFramesize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxHeaderListsize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxPingframesperMin

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxResetframesperMin

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxRxresetframesperMin

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MaxSettingsFramesperMin

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2MinSeverConn

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP2strictCipher

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP3

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTP3MaxHeaderBlockedstreams

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP3MaxHeaderFieldSectionsize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP3MaxHeaderTablesize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP3MinSeverConn

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTTP3WebTransPort

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTTPPipelinebuffsize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -IgnoreNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Incomphdrdelay

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MarkConnReqinval

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MarkHTTP09inval

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MarkHTTPHeaderExtrawsError

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Markrfc7230noncompliantinval

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Marktracereqinval

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MaxDuplicateHeaderFieldS

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MaxHeaderFieldLen

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MaxHeaderLen

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MaxReq

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MaxReusepool

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MinReusepool

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Name

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -PassProtocolUpgrade

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Persistentetag

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ReqTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -ReqTimeoutAction

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ReturnNullOnNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -ReusepoolTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Rtsptunnel

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Session

- Type: `System.Management.Automation.PSObject`
- Required: `False`
- Pipeline input: `False`

### -ThrowOnWarning

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -WebLog

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -WebSocket

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -WhatIf

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `wi`

## Notes

This page was generated from exported PowerShell command metadata.

