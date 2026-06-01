# Generated NetScalerToolkit Configuration bundle for category 'rdp'.

# region Invoke-NSAddRDPClientProfile
function Invoke-NSAddRDPClientProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler rdpclientprofile resource.
    .DESCRIPTION
        Configuration for RDP clientprofile resource.
    .PARAMETER AddUserNameInRDPFile
        Add username in rdp file. Default value: NO Possible values = YES, NO
    .PARAMETER AudiocaptureMode
        This setting corresponds to the selections in the Remote audio area on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER KeyBoardhook
        This setting corresponds to the selection in the Keyboard drop-down list on the Local Resources tab under Options in RDC. Default value: InFullScreenMode Possible values = OnLocal, OnRemote, InFullScreenMode
    .PARAMETER MultiMonItorsupPort
        Enable/Disable Multiple Monitor Support for Remote Desktop Connection (RDC). Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER Name
        The name of the rdp profile. Minimum length = 1
    .PARAMETER Psk
        Pre shared key value. Default value: 0
    .PARAMETER RandomizeRDPFileName
        Will generate unique filename everytime rdp file is downloaded by appending output of time() function in the format <rdpfileName>_<time>.rdp. This tries to avoid the pop-up for replacement of existing rdp file during each rdp connection launch, hence providing better end-user experience. Default value: NO Possible values = YES, NO
    .PARAMETER RDPCookieValidity
        RDP cookie validity period. RDP cookie validity time is applicable for new connection and also for any re-connection that might happen, mostly due to network disruption or during fail-over. Default value: 60 Minimum value = 1 Maximum value = 86400
    .PARAMETER RDPCustomParams
        Option for RDP custom parameters settings (if any). Custom params needs to be separated by '&'. Default value: 0 Minimum length = 1
    .PARAMETER RDPFileName
        RDP file name to be sent to End User. Minimum length = 1
    .PARAMETER RDPHost
        Fully-qualified domain name (FQDN) of the RDP Listener. Maximum length = 252
    .PARAMETER RDPLinkattribute
        Citrix Gateway allows the configuration of rdpLinkAttribute parameter which can be used to fetch a list of RDP servers(IP/FQDN) that a user can access, from an Authentication server attribute(Example: LDAP, SAML). Based on the list received, the RDP links will be generated and displayed to the user. Note: The Attribute mentioned in the rdpLinkAttribute should be fetched through corresponding authentication method.
    .PARAMETER RDPListenEr
        IP address (or) Fully-qualified domain name(FQDN) of the RDP Listener with the port in the format IP:Port (or) FQDN:Port. Maximum length = 255
    .PARAMETER RDPURLOverride
        This setting determines whether the RDP parameters supplied in the vpn url override those specified in the RDP profile. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER RDPValidateClientIp
        This setting determines whether RDC launch is initiated by the valid client IP. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectCLIPboard
        This setting corresponds to the Clipboard check box on the Local Resources tab under Options in RDC. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectComPortS
        This setting corresponds to the selections for comports under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectDrives
        This setting corresponds to the selections for Drives under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectPnpdevices
        This setting corresponds to the selections for pnpdevices under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectPrinters
        This setting corresponds to the selection in the Printers check box on the Local Resources tab under Options in RDC. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER VideoplaybackMode
        This setting determines if Remote Desktop Connection (RDC) will use RDP efficient multimedia streaming for video playback. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddRDPClientProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddRDPClientProfile -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $AddUserNameInRDPFile,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $AudiocaptureMode,

        [Parameter()]
        [ValidateSet('OnLocal', 'OnRemote', 'InFullScreenMode')]
        [string] $KeyBoardhook,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $MultiMonItorsupPort,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Psk,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $RandomizeRDPFileName,

        [Parameter()]
        [int] $RDPCookieValidity,

        [Parameter()]
        [string] $RDPCustomParams,

        [Parameter()]
        [string] $RDPFileName,

        [Parameter()]
        [string] $RDPHost,

        [Parameter()]
        [string] $RDPLinkattribute,

        [Parameter()]
        [string] $RDPListenEr,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RDPURLOverride,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RDPValidateClientIp,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectCLIPboard,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectComPortS,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectDrives,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectPnpdevices,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectPrinters,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $VideoplaybackMode,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AddUserNameInRDPFile')) { $properties['addusernameinrdpfile'] = $AddUserNameInRDPFile }
    if ($PSBoundParameters.ContainsKey('AudiocaptureMode')) { $properties['audiocapturemode'] = $AudiocaptureMode }
    if ($PSBoundParameters.ContainsKey('KeyBoardhook')) { $properties['keyboardhook'] = $KeyBoardhook }
    if ($PSBoundParameters.ContainsKey('MultiMonItorsupPort')) { $properties['multimonitorsupport'] = $MultiMonItorsupPort }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Psk')) { $properties['psk'] = $Psk }
    if ($PSBoundParameters.ContainsKey('RandomizeRDPFileName')) { $properties['randomizerdpfilename'] = $RandomizeRDPFileName }
    if ($PSBoundParameters.ContainsKey('RDPCookieValidity')) { $properties['rdpcookievalidity'] = $RDPCookieValidity }
    if ($PSBoundParameters.ContainsKey('RDPCustomParams')) { $properties['rdpcustomparams'] = $RDPCustomParams }
    if ($PSBoundParameters.ContainsKey('RDPFileName')) { $properties['rdpfilename'] = $RDPFileName }
    if ($PSBoundParameters.ContainsKey('RDPHost')) { $properties['rdphost'] = $RDPHost }
    if ($PSBoundParameters.ContainsKey('RDPLinkattribute')) { $properties['rdplinkattribute'] = $RDPLinkattribute }
    if ($PSBoundParameters.ContainsKey('RDPListenEr')) { $properties['rdplistener'] = $RDPListenEr }
    if ($PSBoundParameters.ContainsKey('RDPURLOverride')) { $properties['rdpurloverride'] = $RDPURLOverride }
    if ($PSBoundParameters.ContainsKey('RDPValidateClientIp')) { $properties['rdpvalidateclientip'] = $RDPValidateClientIp }
    if ($PSBoundParameters.ContainsKey('RedirectCLIPboard')) { $properties['redirectclipboard'] = $RedirectCLIPboard }
    if ($PSBoundParameters.ContainsKey('RedirectComPortS')) { $properties['redirectcomports'] = $RedirectComPortS }
    if ($PSBoundParameters.ContainsKey('RedirectDrives')) { $properties['redirectdrives'] = $RedirectDrives }
    if ($PSBoundParameters.ContainsKey('RedirectPnpdevices')) { $properties['redirectpnpdevices'] = $RedirectPnpdevices }
    if ($PSBoundParameters.ContainsKey('RedirectPrinters')) { $properties['redirectprinters'] = $RedirectPrinters }
    if ($PSBoundParameters.ContainsKey('VideoplaybackMode')) { $properties['videoplaybackmode'] = $VideoplaybackMode }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create rdpclientprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type rdpclientprofile -Payload @{ rdpclientprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetRDPClientProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddRDPClientProfile

# region Invoke-NSAddRDPServerProfile
function Invoke-NSAddRDPServerProfile {
    <#
    .SYNOPSIS
        Creates a NetScaler rdpserverprofile resource.
    .DESCRIPTION
        Configuration for RDP serverprofile resource.
    .PARAMETER Name
        The name of the rdp server profile. Minimum length = 1 Maximum length = 32
    .PARAMETER Psk
        Pre shared key value.
    .PARAMETER RDPIp
        IPv4 or IPv6 address of RDP listener. This terminates client RDP connections. Minimum length = 1
    .PARAMETER RDPPort
        TCP port on which the RDP connection is established. Default value: 3389 Minimum value = 1 Maximum value = 65535
    .PARAMETER RDPRedirectIon
        Enable/Disable RDP redirection support. This needs to be enabled in presence of connection broker or session directory with IP cookie(msts cookie) based redirection support. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSAddRDPServerProfile -Name 'example' -Psk 'example' -PassThru
    .EXAMPLE
        Invoke-NSAddRDPServerProfile -Name 'example' -Psk 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter(Mandatory)]
        [string] $Psk,

        [Parameter()]
        [string] $RDPIp,

        [Parameter()]
        [int] $RDPPort,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RDPRedirectIon,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Psk')) { $properties['psk'] = $Psk }
    if ($PSBoundParameters.ContainsKey('RDPIp')) { $properties['rdpip'] = $RDPIp }
    if ($PSBoundParameters.ContainsKey('RDPPort')) { $properties['rdpport'] = $RDPPort }
    if ($PSBoundParameters.ContainsKey('RDPRedirectIon')) { $properties['rdpredirection'] = $RDPRedirectIon }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Create rdpserverprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type rdpserverprofile -Payload @{ rdpserverprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetRDPServerProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSAddRDPServerProfile

# region Invoke-NSDeleteRDPClientProfile
function Invoke-NSDeleteRDPClientProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler rdpclientprofile resource.
    .DESCRIPTION
        Configuration for RDP clientprofile resource.
    .PARAMETER Name
        The name of the rdp profile. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteRDPClientProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetRDPClientProfile -Name 'rdpclientprofile_example' | Invoke-NSDeleteRDPClientProfile -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete rdpclientprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type rdpclientprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteRDPClientProfile

# region Invoke-NSDeleteRDPServerProfile
function Invoke-NSDeleteRDPServerProfile {
    <#
    .SYNOPSIS
        Removes a NetScaler rdpserverprofile resource.
    .DESCRIPTION
        Configuration for RDP serverprofile resource.
    .PARAMETER Name
        The name of the rdp server profile. Minimum length = 1 Maximum length = 32
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSDeleteRDPServerProfile -Name 'example' -Confirm:$false
    .EXAMPLE
        Invoke-NSGetRDPServerProfile -Name 'rdpserverprofile_example' | Invoke-NSDeleteRDPServerProfile -Confirm:$false
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        if ($PSCmdlet.ShouldProcess("$Name", 'Delete rdpserverprofile')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method DELETE -Task config -Type rdpserverprofile -Resource $Name -RawResponse
        }
    }
}
# endregion Invoke-NSDeleteRDPServerProfile

# region Invoke-NSGetRDPClientProfile
function Invoke-NSGetRDPClientProfile {
    <#
    .SYNOPSIS
        Gets NetScaler rdpclientprofile configuration.
    .DESCRIPTION
        Configuration for RDP clientprofile resource.
    .PARAMETER Name
        The name of the rdp profile. Minimum length = 1
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetRDPClientProfile
    .EXAMPLE
        Invoke-NSGetRDPClientProfile -Name 'rdpclientprofile_example'
    .EXAMPLE
        Invoke-NSGetRDPClientProfile -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'rdpclientprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Name
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRDPClientProfile

# region Invoke-NSGetRDPConnections
function Invoke-NSGetRDPConnections {
    <#
    .SYNOPSIS
        Gets NetScaler rdpconnections configuration.
    .DESCRIPTION
        Configuration for active rdp connections resource.
    .PARAMETER UserName
        User name for which to display connections. Minimum length = 1
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetRDPConnections
    .EXAMPLE
        Invoke-NSGetRDPConnections -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'All')]
        [string] $UserName,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        $argumentParts = @()
        if ($PSBoundParameters.ContainsKey('UserName')) {
            $argumentValue = $UserName
            if ($argumentValue -is [System.Management.Automation.SwitchParameter]) { $argumentValue = [bool] $argumentValue }
            if ($argumentValue -is [bool]) { $argumentValue = $argumentValue.ToString().ToLowerInvariant() }
            $argumentParts += 'username:' + $argumentValue
        }
        if ($argumentParts.Count -gt 0) {
            $query.args = $argumentParts -join ','
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'rdpconnections'
            Query = $query
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRDPConnections

# region Invoke-NSGetRDPServerProfile
function Invoke-NSGetRDPServerProfile {
    <#
    .SYNOPSIS
        Gets NetScaler rdpserverprofile configuration.
    .DESCRIPTION
        Configuration for RDP serverprofile resource.
    .PARAMETER Name
        The name of the rdp server profile. Minimum length = 1 Maximum length = 32
    .PARAMETER Filter
        NITRO filter values as a hashtable.
    .PARAMETER ViewSummary
        Requests the NITRO summary view.
    .PARAMETER Count
        Returns only the number of matching resources.
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSGetRDPServerProfile
    .EXAMPLE
        Invoke-NSGetRDPServerProfile -Name 'rdpserverprofile_example'
    .EXAMPLE
        Invoke-NSGetRDPServerProfile -Filter @{ servicetype = 'HTTP' }
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param(
        [Parameter(ParameterSetName = 'ByName', Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter(ParameterSetName = 'All')]
        [hashtable] $Filter,

        [Parameter(ParameterSetName = 'All')]
        [switch] $ViewSummary,

        [Parameter(ParameterSetName = 'Count')]
        [switch] $Count,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $query = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($Filter) {
            $query.filter = (($Filter.GetEnumerator() | Sort-Object Name | ForEach-Object { "{0}:{1}" -f $_.Key, $_.Value }) -join ',')
        }

        if ($ViewSummary) {
            $query.view = 'summary'
        }

        if ($Count) {
            $query.count = 'yes'
        }

        $request = @{
            Session = $Session
            Method = 'GET'
            Task = 'config'
            Type = 'rdpserverprofile'
            Query = $query
        }

        if ($PSCmdlet.ParameterSetName -eq 'ByName') {
            $request.Resource = $Name
        }

        foreach ($key in $transportParameters.Keys) {
            $request[$key] = $transportParameters[$key]
        }

        Invoke-NSRestRequest @request
    }
}
# endregion Invoke-NSGetRDPServerProfile

# region Invoke-NSKillRDPConnections
function Invoke-NSKillRDPConnections {
    <#
    .SYNOPSIS
        Invokes the kill operation for a NetScaler rdpconnections resource.
    .DESCRIPTION
        Configuration for active rdp connections resource.
    .PARAMETER All
        Terminate all active rdpconnections.
    .PARAMETER UserName
        User name for which to display connections. Minimum length = 1
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .EXAMPLE
        Invoke-NSKillRDPConnections 
    .EXAMPLE
        Invoke-NSKillRDPConnections  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [bool] $All,

        [Parameter()]
        [string] $UserName,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        if ($PSBoundParameters.ContainsKey('All')) { $body['all'] = $All }
        if ($PSBoundParameters.ContainsKey('UserName')) { $body['username'] = $UserName }

        if ($PSCmdlet.ShouldProcess('rdpconnections', 'Kill rdpconnections')) {
            Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type rdpconnections -Action kill -Payload @{ rdpconnections = $body } -RawResponse
        }
    }
}
# endregion Invoke-NSKillRDPConnections

# region Invoke-NSUnsetRDPClientProfile
function Invoke-NSUnsetRDPClientProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler rdpclientprofile resource properties.
    .DESCRIPTION
        Configuration for RDP clientprofile resource.
    .PARAMETER Name
        The name of the rdp profile. Minimum length = 1
    .PARAMETER AddUserNameInRDPFile
        Add username in rdp file. Default value: NO Possible values = YES, NO
    .PARAMETER AudiocaptureMode
        This setting corresponds to the selections in the Remote audio area on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER KeyBoardhook
        This setting corresponds to the selection in the Keyboard drop-down list on the Local Resources tab under Options in RDC. Default value: InFullScreenMode Possible values = OnLocal, OnRemote, InFullScreenMode
    .PARAMETER MultiMonItorsupPort
        Enable/Disable Multiple Monitor Support for Remote Desktop Connection (RDC). Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER Psk
        Pre shared key value. Default value: 0
    .PARAMETER RandomizeRDPFileName
        Will generate unique filename everytime rdp file is downloaded by appending output of time() function in the format <rdpfileName>_<time>.rdp. This tries to avoid the pop-up for replacement of existing rdp file during each rdp connection launch, hence providing better end-user experience. Default value: NO Possible values = YES, NO
    .PARAMETER RDPCookieValidity
        RDP cookie validity period. RDP cookie validity time is applicable for new connection and also for any re-connection that might happen, mostly due to network disruption or during fail-over. Default value: 60 Minimum value = 1 Maximum value = 86400
    .PARAMETER RDPCustomParams
        Option for RDP custom parameters settings (if any). Custom params needs to be separated by '&'. Default value: 0 Minimum length = 1
    .PARAMETER RDPFileName
        RDP file name to be sent to End User. Minimum length = 1
    .PARAMETER RDPHost
        Fully-qualified domain name (FQDN) of the RDP Listener. Maximum length = 252
    .PARAMETER RDPLinkattribute
        Citrix Gateway allows the configuration of rdpLinkAttribute parameter which can be used to fetch a list of RDP servers(IP/FQDN) that a user can access, from an Authentication server attribute(Example: LDAP, SAML). Based on the list received, the RDP links will be generated and displayed to the user. Note: The Attribute mentioned in the rdpLinkAttribute should be fetched through corresponding authentication method.
    .PARAMETER RDPListenEr
        IP address (or) Fully-qualified domain name(FQDN) of the RDP Listener with the port in the format IP:Port (or) FQDN:Port. Maximum length = 255
    .PARAMETER RDPURLOverride
        This setting determines whether the RDP parameters supplied in the vpn url override those specified in the RDP profile. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER RDPValidateClientIp
        This setting determines whether RDC launch is initiated by the valid client IP. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectCLIPboard
        This setting corresponds to the Clipboard check box on the Local Resources tab under Options in RDC. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectComPortS
        This setting corresponds to the selections for comports under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectDrives
        This setting corresponds to the selections for Drives under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectPnpdevices
        This setting corresponds to the selections for pnpdevices under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectPrinters
        This setting corresponds to the selection in the Printers check box on the Local Resources tab under Options in RDC. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER VideoplaybackMode
        This setting determines if Remote Desktop Connection (RDC) will use RDP efficient multimedia streaming for video playback. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetRDPClientProfile -Name 'example' -AddUserNameInRDPFile YES -PassThru
    .EXAMPLE
        Invoke-NSUnsetRDPClientProfile -Name 'example' -AddUserNameInRDPFile YES -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $AddUserNameInRDPFile,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $AudiocaptureMode,

        [Parameter()]
        [ValidateSet('OnLocal', 'OnRemote', 'InFullScreenMode')]
        [switch] $KeyBoardhook,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $MultiMonItorsupPort,

        [Parameter()]
        [switch] $Psk,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [switch] $RandomizeRDPFileName,

        [Parameter()]
        [switch] $RDPCookieValidity,

        [Parameter()]
        [switch] $RDPCustomParams,

        [Parameter()]
        [switch] $RDPFileName,

        [Parameter()]
        [switch] $RDPHost,

        [Parameter()]
        [switch] $RDPLinkattribute,

        [Parameter()]
        [switch] $RDPListenEr,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RDPURLOverride,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RDPValidateClientIp,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RedirectCLIPboard,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RedirectComPortS,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RedirectDrives,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RedirectPnpdevices,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RedirectPrinters,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $VideoplaybackMode,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('AddUserNameInRDPFile')) { $body['addusernameinrdpfile'] = $true }
        if ($PSBoundParameters.ContainsKey('AudiocaptureMode')) { $body['audiocapturemode'] = $true }
        if ($PSBoundParameters.ContainsKey('KeyBoardhook')) { $body['keyboardhook'] = $true }
        if ($PSBoundParameters.ContainsKey('MultiMonItorsupPort')) { $body['multimonitorsupport'] = $true }
        if ($PSBoundParameters.ContainsKey('Psk')) { $body['psk'] = $true }
        if ($PSBoundParameters.ContainsKey('RandomizeRDPFileName')) { $body['randomizerdpfilename'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPCookieValidity')) { $body['rdpcookievalidity'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPCustomParams')) { $body['rdpcustomparams'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPFileName')) { $body['rdpfilename'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPHost')) { $body['rdphost'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPLinkattribute')) { $body['rdplinkattribute'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPListenEr')) { $body['rdplistener'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPURLOverride')) { $body['rdpurloverride'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPValidateClientIp')) { $body['rdpvalidateclientip'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectCLIPboard')) { $body['redirectclipboard'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectComPortS')) { $body['redirectcomports'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectDrives')) { $body['redirectdrives'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectPnpdevices')) { $body['redirectpnpdevices'] = $true }
        if ($PSBoundParameters.ContainsKey('RedirectPrinters')) { $body['redirectprinters'] = $true }
        if ($PSBoundParameters.ContainsKey('VideoplaybackMode')) { $body['videoplaybackmode'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear rdpclientprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type rdpclientprofile -Action unset -Payload @{ rdpclientprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetRDPClientProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetRDPClientProfile

# region Invoke-NSUnsetRDPServerProfile
function Invoke-NSUnsetRDPServerProfile {
    <#
    .SYNOPSIS
        Clears one or more NetScaler rdpserverprofile resource properties.
    .DESCRIPTION
        Configuration for RDP serverprofile resource.
    .PARAMETER Name
        The name of the rdp server profile. Minimum length = 1 Maximum length = 32
    .PARAMETER Psk
        Pre shared key value.
    .PARAMETER RDPIp
        IPv4 or IPv6 address of RDP listener. This terminates client RDP connections. Minimum length = 1
    .PARAMETER RDPPort
        TCP port on which the RDP connection is established. Default value: 3389 Minimum value = 1 Maximum value = 65535
    .PARAMETER RDPRedirectIon
        Enable/Disable RDP redirection support. This needs to be enabled in presence of connection broker or session directory with IP cookie(msts cookie) based redirection support. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUnsetRDPServerProfile -Name 'example' -Psk  -PassThru
    .EXAMPLE
        Invoke-NSUnsetRDPServerProfile -Name 'example' -Psk  -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0, ValueFromPipelineByPropertyName)]
        [string] $Name,

        [Parameter()]
        [switch] $Psk,

        [Parameter()]
        [switch] $RDPIp,

        [Parameter()]
        [switch] $RDPPort,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [switch] $RDPRedirectIon,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    process {
        $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

        $transportParameters = @{}
        if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
        if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
        if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

        $body = @{ name = $Name }
        if ($PSBoundParameters.ContainsKey('Psk')) { $body['psk'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPIp')) { $body['rdpip'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPPort')) { $body['rdpport'] = $true }
        if ($PSBoundParameters.ContainsKey('RDPRedirectIon')) { $body['rdpredirection'] = $true }

        if ($body.Count -le 1) {
            throw 'Specify at least one property switch to clear.'
        }

        if ($PSCmdlet.ShouldProcess("$Name", 'Clear rdpserverprofile properties')) {
            $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method POST -Task config -Type rdpserverprofile -Action unset -Payload @{ rdpserverprofile = $body } -RawResponse

            if ($PassThru) {
                return Invoke-NSGetRDPServerProfile -Name $Name -Session $Session
            }

            return $response
        }
    }
}
# endregion Invoke-NSUnsetRDPServerProfile

# region Invoke-NSUpdateRDPClientProfile
function Invoke-NSUpdateRDPClientProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler rdpclientprofile resource.
    .DESCRIPTION
        Configuration for RDP clientprofile resource.
    .PARAMETER AddUserNameInRDPFile
        Add username in rdp file. Default value: NO Possible values = YES, NO
    .PARAMETER AudiocaptureMode
        This setting corresponds to the selections in the Remote audio area on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER KeyBoardhook
        This setting corresponds to the selection in the Keyboard drop-down list on the Local Resources tab under Options in RDC. Default value: InFullScreenMode Possible values = OnLocal, OnRemote, InFullScreenMode
    .PARAMETER MultiMonItorsupPort
        Enable/Disable Multiple Monitor Support for Remote Desktop Connection (RDC). Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER Name
        The name of the rdp profile. Minimum length = 1
    .PARAMETER Psk
        Pre shared key value. Default value: 0
    .PARAMETER RandomizeRDPFileName
        Will generate unique filename everytime rdp file is downloaded by appending output of time() function in the format <rdpfileName>_<time>.rdp. This tries to avoid the pop-up for replacement of existing rdp file during each rdp connection launch, hence providing better end-user experience. Default value: NO Possible values = YES, NO
    .PARAMETER RDPCookieValidity
        RDP cookie validity period. RDP cookie validity time is applicable for new connection and also for any re-connection that might happen, mostly due to network disruption or during fail-over. Default value: 60 Minimum value = 1 Maximum value = 86400
    .PARAMETER RDPCustomParams
        Option for RDP custom parameters settings (if any). Custom params needs to be separated by '&'. Default value: 0 Minimum length = 1
    .PARAMETER RDPFileName
        RDP file name to be sent to End User. Minimum length = 1
    .PARAMETER RDPHost
        Fully-qualified domain name (FQDN) of the RDP Listener. Maximum length = 252
    .PARAMETER RDPLinkattribute
        Citrix Gateway allows the configuration of rdpLinkAttribute parameter which can be used to fetch a list of RDP servers(IP/FQDN) that a user can access, from an Authentication server attribute(Example: LDAP, SAML). Based on the list received, the RDP links will be generated and displayed to the user. Note: The Attribute mentioned in the rdpLinkAttribute should be fetched through corresponding authentication method.
    .PARAMETER RDPListenEr
        IP address (or) Fully-qualified domain name(FQDN) of the RDP Listener with the port in the format IP:Port (or) FQDN:Port. Maximum length = 255
    .PARAMETER RDPURLOverride
        This setting determines whether the RDP parameters supplied in the vpn url override those specified in the RDP profile. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER RDPValidateClientIp
        This setting determines whether RDC launch is initiated by the valid client IP. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectCLIPboard
        This setting corresponds to the Clipboard check box on the Local Resources tab under Options in RDC. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectComPortS
        This setting corresponds to the selections for comports under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectDrives
        This setting corresponds to the selections for Drives under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectPnpdevices
        This setting corresponds to the selections for pnpdevices under More on the Local Resources tab under Options in RDC. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER RedirectPrinters
        This setting corresponds to the selection in the Printers check box on the Local Resources tab under Options in RDC. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER VideoplaybackMode
        This setting determines if Remote Desktop Connection (RDC) will use RDP efficient multimedia streaming for video playback. Default value: ENABLE Possible values = ENABLE, DISABLE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateRDPClientProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateRDPClientProfile -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $AddUserNameInRDPFile,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $AudiocaptureMode,

        [Parameter()]
        [ValidateSet('OnLocal', 'OnRemote', 'InFullScreenMode')]
        [string] $KeyBoardhook,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $MultiMonItorsupPort,

        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Psk,

        [Parameter()]
        [ValidateSet('YES', 'NO')]
        [string] $RandomizeRDPFileName,

        [Parameter()]
        [int] $RDPCookieValidity,

        [Parameter()]
        [string] $RDPCustomParams,

        [Parameter()]
        [string] $RDPFileName,

        [Parameter()]
        [string] $RDPHost,

        [Parameter()]
        [string] $RDPLinkattribute,

        [Parameter()]
        [string] $RDPListenEr,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RDPURLOverride,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RDPValidateClientIp,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectCLIPboard,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectComPortS,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectDrives,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectPnpdevices,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RedirectPrinters,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $VideoplaybackMode,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('AddUserNameInRDPFile')) { $properties['addusernameinrdpfile'] = $AddUserNameInRDPFile }
    if ($PSBoundParameters.ContainsKey('AudiocaptureMode')) { $properties['audiocapturemode'] = $AudiocaptureMode }
    if ($PSBoundParameters.ContainsKey('KeyBoardhook')) { $properties['keyboardhook'] = $KeyBoardhook }
    if ($PSBoundParameters.ContainsKey('MultiMonItorsupPort')) { $properties['multimonitorsupport'] = $MultiMonItorsupPort }
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Psk')) { $properties['psk'] = $Psk }
    if ($PSBoundParameters.ContainsKey('RandomizeRDPFileName')) { $properties['randomizerdpfilename'] = $RandomizeRDPFileName }
    if ($PSBoundParameters.ContainsKey('RDPCookieValidity')) { $properties['rdpcookievalidity'] = $RDPCookieValidity }
    if ($PSBoundParameters.ContainsKey('RDPCustomParams')) { $properties['rdpcustomparams'] = $RDPCustomParams }
    if ($PSBoundParameters.ContainsKey('RDPFileName')) { $properties['rdpfilename'] = $RDPFileName }
    if ($PSBoundParameters.ContainsKey('RDPHost')) { $properties['rdphost'] = $RDPHost }
    if ($PSBoundParameters.ContainsKey('RDPLinkattribute')) { $properties['rdplinkattribute'] = $RDPLinkattribute }
    if ($PSBoundParameters.ContainsKey('RDPListenEr')) { $properties['rdplistener'] = $RDPListenEr }
    if ($PSBoundParameters.ContainsKey('RDPURLOverride')) { $properties['rdpurloverride'] = $RDPURLOverride }
    if ($PSBoundParameters.ContainsKey('RDPValidateClientIp')) { $properties['rdpvalidateclientip'] = $RDPValidateClientIp }
    if ($PSBoundParameters.ContainsKey('RedirectCLIPboard')) { $properties['redirectclipboard'] = $RedirectCLIPboard }
    if ($PSBoundParameters.ContainsKey('RedirectComPortS')) { $properties['redirectcomports'] = $RedirectComPortS }
    if ($PSBoundParameters.ContainsKey('RedirectDrives')) { $properties['redirectdrives'] = $RedirectDrives }
    if ($PSBoundParameters.ContainsKey('RedirectPnpdevices')) { $properties['redirectpnpdevices'] = $RedirectPnpdevices }
    if ($PSBoundParameters.ContainsKey('RedirectPrinters')) { $properties['redirectprinters'] = $RedirectPrinters }
    if ($PSBoundParameters.ContainsKey('VideoplaybackMode')) { $properties['videoplaybackmode'] = $VideoplaybackMode }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update rdpclientprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type rdpclientprofile -Payload @{ rdpclientprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetRDPClientProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateRDPClientProfile

# region Invoke-NSUpdateRDPServerProfile
function Invoke-NSUpdateRDPServerProfile {
    <#
    .SYNOPSIS
        Updates a NetScaler rdpserverprofile resource.
    .DESCRIPTION
        Configuration for RDP serverprofile resource.
    .PARAMETER Name
        The name of the rdp server profile. Minimum length = 1 Maximum length = 32
    .PARAMETER Psk
        Pre shared key value.
    .PARAMETER RDPIp
        IPv4 or IPv6 address of RDP listener. This terminates client RDP connections. Minimum length = 1
    .PARAMETER RDPPort
        TCP port on which the RDP connection is established. Default value: 3389 Minimum value = 1 Maximum value = 65535
    .PARAMETER RDPRedirectIon
        Enable/Disable RDP redirection support. This needs to be enabled in presence of connection broker or session directory with IP cookie(msts cookie) based redirection support. Default value: DISABLE Possible values = ENABLE, DISABLE
    .PARAMETER Session
        The NetScaler session. If omitted, the current default session is used.
    .PARAMETER IgnoreNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ReturnNullOnNotFound
        Returns null instead of throwing for known NITRO not-found responses.
    .PARAMETER ThrowOnWarning
        Treats NITRO warning responses as terminating errors.
    .PARAMETER PassThru
        Returns the updated resource after the operation completes.
    .EXAMPLE
        Invoke-NSUpdateRDPServerProfile -Name 'example' -PassThru
    .EXAMPLE
        Invoke-NSUpdateRDPServerProfile -Name 'example' -WhatIf
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Generated from NetScaler NITRO API metadata.
        Generated: 2026-06-01 21:28
        Supported metadata versions: 13.1, 14.1.
    #>
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory, Position = 0)]
        [string] $Name,

        [Parameter()]
        [string] $Psk,

        [Parameter()]
        [string] $RDPIp,

        [Parameter()]
        [int] $RDPPort,

        [Parameter()]
        [ValidateSet('ENABLE', 'DISABLE')]
        [string] $RDPRedirectIon,

        [Parameter()]
        [psobject] $Session = (Get-NSSession),

        [Parameter()]
        [switch] $IgnoreNotFound,

        [Parameter()]
        [switch] $ReturnNullOnNotFound,

        [Parameter()]
        [switch] $ThrowOnWarning,

        [Parameter()]
        [switch] $PassThru
    )

    $metadataVersion = Resolve-NSMetadataVersion -Session $Session -SupportedVersion @('13.1', '14.1')

    $transportParameters = @{}
    if ($PSBoundParameters.ContainsKey('IgnoreNotFound')) { $transportParameters.IgnoreNotFound = $IgnoreNotFound }
    if ($PSBoundParameters.ContainsKey('ReturnNullOnNotFound')) { $transportParameters.ReturnNullOnNotFound = $ReturnNullOnNotFound }
    if ($PSBoundParameters.ContainsKey('ThrowOnWarning')) { $transportParameters.ThrowOnWarning = $ThrowOnWarning }

    $properties = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    if ($PSBoundParameters.ContainsKey('Name')) { $properties['name'] = $Name }
    if ($PSBoundParameters.ContainsKey('Psk')) { $properties['psk'] = $Psk }
    if ($PSBoundParameters.ContainsKey('RDPIp')) { $properties['rdpip'] = $RDPIp }
    if ($PSBoundParameters.ContainsKey('RDPPort')) { $properties['rdpport'] = $RDPPort }
    if ($PSBoundParameters.ContainsKey('RDPRedirectIon')) { $properties['rdpredirection'] = $RDPRedirectIon }

    $body = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
    foreach ($key in $properties.Keys) {
        if ($null -ne $properties[$key] -and (-not ($properties[$key] -is [string]) -or $properties[$key] -ne '')) {
            $body[$key] = $properties[$key]
        }
    }

    if ($PSCmdlet.ShouldProcess("$Name", 'Update rdpserverprofile')) {
        $response = Invoke-NSRestRequest @transportParameters -Session $Session -Method PUT -Task config -Type rdpserverprofile -Payload @{ rdpserverprofile = $body } -RawResponse

        if ($PassThru) {
            return Invoke-NSGetRDPServerProfile -Name $Name -Session $Session
        }

        return $response
    }
}
# endregion Invoke-NSUpdateRDPServerProfile

