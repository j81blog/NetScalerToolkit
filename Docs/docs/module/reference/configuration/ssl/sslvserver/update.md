# Invoke-NSUpdateSSLVServer

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSUpdateSSLVServer [-CipherRedirect <String>] [-CipherURL <String>] [-ClearTextPort <Int32>] [-ClientAuth <String>] [-ClientCert <String>] [-Defaultsni <String>] [-Dh <String>] [-Dhcount <Int32>] [-DheKeyExchangewithpsk <String>] [-DhFile <String>] [-DhKeyExpsizelimit <String>] [-Dtls1 <String>] [-Dtls12 <String>] [-DtlsProfileName <String>] [-Ersa <String>] [-Ersacount <Int32>] [-Hsts <String>] [-Includesubdomains <String>] [-MaxAge <Int32>] [-OCSPStapling <String>] [-Preload <String>] [-Pushenctrigger <String>] [-RedirectPortRewrite <String>] [-Sendclosenotify <String>] [-Sessreuse <String>] [-SessTimeout <Int32>] [-Snienable <String>] [-SSL2 <String>] [-SSL3 <String>] [-SSLClientLogs <String>] [-SSLProfile <String>] [-SSLRedirect <String>] [-SSLV2Redirect <String>] [-SSLV2URL <String>] [-Strictsigdigestcheck <String>] [-Tls1 <String>] [-Tls11 <String>] [-Tls12 <String>] [-Tls13 <String>] [-Tls13sessionticketsperauthconText <Int32>] -VServerName <String> [-ZerorttearlyData <String>] [-Session <PSObject>] [-IgnoreNotFound <SwitchParameter>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-PassThru <SwitchParameter>]
```

## Parameters

### -CipherRedirect

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CipherURL

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ClearTextPort

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -ClientAuth

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ClientCert

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Confirm

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `cf`

### -Defaultsni

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dh

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dhcount

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -DheKeyExchangewithpsk

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DhFile

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DhKeyExpsizelimit

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dtls1

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Dtls12

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DtlsProfileName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ersa

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ersacount

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Hsts

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -IgnoreNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Includesubdomains

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MaxAge

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -OCSPStapling

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Preload

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Pushenctrigger

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -RedirectPortRewrite

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ReturnNullOnNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Sendclosenotify

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Session

- Type: `System.Management.Automation.PSObject`
- Required: `False`
- Pipeline input: `False`

### -Sessreuse

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SessTimeout

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Snienable

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSL2

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSL3

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSLClientLogs

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSLProfile

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSLRedirect

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSLV2Redirect

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SSLV2URL

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Strictsigdigestcheck

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ThrowOnWarning

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Tls1

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Tls11

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Tls12

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Tls13

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Tls13sessionticketsperauthconText

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -VServerName

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -WhatIf

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `wi`

### -ZerorttearlyData

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

## Notes

This page was generated from exported PowerShell command metadata.

