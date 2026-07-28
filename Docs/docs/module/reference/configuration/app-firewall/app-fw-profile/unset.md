---
external help file: NetScalerToolkit-help.xml
Module Name: NetScalerToolkit
online version:
schema: 2.0.0
---

# Invoke-NSUnsetAppFwProfile

## SYNOPSIS
Clears one or more NetScaler appfwprofile resource properties.

## SYNTAX

```
Invoke-NSUnsetAppFwProfile [-Name] <String> [-AddCookieFlags] [-APISpec] [-AsProfBypassListEnable]
 [-AsProfDenyListEnable] [-BlockKeyWordAction] [-BufferoverflowAction] [-BufferoverflowMaxCookieLength]
 [-BufferoverflowMaxHeaderLength] [-BufferoverflowMaxQueryLength] [-BufferoverflowMaxTotalHeaderLength]
 [-BufferoverflowMaxURLLength] [-CanonicalizeHTMLResponse] [-Ceflogging] [-CheckRequestHeaderS]
 [-ClientIpexpression] [-CmdinjectionAction] [-Cmdinjectiongrammar] [-CmdinjectionType] [-Comment]
 [-ContentTypeAction] [-CookieConsistencyAction] [-CookieEncryption] [-CookieHijackingAction] [-CookieProxyIng]
 [-CookieSamesiteattribute] [-CookieTransFormS] [-Creditcard] [-CreditcardAction] [-CreditcardMaxAllowed]
 [-Creditcardxout] [-CrosssitescriptingAction] [-CrosssitescriptingcheckcompleteURLS]
 [-CrosssitescriptingtransFormUnsafeHTML] [-CsrftagAction] [-CustomSettings] [-Defaultcharset]
 [-DefaultFieldFormAtMaxLength] [-DefaultFieldFormAtMaxOccurrences] [-DefaultFieldFormAtMinLength]
 [-DefaultFieldFormAtType] [-DenyURLAction] [-Dosecurecreditcardlogging] [-DynamicLearning]
 [-EnableFormTagging] [-ErrorURL] [-ExcludeFileUploadfromchecks] [-ExemptclosureURLSfromsecuritychecks]
 [-FakeAccountDetection] [-FieldConsistencyAction] [-FieldFormAtAction] [-FieldScan] [-FieldScanlimit]
 [-FileUploadMaxNum] [-FileUploadTypeSAction] [-Geolocationlogging] [-GrpcAction] [-HTMLErrorObject]
 [-HTMLErrorStatuscode] [-HTMLErrorStatusMessage] [-InferContentTypeXMLPayloadAction]
 [-InsertCookieSamesiteattribute] [-InSpecTContentTypeS] [-InSpecTqueryContentTypeS] [-Invalidpercenthandling]
 [-JsonBlockKeyWordAction] [-JsonCmdinjectionAction] [-JsonCmdinjectiongrammar] [-JsonCmdinjectionType]
 [-JsonDosAction] [-JsonErrorObject] [-JsonErrorStatuscode] [-JsonErrorStatusMessage] [-JsonFieldScan]
 [-JsonFieldScanlimit] [-JsonMessageScan] [-JsonMessageScanlimit] [-JsonSqlinjectionAction]
 [-JsonSqlinjectiongrammar] [-JsonSqlinjectionType] [-JsonXssAction] [-LogeveryPolicyHit] [-MessageScan]
 [-MessageScanlimit] [-MessageScanlimitContentTypeS] [-MultiPleHeaderAction] [-Optimizepartialreqs]
 [-Percentdecoderecursively] [-Postbodylimit] [-PostbodylimitAction] [-PostbodylimitSignature]
 [-ProtoFileObject] [-RefererHeaderCheck] [-RequestContentType] [-ResponseContentType] [-RestAction]
 [-RfcProfile] [-SemicolonFieldSeparator] [-SessionCookieName] [-SessionlessFieldConsistency]
 [-SessionlessURLClosure] [-Signatures] [-SqlinjectionAction] [-Sqlinjectionchecksqlwildchars]
 [-Sqlinjectiongrammar] [-SqlinjectiononlycheckFieldSwithsqlchars] [-Sqlinjectionparsecomments]
 [-SqlinjectionruleType] [-SqlinjectiontransFormSpecIalchars] [-SqlinjectionType] [-StartURLAction]
 [-StartURLClosure] [-StreaMinG] [-Stripcomments] [-StripHTMLComments] [-StripXMLComments] [-Trace] [-Type]
 [-URLDecodeRequestCookieS] [-UseHTMLErrorObject] [-Verboseloglevel] [-XMLAttachmentAction] [-XMLDosAction]
 [-XMLErrorObject] [-XMLErrorStatuscode] [-XMLErrorStatusMessage] [-XMLFormAtAction] [-XMLSoapfaultAction]
 [-XMLSqlinjectionAction] [-XMLSqlinjectionchecksqlwildchars] [-XMLSqlinjectiononlycheckFieldSwithsqlchars]
 [-XMLSqlinjectionparsecomments] [-XMLSqlinjectionType] [-XMLValidationAction] [-XMLWsiAction] [-XMLXssAction]
 [-Session <PSObject>] [-IgnoreNotFound] [-ReturnNullOnNotFound] [-ThrowOnWarning] [-PassThru] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Configuration for application firewall profile resource.

## EXAMPLES

### EXAMPLE 1
```
Invoke-NSUnsetAppFwProfile -Name 'example' -AddCookieFlags none -PassThru
```

### EXAMPLE 2
```
Invoke-NSUnsetAppFwProfile -Name 'example' -AddCookieFlags none -WhatIf
```

## PARAMETERS

### -Name
Name for the profile.
Must begin with a letter, number, or the underscore character (_), and must contain only letters, numbers, and the hyphen (-), period (.), pound (#), space ( ), at (@), equals (=), colon (:), and underscore (_) characters.
Cannot be changed after the profile is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my profile" or 'my profile').
Minimum length = 1

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AddCookieFlags
Add the specified flags to cookies.
Available settings function as follows: * None - Do not add flags to cookies.
* HTTP Only - Add the HTTP Only flag to cookies, which prevents scripts from accessing cookies.
* Secure - Add Secure flag to cookies.
* All - Add both HTTPOnly and Secure flags to cookies.
Default value: none Possible values = none, httpOnly, secure, all

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

### -APISpec
Name of the API Specification.
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

### -AsProfBypassListEnable
Enable bypass list for the profile.
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

### -AsProfDenyListEnable
Enable deny list for the profile.
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

### -BlockKeyWordAction
Block Keyword action.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -blockKeywordAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -blockKeywordAction none".
Default value: none Possible values = none, block, log, stats

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

### -BufferoverflowAction
One or more Buffer Overflow actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -bufferOverflowAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -bufferOverflowAction none".
Possible values = none, block, log, stats

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

### -BufferoverflowMaxCookieLength
Maximum length, in characters, for cookies sent to your protected web sites.
Requests with longer cookies are blocked.
Default value: 4096 Minimum value = 0 Maximum value = 65535

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

### -BufferoverflowMaxHeaderLength
Maximum length, in characters, for HTTP headers in requests sent to your protected web sites.
Requests with longer headers are blocked.
Default value: 4096 Minimum value = 0 Maximum value = 65535

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

### -BufferoverflowMaxQueryLength
Maximum length, in bytes, for query string sent to your protected web sites.
Requests with longer query strings are blocked.
Default value: 65535 Minimum value = 0 Maximum value = 65535

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

### -BufferoverflowMaxTotalHeaderLength
Maximum length, in bytes, for the total HTTP header length in requests sent to your protected web sites.
The minimum value of this and maxHeaderLen in httpProfile will be used.
Requests with longer length are blocked.
Default value: 65535 Minimum value = 0 Maximum value = 65535

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

### -BufferoverflowMaxURLLength
Maximum length, in characters, for URLs on your protected web sites.
Requests with longer URLs are blocked.
Default value: 1024 Minimum value = 0 Maximum value = 65535

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

### -CanonicalizeHTMLResponse
Perform HTML entity encoding for any special characters in responses sent by your protected web sites.
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

### -Ceflogging
Enable CEF format logs for the profile.
Possible values = ON, OFF

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

### -CheckRequestHeaderS
Check request headers as well as web forms for injected SQL and cross-site scripts.
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

### -ClientIpexpression
Expression to get the client IP.

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

### -CmdinjectionAction
Command injection action.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -cmdInjectionAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -cmdInjectionAction none".
Default value: none Possible values = none, block, log, stats

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

### -Cmdinjectiongrammar
Check for CMD injection using CMD grammar.
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

### -CmdinjectionType
Available CMD injection types.
-CMDSplChar : Checks for CMD Special Chars -CMDKeyword : Checks for CMD Keywords -CMDSplCharANDKeyword : Checks for both and blocks if both are found -CMDSplCharORKeyword : Checks for both and blocks if anyone is found, -None : Disables checking using both CMD Special Char and Keyword.
Default value: CMDSplCharANDKeyword Possible values = CMDSplChar, CMDKeyword, CMDSplCharORKeyword, CMDSplCharANDKeyword, None

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

### -Comment
Any comments about the purpose of profile, or other useful information about the profile.

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

### -ContentTypeAction
One or more Content-type actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -contentTypeaction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -contentTypeaction none".
Possible values = none, block, learn, log, stats

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

### -CookieConsistencyAction
One or more Cookie Consistency actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -cookieConsistencyAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -cookieConsistencyAction none".
Default value: none Possible values = none, block, learn, log, stats

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

### -CookieEncryption
Type of cookie encryption.
Available settings function as follows: * None - Do not encrypt cookies.
* Decrypt Only - Decrypt encrypted cookies, but do not encrypt cookies.
* Encrypt Session Only - Encrypt session cookies, but not permanent cookies.
* Encrypt All - Encrypt all cookies.
Default value: none Possible values = none, decryptOnly, encryptSessionOnly, encryptAll

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

### -CookieHijackingAction
One or more actions to prevent cookie hijacking.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
NOTE: Cookie Hijacking feature is not supported for TLSv1.3 CLI users: To enable one or more actions, type "set appfw profile -cookieHijackingAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -cookieHijackingAction none".
Default value: none Possible values = none, block, log, stats

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

### -CookieProxyIng
Cookie proxy setting.
Available settings function as follows: * None - Do not proxy cookies.
* Session Only - Proxy session cookies by using the Citrix ADC session ID, but do not proxy permanent cookies.
Default value: none Possible values = none, sessionOnly

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

### -CookieSamesiteattribute
Cookie Samesite attribute added to support adding cookie SameSite attribute for all set-cookies including appfw session cookies.
Default value will be "SameSite=Lax".
Default value: LAX Possible values = None, LAX, STRICT

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

### -CookieTransFormS
Perform the specified type of cookie transformation.
Available settings function as follows: * Encryption - Encrypt cookies.
* Proxying - Mask contents of server cookies by sending proxy cookie to users.
* Cookie flags - Flag cookies as HTTP only to prevent scripts on user's browser from accessing and possibly modifying them.
CAUTION: Make sure that this parameter is set to ON if you are configuring any cookie transformations.
If it is set to OFF, no cookie transformations are performed regardless of any other settings.
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

### -Creditcard
Credit card types that the application firewall should protect.
Default value: none Possible values = none, visa, mastercard, discover, amex, jcb, dinersclub

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

### -CreditcardAction
One or more Credit Card actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -creditCardAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -creditCardAction none".
Default value: none Possible values = none, block, learn, log, stats

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

### -CreditcardMaxAllowed
This parameter value is used by the block action.
It represents the maximum number of credit card numbers that can appear on a web page served by your protected web sites.
Pages that contain more credit card numbers are blocked.
Minimum value = 0 Maximum value = 255

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

### -Creditcardxout
Mask any credit card number detected in a response by replacing each digit, except the digits in the final group, with the letter "X.".
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

### -CrosssitescriptingAction
One or more Cross-Site Scripting (XSS) actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -crossSiteScriptingAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -crossSiteScriptingAction none".
Possible values = none, block, learn, log, stats

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

### -CrosssitescriptingcheckcompleteURLS
Check complete URLs for cross-site scripts, instead of just the query portions of URLs.
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

### -CrosssitescriptingtransFormUnsafeHTML
Transform cross-site scripts.
This setting configures the application firewall to disable dangerous HTML instead of blocking the request.
CAUTION: Make sure that this parameter is set to ON if you are configuring any cross-site scripting transformations.
If it is set to OFF, no cross-site scripting transformations are performed regardless of any other settings.
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

### -CsrftagAction
One or more Cross-Site Request Forgery (CSRF) Tagging actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -CSRFTagAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -CSRFTagAction none".
Default value: none Possible values = none, block, learn, log, stats

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

### -CustomSettings
Object name for custom settings.
This check is applicable to Profile Type: HTML, XML.
. Minimum length = 1

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

### -Defaultcharset
Default character set for protected web pages.
Web pages sent by your protected web sites in response to user requests are assigned this character set if the page does not already specify a character set.
The character sets supported by the application firewall are: * iso-8859-1 (English US) * big5 (Chinese Traditional) * gb2312 (Chinese Simplified) * sjis (Japanese Shift-JIS) * euc-jp (Japanese EUC-JP) * iso-8859-9 (Turkish) * utf-8 (Unicode) * euc-kr (Korean).
Minimum length = 1 Maximum length = 31

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

### -DefaultFieldFormAtMaxLength
Maximum length, in characters, for data entered into a field that is assigned the default field type.
Default value: 65535 Minimum value = 1 Maximum value = 2147483647

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

### -DefaultFieldFormAtMaxOccurrences
Maxiumum allowed occurrences of the form field name in a request.
Default value: 65535 Minimum value = 0 Maximum value = 65535

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

### -DefaultFieldFormAtMinLength
Minimum length, in characters, for data entered into a field that is assigned the default field type.
To disable the minimum and maximum length settings and allow data of any length to be entered into the field, set this parameter to zero (0).
Default value: 0 Minimum value = 0 Maximum value = 2147483647

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

### -DefaultFieldFormAtType
Designate a default field type to be applied to web form fields that do not have a field type explicitly assigned to them.
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

### -DenyURLAction
One or more Deny URL actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
NOTE: The Deny URL check takes precedence over the Start URL check.
If you enable blocking for the Deny URL check, the application firewall blocks any URL that is explicitly blocked by a Deny URL, even if the same URL would otherwise be allowed by the Start URL check.
CLI users: To enable one or more actions, type "set appfw profile -denyURLaction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -denyURLaction none".
Possible values = none, block, log, stats

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

### -Dosecurecreditcardlogging
Setting this option logs credit card numbers in the response when the match is found.
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

### -DynamicLearning
One or more security checks.
Available options are as follows: * SQLInjection - Enable dynamic learning for SQLInjection security check.
* CrossSiteScripting - Enable dynamic learning for CrossSiteScripting security check.
* fieldFormat - Enable dynamic learning for fieldFormat security check.
* None - Disable security checks for all security checks.
CLI users: To enable dynamic learning on one or more security checks, type "set appfw profile -dynamicLearning" followed by the security checks to be enabled.
To turn off dynamic learning on all security checks, type "set appfw profile -dynamicLearning none".
Possible values = none, SQLInjection, CrossSiteScripting, fieldFormat, startURL, cookieConsistency, fieldConsistency, CSRFtag, ContentType

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

### -EnableFormTagging
Enable tagging of web form fields for use by the Form Field Consistency and CSRF Form Tagging checks.
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

### -ErrorURL
URL that application firewall uses as the Error URL.
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

### -ExcludeFileUploadfromchecks
Exclude uploaded files from Form checks.
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

### -ExemptclosureURLSfromsecuritychecks
Exempt URLs that pass the Start URL closure check from SQL injection, cross-site script, field format and field consistency security checks at locations other than headers.
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

### -FakeAccountDetection
Fake account detection flag : ON/OFF.
If set to ON fake account detection in enabled on ADC, if set to OFF fake account detection is disabled.
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

### -FieldConsistencyAction
One or more Form Field Consistency actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -fieldConsistencyaction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -fieldConsistencyAction none".
Default value: none Possible values = none, block, learn, log, stats

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

### -FieldFormAtAction
One or more Field Format actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of suggested web form fields and field format assignments.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -fieldFormatAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -fieldFormatAction none".
Possible values = none, block, learn, log, stats

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

### -FieldScan
Check if formfield limit scan is ON or OFF.
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

### -FieldScanlimit
Field scan limit value for HTML.
Default value: 2048 Minimum value = 0 Maximum value = 16384

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

### -FileUploadMaxNum
Maximum allowed number of file uploads per form-submission request.
The maximum setting (65535) allows an unlimited number of uploads.
Default value: 65535 Minimum value = 0 Maximum value = 65535

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

### -FileUploadTypeSAction
One or more file upload types actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -fileUploadTypeAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -fileUploadTypeAction none".
Possible values = none, block, log, stats

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

### -Geolocationlogging
Enable Geo-Location Logging in CEF format logs for the profile.
Possible values = ON, OFF

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

### -GrpcAction
gRPC validation.
Possible values = none, block, log, stats

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

### -HTMLErrorObject
Name to assign to the HTML Error Object.
Must begin with a letter, number, or the underscore character \\(_\\), and must contain only letters, numbers, and the hyphen \\(-\\), period \\(.\\) pound \\(\#\\), space \\( \\), at (@), equals \\(=\\), colon \\(:\\), and underscore characters.
Cannot be changed after the HTML error object is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks \\(for example, "my HTML error object" or 'my HTML error object'\\).
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

### -HTMLErrorStatuscode
Response status code associated with HTML error page.
Non-empty HTML error object must be imported to the application firewall profile for the status code.
Default value: 200 Minimum value = 1 Maximum value = 999

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

### -HTMLErrorStatusMessage
Response status message associated with HTML error page.

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

### -InferContentTypeXMLPayloadAction
One or more infer content type payload actions.
Available settings function as follows: * Block - Block connections that have mismatch in content-type header and payload.
* Log - Log connections that have mismatch in content-type header and payload.
The mismatched content-type in HTTP request header will be logged for the request.
* Stats - Generate statistics when there is mismatch in content-type header and payload.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -inferContentTypeXMLPayloadAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -inferContentTypeXMLPayloadAction none".
Please note "none" action cannot be used with any other action type.
Possible values = block, log, stats, none

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

### -InsertCookieSamesiteattribute
Configure whether application firewall should add samesite attribute for set-cookies.
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

### -InSpecTContentTypeS
One or more InspectContentType lists.
* application/x-www-form-urlencoded * multipart/form-data * text/x-gwt-rpc CLI users: To enable, type "set appfw profile -InspectContentTypes" followed by the content types to be inspected.
Possible values = none, application/x-www-form-urlencoded, multipart/form-data, text/x-gwt-rpc, application/grpc, application/grpc-web+json, application/grpc-web-text

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

### -InSpecTqueryContentTypeS
Inspect request query as well as web forms for injected SQL and cross-site scripts for following content types.
Possible values = HTML, XML, JSON, OTHER

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

### -Invalidpercenthandling
Configure the method that the application firewall uses to handle percent-encoded names and values.
Available settings function as follows: * asp_mode - Microsoft ASP format.
* secure_mode - Secure format.
Default value: secure_mode Possible values = asp_mode, secure_mode

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

### -JsonBlockKeyWordAction
JSON Block Keyword action.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -JSONBlockKeywordAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -JSONBlockKeywordAction none".
Default value: none Possible values = none, block, log, stats

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

### -JsonCmdinjectionAction
One or more JSON CMD Injection actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -JSONCMDInjectionAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -JSONCMDInjectionAction none".
Possible values = none, block, log, stats

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

### -JsonCmdinjectiongrammar
Check for CMD injection using CMD grammar in JSON.
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

### -JsonCmdinjectionType
Available CMD injection types.
-CMDSplChar : Checks for CMD Special Chars -CMDKeyword : Checks for CMD Keywords -CMDSplCharANDKeyword : Checks for both and blocks if both are found -CMDSplCharORKeyword : Checks for both and blocks if anyone is found, -None : Disables checking using both SQL Special Char and Keyword.
Default value: CMDSplCharANDKeyword Possible values = CMDSplChar, CMDKeyword, CMDSplCharORKeyword, CMDSplCharANDKeyword, None

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

### -JsonDosAction
One or more JSON Denial-of-Service (JsonDoS) actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -JSONDoSAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -JSONDoSAction none".
Possible values = none, block, log, stats

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

### -JsonErrorObject
Name to the imported JSON Error Object to be set on application firewall profile.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks \\(for example, "my JSON error object" or 'my JSON error object'\\).
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

### -JsonErrorStatuscode
Response status code associated with JSON error page.
Non-empty JSON error object must be imported to the application firewall profile for the status code.
Default value: 200 Minimum value = 1 Maximum value = 999

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

### -JsonErrorStatusMessage
Response status message associated with JSON error page.

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

### -JsonFieldScan
Check if JSON field limit scan is ON or OFF.
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

### -JsonFieldScanlimit
Field scan limit value for JSON.
Default value: 2048 Minimum value = 0 Maximum value = 16384

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

### -JsonMessageScan
Check if JSON message limit scan is ON or OFF.
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

### -JsonMessageScanlimit
Message scan limit value for JSON.
Default value: 1000000 Minimum value = 0 Maximum value = 8000000

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

### -JsonSqlinjectionAction
One or more JSON SQL Injection actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -JSONSQLInjectionAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -JSONSQLInjectionAction none".
Possible values = none, block, log, stats

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

### -JsonSqlinjectiongrammar
Check for SQL injection using SQL grammar in JSON.
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

### -JsonSqlinjectionType
Available SQL injection types.
-SQLSplChar : Checks for SQL Special Chars -SQLKeyword : Checks for SQL Keywords -SQLSplCharANDKeyword : Checks for both and blocks if both are found -SQLSplCharORKeyword : Checks for both and blocks if anyone is found, -None : Disables checking using both SQL Special Char and Keyword.
Default value: SQLSplCharANDKeyword Possible values = SQLSplChar, SQLKeyword, SQLSplCharORKeyword, SQLSplCharANDKeyword, None

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

### -JsonXssAction
One or more JSON Cross-Site Scripting actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -JSONXssAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -JSONXssAction none".
Possible values = none, block, log, stats

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

### -LogeveryPolicyHit
Log every profile match, regardless of security checks results.
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

### -MessageScan
Check if HTML message limit scan is ON or OFF.
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

### -MessageScanlimit
Message scan limit value for HTML.
Default value: 1000000 Minimum value = 0 Maximum value = 8000000

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

### -MessageScanlimitContentTypeS
Enable Message Scan Limit for following content types.
Default value: NONE Possible values = FORM-DATA, JSON, NONE

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

### -MultiPleHeaderAction
One or more multiple header actions.
Available settings function as follows: * Block - Block connections that have multiple headers.
* Log - Log connections that have multiple headers.
* KeepLast - Keep only last header when multiple headers are present.
Request headers inspected: * Accept-Encoding * Content-Encoding * Content-Range * Content-Type * Host * Range * Referer CLI users: To enable one or more actions, type "set appfw profile -multipleHeaderAction" followed by the actions to be enabled.
Possible values = block, keepLast, log, none

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

### -Optimizepartialreqs
Optimize handle of HTTP partial requests i.e.
those with range headers.
Available settings are as follows: * ON - Partial requests by the client result in partial requests to the backend server in most cases.
* OFF - Partial requests by the client are changed to full requests to the backend server.
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

### -Percentdecoderecursively
Configure whether the application firewall should use percentage recursive decoding.
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

### -Postbodylimit
Maximum allowed HTTP post body size, in bytes.
Maximum supported value is 10GB.
Citrix recommends enabling streaming option for large values of post body limit (\>20MB).
Default value: 20000000

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

### -PostbodylimitAction
One or more Post Body Limit actions.
Available settings function as follows: * Block - Block connections that violate this security check.
Must always be set.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
CLI users: To enable one or more actions, type "set appfw profile -PostBodyLimitAction block" followed by the other actions to be enabled.
Possible values = block, log, stats

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

### -PostbodylimitSignature
Maximum allowed HTTP post body size for signature inspection for location HTTP_POST_BODY in the signatures, in bytes.
Note that the changes in value could impact CPU and latency profile.
Default value: 2048

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

### -ProtoFileObject
Name of the imported proto file.
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

### -RefererHeaderCheck
Enable validation of Referer headers.
Referer validation ensures that a web form that a user sends to your web site originally came from your web site, not an outside attacker.
Although this parameter is part of the Start URL check, referer validation protects against cross-site request forgery (CSRF) attacks, not Start URL attacks.
Default value: OFF Possible values = OFF, if_present, AlwaysExceptStartURLs, AlwaysExceptFirstRequest

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

### -RequestContentType
Default Content-Type header for requests.
A Content-Type header can contain 0-255 letters, numbers, and the hyphen (-) and underscore (_) characters.
Minimum length = 1 Maximum length = 255

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

### -ResponseContentType
Default Content-Type header for responses.
A Content-Type header can contain 0-255 letters, numbers, and the hyphen (-) and underscore (_) characters.
Minimum length = 1 Maximum length = 255

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

### -RestAction
rest validation.
Possible values = none, block, log, stats

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

### -RfcProfile
Object name of the rfc profile.
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

### -SemicolonFieldSeparator
Allow ';' as a form field separator in URL queries and POST form bodies.
. Default value: OFF Possible values = ON, OFF

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

### -SessionCookieName
Name of the session cookie that the application firewall uses to track user sessions.
Must begin with a letter or number, and can consist of from 1 to 31 letters, numbers, and the hyphen (-) and underscore (_) symbols.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks (for example, "my cookie name" or 'my cookie name').
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

### -SessionlessFieldConsistency
Perform sessionless Field Consistency Checks.
Default value: OFF Possible values = OFF, ON, postOnly

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

### -SessionlessURLClosure
Enable session less URL Closure Checks.
This check is applicable to Profile Type: HTML.
. Default value: OFF Possible values = ON, OFF

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

### -Signatures
Object name for signatures.
This check is applicable to Profile Type: HTML, XML.
. Minimum length = 1

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

### -SqlinjectionAction
One or more HTML SQL Injection actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -SQLInjectionAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -SQLInjectionAction none".
Possible values = none, block, learn, log, stats

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

### -Sqlinjectionchecksqlwildchars
Check for form fields that contain SQL wild chars .
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

### -Sqlinjectiongrammar
Check for SQL injection using SQL grammar.
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

### -SqlinjectiononlycheckFieldSwithsqlchars
Check only form fields that contain SQL special strings (characters) for injected SQL code.
Most SQL servers require a special string to activate an SQL request, so SQL code without a special string is harmless to most SQL servers.
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

### -Sqlinjectionparsecomments
Parse HTML comments and exempt them from the HTML SQL Injection check.
You must specify the type of comments that the application firewall is to detect and exempt from this security check.
Available settings function as follows: * Check all - Check all content.
* ANSI - Exempt content that is part of an ANSI (Mozilla-style) comment.
* Nested - Exempt content that is part of a nested (Microsoft-style) comment.
* ANSI Nested - Exempt content that is part of any type of comment.
Possible values = checkall, ansi, nested, ansinested

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

### -SqlinjectionruleType
Specifies SQL Injection rule type: ALLOW/DENY.
If ALLOW rule type is configured then allow list rules are used, if DENY rule type is configured then deny rules are used.
Default value: ALLOW Possible values = ALLOW, DENY

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

### -SqlinjectiontransFormSpecIalchars
Transform injected SQL code.
This setting configures the application firewall to disable SQL special strings instead of blocking the request.
Since most SQL servers require a special string to activate an SQL keyword, in most cases a request that contains injected SQL code is safe if special strings are disabled.
CAUTION: Make sure that this parameter is set to ON if you are configuring any SQL injection transformations.
If it is set to OFF, no SQL injection transformations are performed regardless of any other settings.
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

### -SqlinjectionType
Available SQL injection types.
-SQLSplChar : Checks for SQL Special Chars -SQLKeyword : Checks for SQL Keywords -SQLSplCharANDKeyword : Checks for both and blocks if both are found -SQLSplCharORKeyword : Checks for both and blocks if anyone is found -None : Disables checking using both SQL Special Char and Keyword.
Default value: SQLSplCharANDKeyword Possible values = SQLSplChar, SQLKeyword, SQLSplCharORKeyword, SQLSplCharANDKeyword, None

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

### -StartURLAction
One or more Start URL actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -startURLaction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -startURLaction none".
Possible values = none, block, learn, log, stats

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

### -StartURLClosure
Toggle the state of Start URL Closure.
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

### -StreaMinG
Setting this option converts content-length form submission requests (requests with content-type "application/x-www-form-urlencoded" or "multipart/form-data") to chunked requests when atleast one of the following protections : Signatures, SQL injection protection, XSS protection, form field consistency protection, starturl closure, CSRF tagging, JSON SQL, JSON XSS, JSON DOS is enabled.
Please make sure that the backend server accepts chunked requests before enabling this option.
Citrix recommends enabling this option for large request sizes(\>20MB).
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

### -Stripcomments
Strip HTML comments.
This check is applicable to Profile Type: HTML.
. Default value: OFF Possible values = ON, OFF

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

### -StripHTMLComments
Strip HTML comments before forwarding a web page sent by a protected web site in response to a user request.
Default value: none Possible values = none, all, exclude_script_tag

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

### -StripXMLComments
Strip XML comments before forwarding a web page sent by a protected web site in response to a user request.
Default value: none Possible values = none, all

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

### -Trace
Toggle the state of trace.
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

### -Type
Application firewall profile type, which controls which security checks and settings are applied to content that is filtered with the profile.
Available settings function as follows: * HTML - HTML-based web sites.
* XML - XML-based web sites and services.
* JSON - JSON-based web sites and services.
* HTML XML (Web 2.0) - Sites that contain both HTML and XML content, such as ATOM feeds, blogs, and RSS feeds.
* HTML JSON - Sites that contain both HTML and JSON content.
* XML JSON - Sites that contain both XML and JSON content.
* HTML XML JSON - Sites that contain HTML, XML and JSON content.
Default value: HTML Possible values = HTML, XML, JSON

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

### -URLDecodeRequestCookieS
URL Decode request cookies before subjecting them to SQL and cross-site scripting checks.
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

### -UseHTMLErrorObject
Send an imported HTML Error object to a user when a request is blocked, instead of redirecting the user to the designated Error URL.
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

### -Verboseloglevel
Detailed Logging Verbose Log Level.
Default value: pattern Possible values = pattern, patternPayload, patternPayloadHeader

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

### -XMLAttachmentAction
One or more XML Attachment actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLAttachmentAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLAttachmentAction none".
Possible values = none, block, learn, log, stats

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

### -XMLDosAction
One or more XML Denial-of-Service (XDoS) actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLDoSAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLDoSAction none".
Possible values = none, block, learn, log, stats

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

### -XMLErrorObject
Name to assign to the XML Error Object, which the application firewall displays when a user request is blocked.
Must begin with a letter, number, or the underscore character \\(_\\), and must contain only letters, numbers, and the hyphen \\(-\\), period \\(.\\) pound \\(\#\\), space \\( \\), at (@), equals \\(=\\), colon \\(:\\), and underscore characters.
Cannot be changed after the XML error object is added.
The following requirement applies only to the Citrix ADC CLI: If the name includes one or more spaces, enclose the name in double or single quotation marks \\(for example, "my XML error object" or 'my XML error object'\\).
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

### -XMLErrorStatuscode
Response status code associated with XML error page.
Non-empty XML error object must be imported to the application firewall profile for the status code.
Default value: 200 Minimum value = 1 Maximum value = 999

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

### -XMLErrorStatusMessage
Response status message associated with XML error page.

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

### -XMLFormAtAction
One or more XML Format actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLFormatAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLFormatAction none".
Possible values = none, block, log, stats

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

### -XMLSoapfaultAction
One or more XML SOAP Fault Filtering actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
* Remove - Remove all violations for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLSOAPFaultAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLSOAPFaultAction none".
Possible values = none, block, log, remove, stats

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

### -XMLSqlinjectionAction
One or more XML SQL Injection actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLSQLInjectionAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLSQLInjectionAction none".
Possible values = none, block, log, stats

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

### -XMLSqlinjectionchecksqlwildchars
Check for form fields that contain SQL wild chars .
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

### -XMLSqlinjectiononlycheckFieldSwithsqlchars
Check only form fields that contain SQL special characters, which most SQL servers require before accepting an SQL command, for injected SQL.
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

### -XMLSqlinjectionparsecomments
Parse comments in XML Data and exempt those sections of the request that are from the XML SQL Injection check.
You must configure the type of comments that the application firewall is to detect and exempt from this security check.
Available settings function as follows: * Check all - Check all content.
* ANSI - Exempt content that is part of an ANSI (Mozilla-style) comment.
* Nested - Exempt content that is part of a nested (Microsoft-style) comment.
* ANSI Nested - Exempt content that is part of any type of comment.
Default value: checkall Possible values = checkall, ansi, nested, ansinested

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

### -XMLSqlinjectionType
Available SQL injection types.
-SQLSplChar : Checks for SQL Special Chars -SQLKeyword : Checks for SQL Keywords -SQLSplCharANDKeyword : Checks for both and blocks if both are found -SQLSplCharORKeyword : Checks for both and blocks if anyone is found.
Default value: SQLSplCharANDKeyword Possible values = SQLSplChar, SQLKeyword, SQLSplCharORKeyword, SQLSplCharANDKeyword, None

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

### -XMLValidationAction
One or more XML Validation actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLValidationAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLValidationAction none".
Possible values = none, block, log, stats

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

### -XMLWsiAction
One or more Web Services Interoperability (WSI) actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Learn - Use the learning engine to generate a list of exceptions to this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLWSIAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLWSIAction none".
Possible values = none, block, learn, log, stats

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

### -XMLXssAction
One or more XML Cross-Site Scripting actions.
Available settings function as follows: * Block - Block connections that violate this security check.
* Log - Log violations of this security check.
* Stats - Generate statistics for this security check.
* None - Disable all actions for this security check.
CLI users: To enable one or more actions, type "set appfw profile -XMLXSSAction" followed by the actions to be enabled.
To turn off all actions, type "set appfw profile -XMLXSSAction none".
Possible values = none, block, learn, log, stats

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

