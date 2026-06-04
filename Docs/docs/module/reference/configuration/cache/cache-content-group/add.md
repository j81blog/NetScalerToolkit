# Invoke-NSAddCacheContentGroup

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSAddCacheContentGroup [-Absexpiry <String[]>] [-Absexpirygmt <String[]>] [-Alwaysevalpolicies <String>] [-Cachecontrol <String>] [-Expireatlastbyte <String>] [-Flashcache <String>] [-Heurexpiryparam <Int32>] [-Hitparams <String[]>] [-Hitselector <String>] [-Ignoreparamvaluecase <String>] [-Ignorereloadreq <String>] [-Ignorereqcachinghdrs <String>] [-InsertAge <String>] [-InsertEtag <String>] [-InsertVia <String>] [-Invalparams <String[]>] [-InvalrestrictedtoHost <String>] [-Invalselector <String>] [-LazyDNSResolve <String>] [-MatchCookieS <String>] [-MaxRessize <Int32>] [-Memlimit <Int32>] [-MinHits <Int32>] [-MinRessize <Int32>] -Name <String> [-Persistha <String>] [-Pinned <String>] [-Polleverytime <String>] [-Prefetch <String>] [-PrefetchMaxPending <Int32>] [-Prefetchperiod <Int32>] [-Prefetchperiodmillisec <Int32>] [-QUICKabortsize <Int32>] [-Relexpiry <Int32>] [-Relexpirymillisec <Int32>] [-RemoveCookieS <String>] [-Type <String>] [-Weaknegrelexpiry <Int32>] [-Weakposrelexpiry <Int32>] [-Session <PSObject>] [-IgnoreNotFound <SwitchParameter>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-PassThru <SwitchParameter>]
```

## Parameters

### -Absexpiry

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Absexpirygmt

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Alwaysevalpolicies

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Cachecontrol

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Confirm

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `cf`

### -Expireatlastbyte

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Flashcache

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Heurexpiryparam

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Hitparams

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Hitselector

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -IgnoreNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Ignoreparamvaluecase

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ignorereloadreq

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ignorereqcachinghdrs

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -InsertAge

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -InsertEtag

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -InsertVia

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Invalparams

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -InvalrestrictedtoHost

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Invalselector

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -LazyDNSResolve

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MatchCookieS

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MaxRessize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Memlimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MinHits

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MinRessize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Name

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Persistha

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Pinned

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Polleverytime

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Prefetch

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -PrefetchMaxPending

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Prefetchperiod

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Prefetchperiodmillisec

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -QUICKabortsize

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Relexpiry

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Relexpirymillisec

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -RemoveCookieS

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ReturnNullOnNotFound

- Type: `System.Management.Automation.SwitchParameter`
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

### -Type

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Weaknegrelexpiry

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Weakposrelexpiry

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -WhatIf

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `wi`

## Notes

This page was generated from exported PowerShell command metadata.