# SIG # Begin signature block
# MIImdwYJKoZIhvcNAQcCoIImaDCCJmQCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD+HKSSI9EukSvv
# dpdJ4MGfPf+5PSRE4CukEqFQgRn0dqCCIAowggYUMIID/KADAgECAhB6I67aU2mW
# D5HIPlz0x+M/MA0GCSqGSIb3DQEBDAUAMFcxCzAJBgNVBAYTAkdCMRgwFgYDVQQK
# Ew9TZWN0aWdvIExpbWl0ZWQxLjAsBgNVBAMTJVNlY3RpZ28gUHVibGljIFRpbWUg
# U3RhbXBpbmcgUm9vdCBSNDYwHhcNMjEwMzIyMDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSwwKgYD
# VQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNjCCAaIwDQYJ
# KoZIhvcNAQEBBQADggGPADCCAYoCggGBAM2Y2ENBq26CK+z2M34mNOSJjNPvIhKA
# VD7vJq+MDoGD46IiM+b83+3ecLvBhStSVjeYXIjfa3ajoW3cS3ElcJzkyZlBnwDE
# JuHlzpbN4kMH2qRBVrjrGJgSlzzUqcGQBaCxpectRGhhnOSwcjPMI3G0hedv2eNm
# GiUbD12OeORN0ADzdpsQ4dDi6M4YhoGE9cbY11XxM2AVZn0GiOUC9+XE0wI7CQKf
# OUfigLDn7i/WeyxZ43XLj5GVo7LDBExSLnh+va8WxTlA+uBvq1KO8RSHUQLgzb1g
# bL9Ihgzxmkdp2ZWNuLc+XyEmJNbD2OIIq/fWlwBp6KNL19zpHsODLIsgZ+WZ1AzC
# s1HEK6VWrxmnKyJJg2Lv23DlEdZlQSGdF+z+Gyn9/CRezKe7WNyxRf4e4bwUtrYE
# 2F5Q+05yDD68clwnweckKtxRaF0VzN/w76kOLIaFVhf5sMM/caEZLtOYqYadtn03
# 4ykSFaZuIBU9uCSrKRKTPJhWvXk4CllgrwIDAQABo4IBXDCCAVgwHwYDVR0jBBgw
# FoAU9ndq3T/9ARP/FqFsggIv0Ao9FCUwHQYDVR0OBBYEFF9Y7UwxeqJhQo1SgLqz
# YZcZojKbMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGg
# P6A9hjtodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNUaW1lU3Rh
# bXBpbmdSb290UjQ2LmNybDB8BggrBgEFBQcBAQRwMG4wRwYIKwYBBQUHMAKGO2h0
# dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY1RpbWVTdGFtcGluZ1Jv
# b3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAN
# BgkqhkiG9w0BAQwFAAOCAgEAEtd7IK0ONVgMnoEdJVj9TC1ndK/HYiYh9lVUacah
# RoZ2W2hfiEOyQExnHk1jkvpIJzAMxmEc6ZvIyHI5UkPCbXKspioYMdbOnBWQUn73
# 3qMooBfIghpR/klUqNxx6/fDXqY0hSU1OSkkSivt51UlmJElUICZYBodzD3M/SFj
# eCP59anwxs6hwj1mfvzG+b1coYGnqsSz2wSKr+nDO+Db8qNcTbJZRAiSazr7KyUJ
# Go1c+MScGfG5QHV+bps8BX5Oyv9Ct36Y4Il6ajTqV2ifikkVtB3RNBUgwu/mSiSU
# ice/Jp/q8BMk/gN8+0rNIE+QqU63JoVMCMPY2752LmESsRVVoypJVt8/N3qQ1c6F
# ibbcRabo3azZkcIdWGVSAdoLgAIxEKBeNh9AQO1gQrnh1TA8ldXuJzPSuALOz1Uj
# b0PCyNVkWk7hkhVHfcvBfI8NtgWQupiaAeNHe0pWSGH2opXZYKYG4Lbukg7HpNi/
# KqJhue2Keak6qH9A8CeEOB7Eob0Zf+fU+CCQaL0cJqlmnx9HCDxF+3BLbUufrV64
# EbTI40zqegPZdA+sXCmbcZy6okx/SjwsusWRItFA3DE8MORZeFb6BmzBtqKJ7l93
# 9bbKBy2jvxcJI98Va95Q5JnlKor3m0E7xpMeYRriWklUPsetMSf2NvUQa/E5vVye
# fQIwggZFMIIELaADAgECAhAIMk+dt9qRb2Pk8qM8Xl1RMA0GCSqGSIb3DQEBCwUA
# MFYxCzAJBgNVBAYTAlBMMSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMu
# QS4xJDAiBgNVBAMTG0NlcnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQTAeFw0yNDA0
# MDQxNDA0MjRaFw0yNzA0MDQxNDA0MjNaMGsxCzAJBgNVBAYTAk5MMRIwEAYDVQQH
# DAlTY2hpam5kZWwxIzAhBgNVBAoMGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5
# MSMwIQYDVQQDDBpKb2huIEJpbGxla2VucyBDb25zdWx0YW5jeTCCAaIwDQYJKoZI
# hvcNAQEBBQADggGPADCCAYoCggGBAMslntDbSQwHZXwFhmibivbnd0Qfn6sqe/6f
# os3pKzKxEsR907RkDMet2x6RRg3eJkiIr3TFPwqBooyXXgK3zxxpyhGOcuIqyM9J
# 28DVf4kUyZHsjGO/8HFjrr3K1hABNUszP0o7H3o6J31eqV1UmCXYhQlNoW9FOmRC
# 1amlquBmh7w4EKYEytqdmdOBavAD5Xq4vLPxNP6kyA+B2YTtk/xM27TghtbwFGKn
# u9Vwnm7dFcpLxans4ONt2OxDQOMA5NwgcUv/YTpjhq9qoz6ivG55NRJGNvUXsM3w
# 2o7dR6Xh4MuEGrTSrOWGg2A5EcLH1XqQtkF5cZnAPM8W/9HUp8ggornWnFVQ9/6M
# ga+ermy5wy5XrmQpN+x3u6tit7xlHk1Hc+4XY4a4ie3BPXG2PhJhmZAn4ebNSBwN
# Hh8z7WTT9X9OFERepGSytZVeEP7hgyptSLcuhpwWeR4QdBb7dV++4p3PsAUQVHFp
# wkSbrRTv4EiJ0Lcz9P1HPGFoHiFAQQIDAQABo4IBeDCCAXQwDAYDVR0TAQH/BAIw
# ADA9BgNVHR8ENjA0MDKgMKAuhixodHRwOi8vY2NzY2EyMDIxLmNybC5jZXJ0dW0u
# cGwvY2NzY2EyMDIxLmNybDBzBggrBgEFBQcBAQRnMGUwLAYIKwYBBQUHMAGGIGh0
# dHA6Ly9jY3NjYTIwMjEub2NzcC1jZXJ0dW0uY29tMDUGCCsGAQUFBzAChilodHRw
# Oi8vcmVwb3NpdG9yeS5jZXJ0dW0ucGwvY2NzY2EyMDIxLmNlcjAfBgNVHSMEGDAW
# gBTddF1MANt7n6B0yrFu9zzAMsBwzTAdBgNVHQ4EFgQUO6KtBpOBgmrlANVAnyiQ
# C6W6lJwwSwYDVR0gBEQwQjAIBgZngQwBBAEwNgYLKoRoAYb2dwIFAQQwJzAlBggr
# BgEFBQcCARYZaHR0cHM6Ly93d3cuY2VydHVtLnBsL0NQUzATBgNVHSUEDDAKBggr
# BgEFBQcDAzAOBgNVHQ8BAf8EBAMCB4AwDQYJKoZIhvcNAQELBQADggIBAEQsN8wg
# PMdWVkwHPPTN+jKpdns5AKVFjcn00psf2NGVVgWWNQBIQc9lEuTBWb54IK6Ga3hx
# QRZfnPNo5HGl73YLmFgdFQrFzZ1lnaMdIcyh8LTWv6+XNWfoyCM9wCp4zMIDPOs8
# LKSMQqA/wRgqiACWnOS4a6fyd5GUIAm4CuaptpFYr90l4Dn/wAdXOdY32UhgzmSu
# xpUbhD8gVJUaBNVmQaRqeU8y49MxiVrUKJXde1BCrtR9awXbqembc7Nqvmi60tYK
# lD27hlpKtj6eGPjkht0hHEsgzU0Fxw7ZJghYG2wXfpF2ziN893ak9Mi/1dmCNmor
# GOnybKYfT6ff6YTCDDNkod4egcMZdOSv+/Qv+HAeIgEvrxE9QsGlzTwbRtbm6gwY
# YcVBs/SsVUdBn/TSB35MMxRhHE5iC3aUTkDbceo/XP3uFhVL4g2JZHpFfCSu2TQr
# rzRn2sn07jfMvzeHArCOJgBW1gPqR3WrJ4hUxL06Rbg1gs9tU5HGGz9KNQMfQFQ7
# 0Wz7UIhezGcFcRfkIfSkMmQYYpsc7rfzj+z0ThfDVzzJr2dMOFsMlfj1T6l22GBq
# 9XQx0A4lcc5Fl9pRxbOuHHWFqIBD/BCEhwniOCySzqENd2N+oz8znKooSISStnkN
# aYXt6xblJF2dx9Dn89FK7d1IquNxOwt0tI5dMIIGYjCCBMqgAwIBAgIRAKQpO24e
# 3denNAiHrXpOtyQwDQYJKoZIhvcNAQEMBQAwVTELMAkGA1UEBhMCR0IxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEsMCoGA1UEAxMjU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBDQSBSMzYwHhcNMjUwMzI3MDAwMDAwWhcNMzYwMzIxMjM1OTU5
# WjByMQswCQYDVQQGEwJHQjEXMBUGA1UECBMOV2VzdCBZb3Jrc2hpcmUxGDAWBgNV
# BAoTD1NlY3RpZ28gTGltaXRlZDEwMC4GA1UEAxMnU2VjdGlnbyBQdWJsaWMgVGlt
# ZSBTdGFtcGluZyBTaWduZXIgUjM2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
# CgKCAgEA04SV9G6kU3jyPRBLeBIHPNyUgVNnYayfsGOyYEXrn3+SkDYTLs1crcw/
# ol2swE1TzB2aR/5JIjKNf75QBha2Ddj+4NEPKDxHEd4dEn7RTWMcTIfm492TW22I
# 8LfH+A7Ehz0/safc6BbsNBzjHTt7FngNfhfJoYOrkugSaT8F0IzUh6VUwoHdYDpi
# ln9dh0n0m545d5A5tJD92iFAIbKHQWGbCQNYplqpAFasHBn77OqW37P9BhOASdmj
# p3IijYiFdcA0WQIe60vzvrk0HG+iVcwVZjz+t5OcXGTcxqOAzk1frDNZ1aw8nFhG
# EvG0ktJQknnJZE3D40GofV7O8WzgaAnZmoUn4PCpvH36vD4XaAF2CjiPsJWiY/j2
# xLsJuqx3JtuI4akH0MmGzlBUylhXvdNVXcjAuIEcEQKtOBR9lU4wXQpISrbOT8ux
# +96GzBq8TdbhoFcmYaOBZKlwPP7pOp5Mzx/UMhyBA93PQhiCdPfIVOCINsUY4U23
# p4KJ3F1HqP3H6Slw3lHACnLilGETXRg5X/Fp8G8qlG5Y+M49ZEGUp2bneRLZoyHT
# yynHvFISpefhBCV0KdRZHPcuSL5OAGWnBjAlRtHvsMBrI3AAA0Tu1oGvPa/4yeei
# Ayu+9y3SLC98gDVbySnXnkujjhIh+oaatsk/oyf5R2vcxHahajMCAwEAAaOCAY4w
# ggGKMB8GA1UdIwQYMBaAFF9Y7UwxeqJhQo1SgLqzYZcZojKbMB0GA1UdDgQWBBSI
# YYyhKjdkgShgoZsx0Iz9LALOTzAOBgNVHQ8BAf8EBAMCBsAwDAYDVR0TAQH/BAIw
# ADAWBgNVHSUBAf8EDDAKBggrBgEFBQcDCDBKBgNVHSAEQzBBMDUGDCsGAQQBsjEB
# AgEDCDAlMCMGCCsGAQUFBwIBFhdodHRwczovL3NlY3RpZ28uY29tL0NQUzAIBgZn
# gQwBBAIwSgYDVR0fBEMwQTA/oD2gO4Y5aHR0cDovL2NybC5zZWN0aWdvLmNvbS9T
# ZWN0aWdvUHVibGljVGltZVN0YW1waW5nQ0FSMzYuY3JsMHoGCCsGAQUFBwEBBG4w
# bDBFBggrBgEFBQcwAoY5aHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUHVi
# bGljVGltZVN0YW1waW5nQ0FSMzYuY3J0MCMGCCsGAQUFBzABhhdodHRwOi8vb2Nz
# cC5zZWN0aWdvLmNvbTANBgkqhkiG9w0BAQwFAAOCAYEAAoE+pIZyUSH5ZakuPVKK
# 4eWbzEsTRJOEjbIu6r7vmzXXLpJx4FyGmcqnFZoa1dzx3JrUCrdG5b//LfAxOGy9
# Ph9JtrYChJaVHrusDh9NgYwiGDOhyyJ2zRy3+kdqhwtUlLCdNjFjakTSE+hkC9F5
# ty1uxOoQ2ZkfI5WM4WXA3ZHcNHB4V42zi7Jk3ktEnkSdViVxM6rduXW0jmmiu71Z
# pBFZDh7Kdens+PQXPgMqvzodgQJEkxaION5XRCoBxAwWwiMm2thPDuZTzWp/gUFz
# i7izCmEt4pE3Kf0MOt3ccgwn4Kl2FIcQaV55nkjv1gODcHcD9+ZVjYZoyKTVWb4V
# qMQy/j8Q3aaYd/jOQ66Fhk3NWbg2tYl5jhQCuIsE55Vg4N0DUbEWvXJxtxQQaVR5
# xzhEI+BjJKzh3TQ026JxHhr2fuJ0mV68AluFr9qshgwS5SpN5FFtaSEnAwqZv3IS
# +mlG50rK7W3qXbWwi4hmpylUfygtYLEdLQukNEX1jiOKMIIGgjCCBGqgAwIBAgIQ
# NsKwvXwbOuejs902y8l1aDANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMx
# EzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYD
# VQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBS
# U0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMjEwMzIyMDAwMDAwWhcNMzgw
# MTE4MjM1OTU5WjBXMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1p
# dGVkMS4wLAYDVQQDEyVTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIFJvb3Qg
# UjQ2MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAiJ3YuUVnnR3d6Lkm
# gZpUVMB8SQWbzFoVD9mUEES0QUCBdxSZqdTkdizICFNeINCSJS+lV1ipnW5ihkQy
# C0cRLWXUJzodqpnMRs46npiJPHrfLBOifjfhpdXJ2aHHsPHggGsCi7uE0awqKggE
# /LkYw3sqaBia67h/3awoqNvGqiFRJ+OTWYmUCO2GAXsePHi+/JUNAax3kpqstbl3
# vcTdOGhtKShvZIvjwulRH87rbukNyHGWX5tNK/WABKf+Gnoi4cmisS7oSimgHUI0
# Wn/4elNd40BFdSZ1EwpuddZ+Wr7+Dfo0lcHflm/FDDrOJ3rWqauUP8hsokDoI7D/
# yUVI9DAE/WK3Jl3C4LKwIpn1mNzMyptRwsXKrop06m7NUNHdlTDEMovXAIDGAvYy
# nPt5lutv8lZeI5w3MOlCybAZDpK3Dy1MKo+6aEtE9vtiTMzz/o2dYfdP0KWZwZIX
# bYsTIlg1YIetCpi5s14qiXOpRsKqFKqav9R1R5vj3NgevsAsvxsAnI8Oa5s2oy25
# qhsoBIGo/zi6GpxFj+mOdh35Xn91y72J4RGOJEoqzEIbW3q0b2iPuWLA911cRxgY
# 5SJYubvjay3nSMbBPPFsyl6mY4/WYucmyS9lo3l7jk27MAe145GWxK4O3m3gEFEI
# kv7kRmefDR7Oe2T1HxAnICQvr9sCAwEAAaOCARYwggESMB8GA1UdIwQYMBaAFFN5
# v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBT2d2rdP/0BE/8WoWyCAi/QCj0U
# JTAOBgNVHQ8BAf8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zATBgNVHSUEDDAKBggr
# BgEFBQcDCDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0
# cDovL2NybC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25B
# dXRob3JpdHkuY3JsMDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDov
# L29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEADr5lQe1oRLjl
# ocXUEYfktzsljOt+2sgXke3Y8UPEooU5y39rAARaAdAxUeiX1ktLJ3+lgxtoLQhn
# 5cFb3GF2SSZRX8ptQ6IvuD3wz/LNHKpQ5nX8hjsDLRhsyeIiJsms9yAWnvdYOdEM
# q1W61KE9JlBkB20XBee6JaXx4UBErc+YuoSb1SxVf7nkNtUjPfcxuFtrQdRMRi/f
# InV/AobE8Gw/8yBMQKKaHt5eia8ybT8Y/Ffa6HAJyz9gvEOcF1VWXG8OMeM7Vy7B
# s6mSIkYeYtddU1ux1dQLbEGur18ut97wgGwDiGinCwKPyFO7ApcmVJOtlw9FVJxw
# /mL1TbyBns4zOgkaXFnnfzg4qbSvnrwyj1NiurMp4pmAWjR+Pb/SIduPnmFzbSN/
# G8reZCL4fvGlvPFk4Uab/JVCSmj59+/mB2Gn6G/UYOy8k60mKcmaAZsEVkhOFuoj
# 4we8CYyaR9vd9PGZKSinaZIkvVjbH/3nlLb0a7SBIkiRzfPfS9T+JesylbHa1LtR
# V9U/7m0q7Ma2CQ/t392ioOssXW7oKLdOmMBl14suVFBmbzrt5V5cQPnwtd3UOTpS
# 9oCG+ZZheiIvPgkDmA8FzPsnfXW5qHELB43ET7HHFHeRPRYrMBKjkb8/IN7Po0d0
# hQoF4TeMM+zYAJzoKQnVKOLg8pZVPT8wgga5MIIEoaADAgECAhEAmaOACiZVO2Wr
# 3G6EprPqOTANBgkqhkiG9w0BAQwFADCBgDELMAkGA1UEBhMCUEwxIjAgBgNVBAoT
# GVVuaXpldG8gVGVjaG5vbG9naWVzIFMuQS4xJzAlBgNVBAsTHkNlcnR1bSBDZXJ0
# aWZpY2F0aW9uIEF1dGhvcml0eTEkMCIGA1UEAxMbQ2VydHVtIFRydXN0ZWQgTmV0
# d29yayBDQSAyMB4XDTIxMDUxOTA1MzIxOFoXDTM2MDUxODA1MzIxOFowVjELMAkG
# A1UEBhMCUEwxITAfBgNVBAoTGEFzc2VjbyBEYXRhIFN5c3RlbXMgUy5BLjEkMCIG
# A1UEAxMbQ2VydHVtIENvZGUgU2lnbmluZyAyMDIxIENBMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEAnSPPBDAjO8FGLOczcz5jXXp1ur5cTbq96y34vuTm
# flN4mSAfgLKTvggv24/rWiVGzGxT9YEASVMw1Aj8ewTS4IndU8s7VS5+djSoMcbv
# IKck6+hI1shsylP4JyLvmxwLHtSworV9wmjhNd627h27a8RdrT1PH9ud0IF+njvM
# k2xqbNTIPsnWtw3E7DmDoUmDQiYi/ucJ42fcHqBkbbxYDB7SYOouu9Tj1yHIohzu
# C8KNqfcYf7Z4/iZgkBJ+UFNDcc6zokZ2uJIxWgPWXMEmhu1gMXgv8aGUsRdaCtVD
# 2bSlbfsq7BiqljjaCun+RJgTgFRCtsuAEw0pG9+FA+yQN9n/kZtMLK+Wo837Q4QO
# ZgYqVWQ4x6cM7/G0yswg1ElLlJj6NYKLw9EcBXE7TF3HybZtYvj9lDV2nT8mFSkc
# SkAExzd4prHwYjUXTeZIlVXqj+eaYqoMTpMrfh5MCAOIG5knN4Q/JHuurfTI5XDY
# O962WZayx7ACFf5ydJpoEowSP07YaBiQ8nXpDkNrUA9g7qf/rCkKbWpQ5boufUnq
# 1UiYPIAHlezf4muJqxqIns/kqld6JVX8cixbd6PzkDpwZo4SlADaCi2JSplKShBS
# ND36E/ENVv8urPS0yOnpG4tIoBGxVCARPCg1BnyMJ4rBJAcOSnAWd18Jx5n858JS
# qPECAwEAAaOCAVUwggFRMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFN10XUwA
# 23ufoHTKsW73PMAywHDNMB8GA1UdIwQYMBaAFLahVDkCw6A/joq8+tT4HKbROg79
# MA4GA1UdDwEB/wQEAwIBBjATBgNVHSUEDDAKBggrBgEFBQcDAzAwBgNVHR8EKTAn
# MCWgI6Ahhh9odHRwOi8vY3JsLmNlcnR1bS5wbC9jdG5jYTIuY3JsMGwGCCsGAQUF
# BwEBBGAwXjAoBggrBgEFBQcwAYYcaHR0cDovL3N1YmNhLm9jc3AtY2VydHVtLmNv
# bTAyBggrBgEFBQcwAoYmaHR0cDovL3JlcG9zaXRvcnkuY2VydHVtLnBsL2N0bmNh
# Mi5jZXIwOQYDVR0gBDIwMDAuBgRVHSAAMCYwJAYIKwYBBQUHAgEWGGh0dHA6Ly93
# d3cuY2VydHVtLnBsL0NQUzANBgkqhkiG9w0BAQwFAAOCAgEAdYhYD+WPUCiaU58Q
# 7EP89DttyZqGYn2XRDhJkL6P+/T0IPZyxfxiXumYlARMgwRzLRUStJl490L94C9L
# GF3vjzzH8Jq3iR74BRlkO18J3zIdmCKQa5LyZ48IfICJTZVJeChDUyuQy6rGDxLU
# UAsO0eqeLNhLVsgw6/zOfImNlARKn1FP7o0fTbj8ipNGxHBIutiRsWrhWM2f8pXd
# d3x2mbJCKKtl2s42g9KUJHEIiLni9ByoqIUul4GblLQigO0ugh7bWRLDm0CdY9rN
# LqyA3ahe8WlxVWkxyrQLjH8ItI17RdySaYayX3PhRSC4Am1/7mATwZWwSD+B7eMc
# ZNhpn8zJ+6MTyE6YoEBSRVrs0zFFIHUR08Wk0ikSf+lIe5Iv6RY3/bFAEloMU+vU
# BfSouCReZwSLo8WdrDlPXtR0gicDnytO7eZ5827NS2x7gCBibESYkOh1/w1tVxTp
# V2Na3PR7nxYVlPu1JPoRZCbH86gc96UTvuWiOruWmyOEMLOGGniR+x+zPF/2DaGg
# K2W1eEJfo2qyrBNPvF7wuAyQfiFXLwvWHamoYtPZo0LHuH8X3n9C+xN4YaNjt2yw
# zOr+tKyEVAotnyU9vyEVOaIYMk3IeBrmFnn0gbKeTTyYeEEUz/Qwt4HOUBCrW602
# NCmvO1nm+/80nLy5r0AZvCQxaQ4xggXDMIIFvwIBATBqMFYxCzAJBgNVBAYTAlBM
# MSEwHwYDVQQKExhBc3NlY28gRGF0YSBTeXN0ZW1zIFMuQS4xJDAiBgNVBAMTG0Nl
# cnR1bSBDb2RlIFNpZ25pbmcgMjAyMSBDQQIQCDJPnbfakW9j5PKjPF5dUTANBglg
# hkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
# MC8GCSqGSIb3DQEJBDEiBCCxGl1yOVvIs1uxyA+uIHiV7pCHj691rIRe5SMvF7o/
# wjANBgkqhkiG9w0BAQEFAASCAYCCjsP9VYZq43PTESgAyXW/00ZMZ7jGmAnQjh0D
# j6m6QTLlJhPcSyZR9/BL6bB/mBolSVVYr4jBabY41Hr7BorEaIw92habduFw/9wq
# bwrTq+/gqDDs5+ajtZS+zpQnuSw/hspg07gUf8dG4JSNOgwQ6izL3u/WaHH4OWBm
# cPtWTg+yey2EIWxZ5gGCj4Xwp8TMPwnj3ZScW+d+WZ+NImDc2Nd6202XDBdewv3o
# 8Gqp6eov47EKkq/BZpY3doIKo2hZBhmZuV75vZ1fC9Se4r4OzzmmsBz9RvZG1z4j
# sDOr3ucNMuZJI73Hpyvw0a+h/rJuMRQ/No+MX99T/3IQIzDK9UGyQA1c0ONXRcHv
# sNW8LlkrLLvBRa0LuMHR7TuvoM3hGa3w+PXLwVHlFx4E6mg8q0/omZKJcxJr2s8d
# hPogEYrgkf0Cog/sKiay9VMDFnYDgNi33baowOiUMv/b/nSF0MYV5EaDuy0rI3Gd
# lEK2hkwnpACmCDz5GcPynxIW7NGhggMjMIIDHwYJKoZIhvcNAQkGMYIDEDCCAwwC
# AQEwajBVMQswCQYDVQQGEwJHQjEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMSww
# KgYDVQQDEyNTZWN0aWdvIFB1YmxpYyBUaW1lIFN0YW1waW5nIENBIFIzNgIRAKQp
# O24e3denNAiHrXpOtyQwDQYJYIZIAWUDBAICBQCgeTAYBgkqhkiG9w0BCQMxCwYJ
# KoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA2MDExOTU2MTdaMD8GCSqGSIb3
# DQEJBDEyBDBwpV8QSz7squM32PqKLA36+2Taoga+jWNaAFWzozzpTU7HbgHAWVez
# Sa79je7ltgcwDQYJKoZIhvcNAQEBBQAEggIAtmW71V5d85MFbeP5/nj26HGMk6rp
# eoSSP93lQ9k4NwHXKnMvsN9qe4SvAejA7/7JlPn2nQz4qowna6lb8GPCX2IdiWUA
# hQ6h1XNCAcH4bQ+MNaJMS7Rtsqxb7Gk2NVSpc5Tt6iB8jIpC+tboaLLvh6tXksl3
# qlNAAVrx5aAYSysf8FQhiVxDUNZEJPNfCRzu5x1CmaYI+jhhon9aXgPNnKuEemCC
# onuObqXs2QgglpDRvhv2vgpVRSKLC/vMZYTvYieY+IuMrQR8iIchf1nApUrwgBQ5
# xnIyh+fEJGWpO+ZqIbTQha2QFyKooFufDFFF08H86741X1097ASIKP43qrv3qYiB
# d6yLhmbe0jOzVfDBjLgHXc3FCJVGoJufo7pnRWiOnwho3TcVsxeGquKl/mpcAJ2+
# BSelfaaWDVEcaQyMjD56O1PuRlM95ogWjk5h2dNCZUm2Earmo+rSV5TYwEEXjaRD
# 2LqUq3Bbg4rMUj0ryIfi7mxuQ1Fd6fL33LI4i+N+6YUeFMLkUvZbUdYIk8FNmNZm
# dckz03RPkYyUkDWRIGXthe8WQaURe/YWyFd8AM79f5gq/8ORDCcDGbXxeOX34o6s
# 40UVyhR1YtizkytE0xFNYVGjnoiKjgaU7HXHuiBHbCejDFxlQycyzlx2jqbhmzuS
# RVWatWdAWqGO/Yk=
# SIG # End signature block
