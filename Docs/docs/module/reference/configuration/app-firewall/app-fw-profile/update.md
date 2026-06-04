# Invoke-NSUpdateAppFwProfile

Module area: `NetScalerToolkit`

## Synopsis

Generated command reference. Review the command syntax and parameter metadata before use.

## Syntax

```powershell
Invoke-NSUpdateAppFwProfile [-AddCookieFlags <String>] [-APISpec <String>] [-AsProfBypassListEnable <String>] [-AsProfDenyListEnable <String>] [-BlockKeyWordAction <String[]>] [-BufferoverflowAction <String[]>] [-BufferoverflowMaxCookieLength <Int32>] [-BufferoverflowMaxHeaderLength <Int32>] [-BufferoverflowMaxQueryLength <Int32>] [-BufferoverflowMaxTotalHeaderLength <Int32>] [-BufferoverflowMaxURLLength <Int32>] [-CanonicalizeHTMLResponse <String>] [-Ceflogging <String>] [-CheckRequestHeaderS <String>] [-ClientIpexpression <String>] [-CmdinjectionAction <String[]>] [-Cmdinjectiongrammar <String>] [-CmdinjectionType <String>] [-Comment <String>] [-ContentTypeAction <String[]>] [-CookieConsistencyAction <String[]>] [-CookieEncryption <String>] [-CookieHijackingAction <String[]>] [-CookieProxyIng <String>] [-CookieSamesiteattribute <String>] [-CookieTransFormS <String>] [-Creditcard <String[]>] [-CreditcardAction <String[]>] [-CreditcardMaxAllowed <Int32>] [-Creditcardxout <String>] [-CrosssitescriptingAction <String[]>] [-CrosssitescriptingcheckcompleteURLS <String>] [-CrosssitescriptingtransFormUnsafeHTML <String>] [-CsrftagAction <String[]>] [-CustomSettings <String>] [-Defaultcharset <String>] [-DefaultFieldFormAtMaxLength <Int32>] [-DefaultFieldFormAtMaxOccurrences <Int32>] [-DefaultFieldFormAtMinLength <Int32>] [-DefaultFieldFormAtType <String>] [-DenyURLAction <String[]>] [-Dosecurecreditcardlogging <String>] [-DynamicLearning <String[]>] [-EnableFormTagging <String>] [-ErrorURL <String>] [-ExcludeFileUploadfromchecks <String>] [-ExemptclosureURLSfromsecuritychecks <String>] [-FakeAccountDetection <String>] [-FieldConsistencyAction <String[]>] [-FieldFormAtAction <String[]>] [-FieldScan <String>] [-FieldScanlimit <Int32>] [-FileUploadMaxNum <Int32>] [-FileUploadTypeSAction <String[]>] [-Geolocationlogging <String>] [-GrpcAction <String[]>] [-HTMLErrorObject <String>] [-HTMLErrorStatuscode <Int32>] [-HTMLErrorStatusMessage <String>] [-InferContentTypeXMLPayloadAction <String[]>] [-InsertCookieSamesiteattribute <String>] [-InSpecTContentTypeS <String[]>] [-InSpecTqueryContentTypeS <String[]>] [-Invalidpercenthandling <String>] [-JsonBlockKeyWordAction <String[]>] [-JsonCmdinjectionAction <String[]>] [-JsonCmdinjectiongrammar <String>] [-JsonCmdinjectionType <String>] [-JsonDosAction <String[]>] [-JsonErrorObject <String>] [-JsonErrorStatuscode <Int32>] [-JsonErrorStatusMessage <String>] [-JsonFieldScan <String>] [-JsonFieldScanlimit <Int32>] [-JsonMessageScan <String>] [-JsonMessageScanlimit <Int32>] [-JsonSqlinjectionAction <String[]>] [-JsonSqlinjectiongrammar <String>] [-JsonSqlinjectionType <String>] [-JsonXssAction <String[]>] [-LogeveryPolicyHit <String>] [-MessageScan <String>] [-MessageScanlimit <Int32>] [-MessageScanlimitContentTypeS <String[]>] [-MultiPleHeaderAction <String[]>] -Name <String> [-Optimizepartialreqs <String>] [-Percentdecoderecursively <String>] [-Postbodylimit <Int32>] [-PostbodylimitAction <String[]>] [-PostbodylimitSignature <Int32>] [-ProtoFileObject <String>] [-RefererHeaderCheck <String>] [-RequestContentType <String>] [-ResponseContentType <String>] [-RestAction <String[]>] [-RfcProfile <String>] [-SemicolonFieldSeparator <String>] [-SessionCookieName <String>] [-SessionlessFieldConsistency <String>] [-SessionlessURLClosure <String>] [-Signatures <String>] [-SqlinjectionAction <String[]>] [-Sqlinjectionchecksqlwildchars <String>] [-Sqlinjectiongrammar <String>] [-SqlinjectiononlycheckFieldSwithsqlchars <String>] [-Sqlinjectionparsecomments <String>] [-SqlinjectionruleType <String>] [-SqlinjectiontransFormSpecIalchars <String>] [-SqlinjectionType <String>] [-StartURLAction <String[]>] [-StartURLClosure <String>] [-StreaMinG <String>] [-Stripcomments <String>] [-StripHTMLComments <String>] [-StripXMLComments <String>] [-Trace <String>] [-Type <String[]>] [-URLDecodeRequestCookieS <String>] [-UseHTMLErrorObject <String>] [-Verboseloglevel <String>] [-XMLAttachmentAction <String[]>] [-XMLDosAction <String[]>] [-XMLErrorObject <String>] [-XMLErrorStatuscode <Int32>] [-XMLErrorStatusMessage <String>] [-XMLFormAtAction <String[]>] [-XMLSoapfaultAction <String[]>] [-XMLSqlinjectionAction <String[]>] [-XMLSqlinjectionchecksqlwildchars <String>] [-XMLSqlinjectiononlycheckFieldSwithsqlchars <String>] [-XMLSqlinjectionparsecomments <String>] [-XMLSqlinjectionType <String>] [-XMLValidationAction <String[]>] [-XMLWsiAction <String[]>] [-XMLXssAction <String[]>] [-Session <PSObject>] [-IgnoreNotFound <SwitchParameter>] [-ReturnNullOnNotFound <SwitchParameter>] [-ThrowOnWarning <SwitchParameter>] [-PassThru <SwitchParameter>]
```

