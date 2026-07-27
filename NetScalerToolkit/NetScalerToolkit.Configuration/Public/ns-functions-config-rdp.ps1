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
# MII6AgYJKoZIhvcNAQcCoII58zCCOe8CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD+HKSSI9EukSvv
# dpdJ4MGfPf+5PSRE4CukEqFQgRn0dqCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
# lUgTecgRwIeZMA0GCSqGSIb3DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVu
# dGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAy
# MDAeFw0yMDA0MTYxODM2MTZaFw00NTA0MTYxODQ0NDBaMHcxCzAJBgNVBAYTAlVT
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xSDBGBgNVBAMTP01pY3Jv
# c29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24gUm9vdCBDZXJ0aWZpY2F0ZSBBdXRo
# b3JpdHkgMjAyMDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALORKgeD
# Bmf9np3gx8C3pOZCBH8Ppttf+9Va10Wg+3cL8IDzpm1aTXlT2KCGhFdFIMeiVPvH
# or+Kx24186IVxC9O40qFlkkN/76Z2BT2vCcH7kKbK/ULkgbk/WkTZaiRcvKYhOuD
# PQ7k13ESSCHLDe32R0m3m/nJxxe2hE//uKya13NnSYXjhr03QNAlhtTetcJtYmrV
# qXi8LW9J+eVsFBT9FMfTZRY33stuvF4pjf1imxUs1gXmuYkyM6Nix9fWUmcIxC70
# ViueC4fM7Ke0pqrrBc0ZV6U6CwQnHJFnni1iLS8evtrAIMsEGcoz+4m+mOJyoHI1
# vnnhnINv5G0Xb5DzPQCGdTiO0OBJmrvb0/gwytVXiGhNctO/bX9x2P29Da6SZEi3
# W295JrXNm5UhhNHvDzI9e1eM80UHTHzgXhgONXaLbZ7LNnSrBfjgc10yVpRnlyUK
# xjU9lJfnwUSLgP3B+PR0GeUw9gb7IVc+BhyLaxWGJ0l7gpPKWeh1R+g/OPTHU3mg
# trTiXFHvvV84wRPmeAyVWi7FQFkozA8kwOy6CXcjmTimthzax7ogttc32H83rwjj
# O3HbbnMbfZlysOSGM1l0tRYAe1BtxoYT2v3EOYI9JACaYNq6lMAFUSw0rFCZE4e7
# swWAsk0wAly4JoNdtGNz764jlU9gKL431VulAgMBAAGjVDBSMA4GA1UdDwEB/wQE
# AwIBhjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTIftJqhSobyhmYBAcnz1AQ
# T2ioojAQBgkrBgEEAYI3FQEEAwIBADANBgkqhkiG9w0BAQwFAAOCAgEAr2rd5hnn
# LZRDGU7L6VCVZKUDkQKL4jaAOxWiUsIWGbZqWl10QzD0m/9gdAmxIR6QFm3FJI9c
# Zohj9E/MffISTEAQiwGf2qnIrvKVG8+dBetJPnSgaFvlVixlHIJ+U9pW2UYXeZJF
# xBA2CFIpF8svpvJ+1Gkkih6PsHMNzBxKq7Kq7aeRYwFkIqgyuH4yKLNncy2RtNwx
# AQv3Rwqm8ddK7VZgxCwIo3tAsLx0J1KH1r6I3TeKiW5niB31yV2g/rarOoDXGpc8
# FzYiQR6sTdWD5jw4vU8w6VSp07YEwzJ2YbuwGMUrGLPAgNW3lbBeUU0i/OxYqujY
# lLSlLu2S3ucYfCFX3VVj979tzR/SpncocMfiWzpbCNJbTsgAlrPhgzavhgplXHT2
# 6ux6anSg8Evu75SjrFDyh+3XOjCDyft9V77l4/hByuVkrrOj7FjshZrM77nq81YY
# uVxzmq/FdxeDWds3GhhyVKVB0rYjdaNDmuV3fJZ5t0GNv+zcgKCf0Xd1WF81E+Al
# GmcLfc4l+gcK5GEh2NQc5QfGNpn0ltDGFf5Ozdeui53bFv0ExpK91IjmqaOqu/dk
# ODtfzAzQNb50GQOmxapMomE2gj4d8yu8l13bS3g7LfU772Aj6PXsCyM2la+YZr9T
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAOxfsGE
# dAui3IWtAAAAA7F+MA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYwNzI1MTkyNjEwWhcNMjYwNzI4
# MTkyNjEwWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAoVDcAOz6TalWG9vfNlA6qVCD
# mLVli6Uc0fGG8EYUEtFVVtMWj2XauPbRgJ5oJxZpyvJb7jIWhZOjLHB8u/nDaJ77
# HsqfjiBgteEkOqZaMd2Lc7bn/cJU51jf0/folLa7iEfwlIukDrNBgpwTVJuPLbTQ
# 4hZDA+xFCZN8RikowtnrlQjN9gNn5Oh6jgPou7cz5AkfdWpj5Rp4NGV0cctYt6da
# uE/Wa5B1Q/NB8Zz2C2o3bmJ/fYeBwnuMVrhaeff6lBykWH6fixbw/FHECpGxgxBe
# jU0yFvhoO+SpDlIaejRq4IIxyeUHJNrTE8Mk8nU+T7x4i27MNHwsVvPn5vdozRhB
# JNR9eg1j/RzwhqZ3SoRuV2ne26xhG9UJw/2bv9rDdaBf2GP6nyKf+FmdFyCb1Y2D
# yygS3t/5FptjNcceOUIQZSpcjXJ/HJnnfdbCURshMzHhQ4mUzFuJLZtNiBFQ3uop
# E80PvLmNSA9sEyjXd4nyUm2SKfqpwyq7H+TMQs4DAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# rDk4FlKL6gGHF9FRtMEug2P8gT0wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAMA0
# 8eOioaqDx9G96lr+ahHtFnpfHg0df91iir8LIKh7IguajVeIgFiOWOjYLWpFpRe+
# fMzvj5duooOeZChlHXFJVouSI0n3ooqmSakikUoVL8NJ4QHmppscUO7KaPzcVyyS
# Anq1LL7sfC3Z4sk2a0iFriXc90EcJ+StLU96tUUeJps15d0m5HRe+VQ0WmjepIrH
# H8kPYNDMtpxyMu5LvJdKDS02RdK4ZM0yvoMx70LdRuRAuNCUze3JovLjv4jprp/A
# BgEfMvE5Au7PMQEgAL50FM8jREQRtHWl9xaQFJwEgo62XQ1SVC3MKTc2SGb3Qke+
# re5a1KCRa6QOEof6F0fX6IDP1Mc9iRzdUdnZZ9Lu6OBsG/3j8LC6GVXePMcbogM9
# /oVizBQXwrAMCZEhwoGCQmxM18pRW1/Dq68I0dWCiIptqZE/fz2XrrvJktn/evdN
# EvlUk7cbsw0Aeeoy+8ju5N5jY98R4v44oUAkAhT7HvrU0k5dISUhNVHJbmjSEPWk
# 2K/sEYAEZAMfuK4KqTN3pSFNQttSdZs/3pqOtK+UW/tOWYO8hGskOwoo9MhxvYIK
# 9UaUyDcO0Fz7QBzO3DIZJMEY5jllHy1YH5ZZ8/Kmy7l0v2xuTMsVi1JN1laH8/R6
# TCSMIjo+8TJhm2VpA+PzG/wjcBbgSPYMLBiVSKH+MIIGwDCCBKigAwIBAgITMwAD
# sX7BhHQLotyFrQAAAAOxfjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MDcyNTE5MjYxMFoXDTI2
# MDcyODE5MjYxMFowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAKFQ3ADs+k2pVhvb3zZQ
# OqlQg5i1ZYulHNHxhvBGFBLRVVbTFo9l2rj20YCeaCcWacryW+4yFoWToyxwfLv5
# w2ie+x7Kn44gYLXhJDqmWjHdi3O25/3CVOdY39P36JS2u4hH8JSLpA6zQYKcE1Sb
# jy200OIWQwPsRQmTfEYpKMLZ65UIzfYDZ+Toeo4D6Lu3M+QJH3VqY+UaeDRldHHL
# WLenWrhP1muQdUPzQfGc9gtqN25if32HgcJ7jFa4Wnn3+pQcpFh+n4sW8PxRxAqR
# sYMQXo1NMhb4aDvkqQ5SGno0auCCMcnlByTa0xPDJPJ1Pk+8eItuzDR8LFbz5+b3
# aM0YQSTUfXoNY/0c8Iamd0qEbldp3tusYRvVCcP9m7/aw3WgX9hj+p8in/hZnRcg
# m9WNg8soEt7f+RabYzXHHjlCEGUqXI1yfxyZ533WwlEbITMx4UOJlMxbiS2bTYgR
# UN7qKRPND7y5jUgPbBMo13eJ8lJtkin6qcMqux/kzELOAwIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFKw5OBZSi+oBhxfRUbTBLoNj/IE9MB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQDANPHjoqGqg8fRvepa/moR7RZ6Xx4NHX/dYoq/CyCoeyILmo1XiIBYjljo2C1q
# RaUXvnzM74+XbqKDnmQoZR1xSVaLkiNJ96KKpkmpIpFKFS/DSeEB5qabHFDuymj8
# 3FcskgJ6tSy+7Hwt2eLJNmtIha4l3PdBHCfkrS1PerVFHiabNeXdJuR0XvlUNFpo
# 3qSKxx/JD2DQzLaccjLuS7yXSg0tNkXSuGTNMr6DMe9C3UbkQLjQlM3tyaLy47+I
# 6a6fwAYBHzLxOQLuzzEBIAC+dBTPI0REEbR1pfcWkBScBIKOtl0NUlQtzCk3Nkhm
# 90JHvq3uWtSgkWukDhKH+hdH1+iAz9THPYkc3VHZ2WfS7ujgbBv94/CwuhlV3jzH
# G6IDPf6FYswUF8KwDAmRIcKBgkJsTNfKUVtfw6uvCNHVgoiKbamRP389l667yZLZ
# /3r3TRL5VJO3G7MNAHnqMvvI7uTeY2PfEeL+OKFAJAIU+x761NJOXSElITVRyW5o
# 0hD1pNiv7BGABGQDH7iuCqkzd6UhTULbUnWbP96ajrSvlFv7TlmDvIRrJDsKKPTI
# cb2CCvVGlMg3DtBc+0AcztwyGSTBGOY5ZR8tWB+WWfPypsu5dL9sbkzLFYtSTdZW
# h/P0ekwkjCI6PvEyYZtlaQPj8xv8I3AW4Ej2DCwYlUih/jCCBygwggUQoAMCAQIC
# EzMAAAAYDeuRVamKAJgAAAAAABgwDQYJKoZIhvcNAQEMBQAwYzELMAkGA1UEBhMC
# VVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrTWlj
# cm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2lnbmluZyBQQ0EgMjAyMTAeFw0yNjAz
# MjYxODExMzJaFw0zMTAzMjYxODExMzJaMFoxCzAJBgNVBAYTAlVTMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJRCBW
# ZXJpZmllZCBDUyBBT0MgQ0EgMDMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
# AoICAQDIgNpgNFaiif2VWeWP5I6PnFXxJ/lB37fJR55GCvR7GLZBMkBijbiKVwgp
# BI3xM5nf484znH/qncJ+OCq6y3jgnQW+R8Zd7U+7LjlrmcskalzSQ0ghMxEpnBW8
# /HHs2V8ZJzQk6HP+SDsbvsL7LdlH/eO2l4mknhDBwr0Z/Q966TvEth5b8kCxj1vq
# iV4YNthLGRqZR9u2fK/yBMWu83p6O4uo2Edg++gEew5IL7vnnnKFqmSh/R9vPJy3
# WF1YcZewAUx8sXZNUnx3ZhVg59l2LpitPiwzE6FMqIsqaEvVe3MzuFd2a/uWDZH6
# VbDyUiRK78mIg1DQYA9zDEyyBFcNI+nxVSzglvL6u7PRuNqgcV3sf6ELxw89ysQM
# /Z4R1hRFWXRpyOWKKAKtfBHTk0UnNiPcxmLMMYs8jeUjOidfVPjTIry/UVwnwxdl
# kK85cZfBEMYZ/DBNOwdomP459Y1n8izKkbhsa+p4lw+cQVxATBFx9ggR79HhryT7
# HDmpPLvkJvBZ4wW4CW32UT2SMyDe28nIOU3m+hfHlVeKcLBQcym5VoRDjIcCVI7u
# qgGW2PNME0cfei8zCwCy6HCsssJWFS7eg/YbFhnATJcyWfMrkNuAbMfMN8Npg8cr
# S6jVVowyD0GG5zdgi+uQVcSK/638mA1xEYK3pnIoQgO09uuDBwIDAQABo4IB3DCC
# AdgwDgYDVR0PAQH/BAQDAgGGMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBSk
# Qwx/dlqlhec+jSgPDBeiRWlwxjBUBgNVHSAETTBLMEkGBFUdIAAwQTA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9Eb2NzL1JlcG9z
# aXRvcnkuaHRtMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMBIGA1UdEwEB/wQI
# MAYBAf8CAQAwHwYDVR0jBBgwFoAU2UEpsA8PY2zvadf1zSmepEhqMOYwcAYDVR0f
# BGkwZzBloGOgYYZfaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwv
# TWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENvZGUlMjBTaWduaW5nJTIwUENB
# JTIwMjAyMS5jcmwwfQYIKwYBBQUHAQEEcTBvMG0GCCsGAQUFBzAChmFodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElEJTIw
# VmVyaWZpZWQlMjBDb2RlJTIwU2lnbmluZyUyMFBDQSUyMDIwMjEuY3J0MA0GCSqG
# SIb3DQEBDAUAA4ICAQBxxyBW+X6mhdRiSwD9PMMWcGUAnx5/QUwnNvZdFGEX+4DR
# DIr9WCh4C87wHtw+lg1D3uzK10DstPX0LFLBFAC3vWMYX4ImXwoLhoR0xlN8mUdo
# rJ3bgnpCJWuI1531Z1rCwPuUrSkBxfOIGDk3p2ECb3Ho/xHi5PRSR/OUrWuQHwXi
# aXMTuXu3IRLezwVkZpFmNwYRD57R9Nx2F/yM7tzOY0Hh0hGCaYEK38/6FrS0SXad
# XWyDUCfn5XOGACRjUCnHx+JQUG0f4SHD+iblpAI0gl+ZHnVmdXXxHTZeTa0CYCIh
# FxKP2922s0g6zLmeiV13LWUmtt/UF7TrWXpMi2/0UNniaDoH7rnPGRV5xVX8uXy4
# sZii4aswzqPM7Y7+mzcranqZ8EjZk5gjLhQ3A2sZaprlOu8CaRmyfcIiVH7zVfgA
# vm81MWXFziAf7my7QOvnyEFPGddq8MSfPtfRyw/Uq3uH6KpoaJNIfPYH6fceZSi5
# 3Rat1A9grExq3ROjhhSpTcchuBItAMNVPxoKNbUm+iR/X3XkL+9WQginjyHe+hXL
# clY8vAGXFD1p40PqMIpAYsmEJBFKW9df4//1N5oQDr/FY9IBJl/oSS979i5rtT7N
# Zz9KvYraCPRBGs0QCy+sWvgQa0coM70QJVLeVwmSxUO/0od0w9Qry7bSLrxGoDCC
# B54wggWGoAMCAQICEzMAAAAHh6M0o3uljhwAAAAAAAcwDQYJKoZIhvcNAQEMBQAw
# dzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjFI
# MEYGA1UEAxM/TWljcm9zb2Z0IElkZW50aXR5IFZlcmlmaWNhdGlvbiBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDIwMB4XDTIxMDQwMTIwMDUyMFoXDTM2MDQw
# MTIwMTUyMFowYzELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjE0MDIGA1UEAxMrTWljcm9zb2Z0IElEIFZlcmlmaWVkIENvZGUgU2ln
# bmluZyBQQ0EgMjAyMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALLw
# wK8ZiCji3VR6TElsaQhVCbRS/3pK+MHrJSj3Zxd3KU3rlfL3qrZilYKJNqztA9OQ
# acr1AwoNcHbKBLbsQAhBnIB34zxf52bDpIO3NJlfIaTE/xrweLoQ71lzCHkD7A4A
# s1Bs076Iu+mA6cQzsYYH/Cbl1icwQ6C65rU4V9NQhNUwgrx9rGQ//h890Q8JdjLL
# w0nV+ayQ2Fbkd242o9kH82RZsH3HEyqjAB5a8+Ae2nPIPc8sZU6ZE7iRrRZywRmr
# KDp5+TcmJX9MRff241UaOBs4NmHOyke8oU1TYrkxh+YeHgfWo5tTgkoSMoayqoDp
# HOLJs+qG8Tvh8SnifW2Jj3+ii11TS8/FGngEaNAWrbyfNrC69oKpRQXY9bGH6jn9
# NEJv9weFxhTwyvx9OJLXmRGbAUXN1U9nf4lXezky6Uh/cgjkVd6CGUAf0K+Jw+GE
# /5VpIVbcNr9rNE50Sbmy/4RTCEGvOq3GhjITbCa4crCzTTHgYYjHs1NbOc6brH+e
# KpWLtr+bGecy9CrwQyx7S/BfYJ+ozst7+yZtG2wR461uckFu0t+gCwLdN0A6cFtS
# RtR8bvxVFyWwTtgMMFRuBa3vmUOTnfKLsLefRaQcVTgRnzeLzdpt32cdYKp+dhr2
# ogc+qM6K4CBI5/j4VFyC4QFeUP2YAidLtvpXRRo3AgMBAAGjggI1MIICMTAOBgNV
# HQ8BAf8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFNlBKbAPD2Ns
# 72nX9c0pnqRIajDmMFQGA1UdIARNMEswSQYEVR0gADBBMD8GCCsGAQUFBwIBFjNo
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5o
# dG0wGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBTIftJqhSobyhmYBAcnz1AQT2ioojCBhAYDVR0fBH0wezB5oHeg
# dYZzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwSWRlbnRpdHklMjBWZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUl
# MjBBdXRob3JpdHklMjAyMDIwLmNybDCBwwYIKwYBBQUHAQEEgbYwgbMwgYEGCCsG
# AQUFBzAChnVodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01p
# Y3Jvc29mdCUyMElkZW50aXR5JTIwVmVyaWZpY2F0aW9uJTIwUm9vdCUyMENlcnRp
# ZmljYXRlJTIwQXV0aG9yaXR5JTIwMjAyMC5jcnQwLQYIKwYBBQUHMAGGIWh0dHA6
# Ly9vbmVvY3NwLm1pY3Jvc29mdC5jb20vb2NzcDANBgkqhkiG9w0BAQwFAAOCAgEA
# fyUqnv7Uq+rdZgrbVyNMul5skONbhls5fccPlmIbzi+OwVdPQ4H55v7VOInnmezQ
# EeW4LqK0wja+fBznANbXLB0KrdMCbHQpbLvG6UA/Xv2pfpVIE1CRFfNF4XKO8XYE
# a3oW8oVH+KZHgIQRIwAbyFKQ9iyj4aOWeAzwk+f9E5StNp5T8FG7/VEURIVWArbA
# zPt9ThVN3w1fAZkF7+YU9kbq1bCR2YD+MtunSQ1Rft6XG7b4e0ejRA7mB2IoX5hN
# h3UEauY0byxNRG+fT2MCEhQl9g2i2fs6VOG19CNep7SquKaBjhWmirYyANb0RJSL
# WjinMLXNOAga10n8i9jqeprzSMU5ODmrMCJE12xS/NWShg/tuLjAsKP6SzYZ+1Ry
# 358ZTFcx0FS/mx2vSoU8s8HRvy+rnXqyUJ9HBqS0DErVLjQwK8VtsBdekBmdTbQV
# oCgPCqr+PDPB3xajYnzevs7eidBsM71PINK2BoE2UfMwxCCX3mccFgx6UsQeRSdV
# VVNSyALQe6PT12418xon2iDGE81OGCreLzDcMAZnrUAx4XQLUz6ZTl65yPUiOh3k
# 7Yww94lDf+8oG2oZmDh5O1Qe38E+M3vhKwmzIeoB1dVLlz4i3IpaDcR+iuGjH2Td
# aC1ZOmBXiCRKJLj4DT2uhJ04ji+tHD6n58vhavFIrmcxghcyMIIXLgIBATBxMFox
# CzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzAp
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAA7F+
# wYR0C6Lcha0AAAADsX4wDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgsRpd
# cjlbyLNbscgPriB4le6Qh4+vdayEXuUjLxe6P8IwDQYJKoZIhvcNAQEBBQAEggGA
# S1KAMKQpsobJ/RaNSSiCGWY2HcKRkzPL1l6J+EDkClvcahmmBB31KiEW9Bma2EGD
# VfVpjlwUpl9ZTG2I1DJ04puSzZhj7Dpu6fSn1xizqK77RMHd5Y0WkyRNnRSsTv2Z
# a7NBJRqCJYz1lPJ4H3zK0bX1bweRDsI4fsN1ipjw4ZhiSdtRwlwnlcUe/8KVOE0z
# NV0Jxv8IAJ5roXLlQXpfj549Ef81/y4gcNW+63GNl8MJbYrIFmaG3qCJhVaj3Z4h
# R/xZ1t/oNS1cyZ694B3XPtqFz4Wuz63GkERzaUjHjYQaUXKrzhwKVogtjyPky0ds
# 8n70PIFjaV4f7Y2uS8DUyzIQ5VeBiw1x3/XAyg8ULVX3JgGqcYh6tGpeUnyDfMj2
# 696TBfy3q2QH76I+ACuS20EA5VqW3aU+zWIrUvAIRzSFHmZy8o6xghw/3xcKUlol
# byn+xal77KTAhRKcrjOxWM4pVUKFVmDmgYJvvom1oLWqoYY5qFSY89rWSGPAwJgR
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIIJq2Duffr0oazsqkHa6
# kxu6Og0zA/ga56nIEKJk5n9oAgZqNWdcXuAYEzIwMjYwNzI3MTMxMjE1LjUxNlow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYD
# VQQDEyxNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0
# eaCCDykwggeCMIIFaqADAgECAhMzAAAABeXPD/9mLsmHAAAAAAAFMA0GCSqGSIb3
# DQEBDAUAMHcxCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xSDBGBgNVBAMTP01pY3Jvc29mdCBJZGVudGl0eSBWZXJpZmljYXRpb24g
# Um9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAyMDAeFw0yMDExMTkyMDMyMzFa
# Fw0zNTExMTkyMDQyMzFaMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRp
# bWVzdGFtcGluZyBDQSAyMDIwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAnnznUmP94MWfBX1jtQYioxwe1+eXM9ETBb1lRkd3kcFdcG9/sqtDlwxKoVIc
# aqDb+omFio5DHC4RBcbyQHjXCwMk/l3TOYtgoBjxnG/eViS4sOx8y4gSq8Zg49RE
# Af5huXhIkQRKe3Qxs8Sgp02KHAznEa/Ssah8nWo5hJM1xznkRsFPu6rfDHeZeG1W
# a1wISvlkpOQooTULFm809Z0ZYlQ8Lp7i5F9YciFlyAKwn6yjN/kR4fkquUWfGmMo
# pNq/B8U/pdoZkZZQbxNlqJOiBGgCWpx69uKqKhTPVi3gVErnc/qi+dR8A2MiAz0k
# N0nh7SqINGbmw5OIRC0EsZ31WF3Uxp3GgZwetEKxLms73KG/Z+MkeuaVDQQheang
# OEMGJ4pQZH55ngI0Tdy1bi69INBV5Kn2HVJo9XxRYR/JPGAaM6xGl57Ei95HUw9N
# V/uC3yFjrhc087qLJQawSC3xzY/EXzsT4I7sDbxOmM2rl4uKK6eEpurRduOQ2hTk
# mG1hSuWYBunFGNv21Kt4N20AKmbeuSnGnsBCd2cjRKG79+TX+sTehawOoxfeOO/j
# R7wo3liwkGdzPJYHgnJ54UxbckF914AqHOiEV7xTnD1a69w/UTxwjEugpIPMIIE6
# 7SFZ2PMo27xjlLAHWW3l1CEAFjLNHd3EQ79PUr8FUXetXr0CAwEAAaOCAhswggIX
# MA4GA1UdDwEB/wQEAwIBhjAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQUa2ko
# OjUvSGNAz3vYr0npPtk92yEwVAYDVR0gBE0wSzBJBgRVHSAAMEEwPwYIKwYBBQUH
# AgEWM2h0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0
# b3J5Lmh0bTATBgNVHSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMA
# dQBiAEMAQTAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFMh+0mqFKhvKGZgE
# ByfPUBBPaKiiMIGEBgNVHR8EfTB7MHmgd6B1hnNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBJZGVudGl0eSUyMFZlcmlmaWNh
# dGlvbiUyMFJvb3QlMjBDZXJ0aWZpY2F0ZSUyMEF1dGhvcml0eSUyMDIwMjAuY3Js
# MIGUBggrBgEFBQcBAQSBhzCBhDCBgQYIKwYBBQUHMAKGdWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwSWRlbnRpdHklMjBW
# ZXJpZmljYXRpb24lMjBSb290JTIwQ2VydGlmaWNhdGUlMjBBdXRob3JpdHklMjAy
# MDIwLmNydDANBgkqhkiG9w0BAQwFAAOCAgEAX4h2x35ttVoVdedMeGj6TuHYRJkl
# FaW4sTQ5r+k77iB79cSLNe+GzRjv4pVjJviceW6AF6ycWoEYR0LYhaa0ozJLU5Yi
# +LCmcrdovkl53DNt4EXs87KDogYb9eGEndSpZ5ZM74LNvVzY0/nPISHz0Xva71Qj
# D4h+8z2XMOZzY7YQ0Psw+etyNZ1CesufU211rLslLKsO8F2aBs2cIo1k+aHOhrw9
# xw6JCWONNboZ497mwYW5EfN0W3zL5s3ad4Xtm7yFM7Ujrhc0aqy3xL7D5FR2J7x9
# cLWMq7eb0oYioXhqV2tgFqbKHeDick+P8tHYIFovIP7YG4ZkJWag1H91KlELGWi3
# SLv10o4KGag42pswjybTi4toQcC/irAodDW8HNtX+cbz0sMptFJK+KObAnDFHEsu
# kxD+7jFfEV9Hh/+CSxKRsmnuiovCWIOb+H7DRon9TlxydiFhvu88o0w35JkNbJxT
# k4MhF/KgaXn0GxdH8elEa2Imq45gaa8D+mTm8LWVydt4ytxYP/bqjN49D9NZ81co
# E6aQWm88TwIf4R4YZbOpMKN0CyejaPNN41LGXHeCUMYmBx3PkP8ADHD1J2Cr/6tj
# uOOCztfp+o9Nc+ZoIAkpUcA/X2gSMkgHAPUvIdtoSAHEUKiBhI6JQivRepyvWcl+
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAW0q1jUEybdx0AAAAAABbMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwNVoXDTI3MDEwNzE4NTkwNVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdBMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAJBUzBbbnlDXee0B0KD5G4/475thFyfctCyu
# ESTWQXvlLi4Wx/td2qUdeq4ideeg6VWhiOHfu3wJV4TUGSRtqh9Ccr1BmiBKv9iu
# FpgHyIBu5Qx38ZsxwlFeXVS+ZqJJKnXRbDNQdcYSoC/6c0hQJ/PH50DBRDQkPXVw
# yFizLrRH9AlrJeUg7BKeT23zftS8/KOJLvEEbHOF6pSOY3ZVprZUWbWjWwRTmoHa
# Q/E8vrWtLNyEJ+b089VW1Ikra3t4GTB5Wby3CL1K2zYnAxBIvafsKMFyj9OuXHcT
# PKMDoFSMeamG9MKOMb6uoG1PjdnDgsLP6EOMRSzrLL7jED1mbB9RSd9fhty+HQr6
# vZgsBn6oUy+YTpNVLskwdtUM82WYAkPztlOt3AiL0qyV7/U3j/uq3vHMjPM0w034
# 0M57Nei0g4BCcMt0dbqoc91VgCb3/36sHQANontn1HOF2oLk8190QRS43isHVra8
# H8sf5+GlqIYsYiCKX04HZiOzZW826nVI6d++8lyTeWmpj90Ua9uPbJhVjwE3oh6t
# O510ySqmSMSLEN07p3Ibe3E6BAb2w93rWzb26+dpSthbKF4kApofqBsWPX4MEtHK
# SOftPmVTCQ47tghrVuHia9jY+Hsj01m4KW4WtkmVm3L6hMZECMa4sjMxAXz+bX/A
# JhWTe6TZAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQU7/LqUlWWYhXJdXwgYKx4b8Gv
# 0rYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQAAH+zd+XKh4OxXYMWFmtgilXAQGctOjCUB1w/uBiC/OXcH
# 3Ia4/XbdUhKzFbaiTbIE6vYZKd1p4u7nKOLkawymAMVyuO7LSl6rLKttZIyLhWjT
# K0zXOz0u4xLq9+bRtBEKJvA6sD5nJwH1IO6z1YizyuIRoalMCnbrUixfWxQn4TAm
# N7t9uk+X2FUThEa3ewzRwhtG+xwaAbLMkxRmR24JnfXd1VxKo90+m7Wzuov96Uug
# x5wZdewiIIm1ZWTj4lCJHup679LcOa7tAxJMipVaSltQH9fm9TOKczlfxtWuBcLU
# 4duZfqwgsILsH7PMkcX1zwQzQD0yAtPhnYz9KNG125bX+iilOe1S8RHqv2bbBpMp
# ao4kcUvQI6dMgKRvFmm1eLbhSNOQplDMTGD1tNVdNGkI96jUu+troUjWMMi46TQf
# BAHxtDTpRhIu/87vAVQ8Z6RHhFxesz4Ed5JThaIQRAy6GcO/Jk+QzDzoZ0arRIkI
# sGJ7rZgOVAjx9ctfw8lH9RfjcwB3wdGBYNMNVJqQpUai2Taddf5pXzTZEHIqLEF5
# 3SrBjIeInoQrP7U5VlXiMQsxewLdINrAE2l2TR3KBikb+RQRygbTp8jj2yiC0NCU
# wG+K+ndglN5RMbXjFW6aKa59Xq+b8XzK/DK+AJtgOpHgJv8Qrk62A+twOVLOpjGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABbSrWNQTJt3HQAAAAAAFswDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgtyQ+ToIIRI0aM1fKf9Cs3BzdUEc8oH/w+DpxoNmzKMYwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCAvMQNVXZ0b0xxlGw8X/3IEybObuT6a5W1d61CW+cGD
# 7zB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFtKtY1BMm3cdAAAAAAAWzAiBCAlBXKoEQrUb62I8noQ
# lvlBdu6F8Tu5CjaMViq4hivjqTANBgkqhkiG9w0BAQsFAASCAgB/0wpcsMdzP08M
# OoVQoZqQktydsMJg3isrfkMp9YpiZ6AbtJpJ2e2fcIb3oJhUjlzfQ0T58DrKq4dl
# 7DO1CQiCukW2+1yky4F4EdcgV9sCWNniq8DwbdY2bnyHYOX6F9bcW6I6X5496o5t
# MvVziw48Vxk11TTbQyaMUtoyPvD+ZbrWlA75lpZbZtYjF4V4t/r+gNk+2LcWAHUW
# /hWRHJcaK0JfPyEu/LMjmS6dKj89S9kV2C3tN17/UhHl75y9oZQQmaTMh0WW85bX
# TY2s/xtj4ugCzTD6ObTUue2ib7DSm5bKNjVzwI6xfWkLv+G3f+1YezizHCZb9rOH
# 6cNtrds7hiH5pqjD8fT3I4/oRbG/oeDpLw9a9y3ESnjoTrTCN5riUMzi7iN1B8Do
# BOJiu+CXU91MlP6yZcsa/7l60vfF7rJy35q3H+vbhy7oTwhBgFjGGjMPVBuKzxyJ
# NGKJUivYS3Bvcpag2uV5ZZy/fsMsVdKuJ1pBKV5AyH8JqHe6FJkdkoLUf9G85pXZ
# wkA1DtPa/ur8H8LUHcT96MYtEAWnEECL3h6tJ+bOuHwMI9axrg3MF+xHaZkIUrUj
# 6V4TZXHVmlYyXI4CqV/EIeQRnrAnI7AlhI/u15vd50Nf7DQJH8ojNiAO0m4fOcJ8
# 35N+kr4DHWQny2FTVUhXAC0fZHzwRw==
# SIG # End signature block