## Parameters

### -AddCookieFlags

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -APISpec

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -AsProfBypassListEnable

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -AsProfDenyListEnable

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -BlockKeyWordAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -BufferoverflowAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -BufferoverflowMaxCookieLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -BufferoverflowMaxHeaderLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -BufferoverflowMaxQueryLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -BufferoverflowMaxTotalHeaderLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -BufferoverflowMaxURLLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -CanonicalizeHTMLResponse

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Ceflogging

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CheckRequestHeaderS

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ClientIpexpression

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CmdinjectionAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Cmdinjectiongrammar

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CmdinjectionType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Comment

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Confirm

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `cf`

### -ContentTypeAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CookieConsistencyAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CookieEncryption

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CookieHijackingAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CookieProxyIng

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CookieSamesiteattribute

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CookieTransFormS

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Creditcard

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CreditcardAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CreditcardMaxAllowed

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -Creditcardxout

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CrosssitescriptingAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CrosssitescriptingcheckcompleteURLS

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CrosssitescriptingtransFormUnsafeHTML

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -CsrftagAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -CustomSettings

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Defaultcharset

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DefaultFieldFormAtMaxLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -DefaultFieldFormAtMaxOccurrences

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -DefaultFieldFormAtMinLength

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -DefaultFieldFormAtType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DenyURLAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Dosecurecreditcardlogging

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -DynamicLearning

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -EnableFormTagging

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ErrorURL

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ExcludeFileUploadfromchecks

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ExemptclosureURLSfromsecuritychecks

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -FakeAccountDetection

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -FieldConsistencyAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -FieldFormAtAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -FieldScan

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -FieldScanlimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -FileUploadMaxNum

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -FileUploadTypeSAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Geolocationlogging

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -GrpcAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -HTMLErrorObject

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -HTMLErrorStatuscode

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -HTMLErrorStatusMessage

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -IgnoreNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -InferContentTypeXMLPayloadAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -InsertCookieSamesiteattribute

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -InSpecTContentTypeS

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -InSpecTqueryContentTypeS

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Invalidpercenthandling

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonBlockKeyWordAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -JsonCmdinjectionAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -JsonCmdinjectiongrammar

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonCmdinjectionType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonDosAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -JsonErrorObject

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonErrorStatuscode

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -JsonErrorStatusMessage

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonFieldScan

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonFieldScanlimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -JsonMessageScan

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonMessageScanlimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -JsonSqlinjectionAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -JsonSqlinjectiongrammar

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonSqlinjectionType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -JsonXssAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -LogeveryPolicyHit

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MessageScan

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -MessageScanlimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -MessageScanlimitContentTypeS

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -MultiPleHeaderAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Name

- Type: `System.String`
- Required: `True`
- Pipeline input: `False`

### -Optimizepartialreqs

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -PassThru

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Percentdecoderecursively

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Postbodylimit

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -PostbodylimitAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -PostbodylimitSignature

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -ProtoFileObject

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -RefererHeaderCheck

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -RequestContentType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ResponseContentType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -RestAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -ReturnNullOnNotFound

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -RfcProfile

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SemicolonFieldSeparator

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Session

- Type: `System.Management.Automation.PSObject`
- Required: `False`
- Pipeline input: `False`

### -SessionCookieName

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SessionlessFieldConsistency

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SessionlessURLClosure

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Signatures

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SqlinjectionAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -Sqlinjectionchecksqlwildchars

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Sqlinjectiongrammar

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SqlinjectiononlycheckFieldSwithsqlchars

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Sqlinjectionparsecomments

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SqlinjectionruleType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SqlinjectiontransFormSpecIalchars

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -SqlinjectionType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -StartURLAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -StartURLClosure

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -StreaMinG

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Stripcomments

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -StripHTMLComments

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -StripXMLComments

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -ThrowOnWarning

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`

### -Trace

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Type

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -URLDecodeRequestCookieS

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -UseHTMLErrorObject

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -Verboseloglevel

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -WhatIf

- Type: `System.Management.Automation.SwitchParameter`
- Required: `False`
- Pipeline input: `False`
- Aliases: `wi`

### -XMLAttachmentAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLDosAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLErrorObject

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -XMLErrorStatuscode

- Type: `System.Int32`
- Required: `False`
- Pipeline input: `False`

### -XMLErrorStatusMessage

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -XMLFormAtAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLSoapfaultAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLSqlinjectionAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLSqlinjectionchecksqlwildchars

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -XMLSqlinjectiononlycheckFieldSwithsqlchars

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -XMLSqlinjectionparsecomments

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -XMLSqlinjectionType

- Type: `System.String`
- Required: `False`
- Pipeline input: `False`

### -XMLValidationAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLWsiAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

### -XMLXssAction

- Type: `System.String[]`
- Required: `False`
- Pipeline input: `False`

## Notes

This page was generated from exported PowerShell command metadata.

