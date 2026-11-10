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
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAzryTQhOnYGmB/
# OvNBiFzeK6EXnbea1Os8kvgOUpbA5aCCIiYwggXMMIIDtKADAgECAhBUmNLR1FsZ
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
# 03u4aUoqlmZpxJTG9F9urJh4iIAGXKKy7aIwggbAMIIEqKADAgECAhMzAAurCt6s
# uD46eyRCAAAAC6sKMA0GCSqGSIb3DQEBDAUAMFoxCzAJBgNVBAYTAlVTMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKzApBgNVBAMTIk1pY3Jvc29mdCBJ
# RCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMwHhcNMjYxMTA5MDE1NDMxWhcNMjYxMTEy
# MDE1NDMxWjCBgzELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5vb3JkLUJyYWJhbnQx
# EjAQBgNVBAcTCVNjaGlqbmRlbDEjMCEGA1UEChMaSm9obiBCaWxsZWtlbnMgQ29u
# c3VsdGFuY3kxIzAhBgNVBAMTGkpvaG4gQmlsbGVrZW5zIENvbnN1bHRhbmN5MIIB
# ojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAzV8KpcpErJZ5+WezJL1oD0MO
# 4I+G+P+oJJILgQ5imTksdffUO7+SvvITM7ZvMxxTpLJhJJ20ILGbcfP/0g267tFM
# q/EzO3ClRzAQVZSoolP+v34Ch+aXtuVw+yk3gI68Txdgp1SzQP1iVKzkhD4f8luq
# hFib3eImENRvbBMQMXCT8uWS0HEPBSR5g+fEE7njdQhUb6HuIh6KsM5R/skQ30T3
# LprHb516F00X1L3sn9Z78jxtwuJK88kT22FxyJYlk15znumEiQ9w55zLkAHKNgk4
# i+dp6ljoVqRt/Kv+D7ZWfleOHoRHjB0UNnPMSjC0B51bS40gxJpXOBaq0V1nESZL
# zA6tZPpmvXnxNIEROyKr3/PRNYPTbzfXjWhnX2YVUzD6CJxArctYup6Typp5dfxo
# OxHqZ3ddrcQXNumGcMSYQv30GjByUYJ1KXlP3DPN1w+p9VTH1aInB0MCxe65PzzS
# hzOB2U+qZ5JdILqf5Ea2fG5dASB9Q/UuQJPukpFRAgMBAAGjggHTMIIBzzAMBgNV
# HRMBAf8EAjAAMA4GA1UdDwEB/wQEAwIHgDA6BgNVHSUEMzAxBgorBgEEAYI3YQEA
# BggrBgEFBQcDAwYZKwYBBAGCN2HK9PELgrHSgxH33KNOluu6MTAdBgNVHQ4EFgQU
# PWlH3ZJGiiEWFhCkCohRoCSnbB4wHwYDVR0jBBgwFoAUpEMMf3ZapYXnPo0oDwwX
# okVpcMYwZwYDVR0fBGAwXjBcoFqgWIZWaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jcmwvTWljcm9zb2Z0JTIwSUQlMjBWZXJpZmllZCUyMENTJTIwQU9D
# JTIwQ0ElMjAwMy5jcmwwdAYIKwYBBQUHAQEEaDBmMGQGCCsGAQUFBzAChlhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMElE
# JTIwVmVyaWZpZWQlMjBDUyUyMEFPQyUyMENBJTIwMDMuY3J0MFQGA1UdIARNMEsw
# SQYEVR0gADBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wDQYJKoZIhvcNAQEMBQADggIBAHkf
# P4Tud8oXugiRGeDRMrb6mqaFKwjFCzAr+WlAcrN/gHMK8xj4Za97T7ptRDpae+Yo
# 2BnzfFgKQOfavQkK/0xx9TNWYasJMUH+pXsr2AD+BJ+7Xcq9DryAjVJk6u6+Ap6Z
# 9IfDce6n0Bc5Kh32dMDXcYiqI6wKoRtFjRflmAhATGbmSdkxSF520fhd88ohgmmi
# ua2hMNE1N0BFiNg5mj+fbyvanTwqzuq+73TZz4g3Z5qkau1dWfZj2l2NZ2hZQD4u
# m5q+RTUZtxu8xoAWbVanl28qZ9ZMFQPszBva6vpYUSYYvBreuvJrnXhNi+x5HZL5
# MlfKpnZPhAD9A0HdAAaFOyrLJWCdW5c/XLJljtKILhzCRCIC7CBkPvn6DsnZcNoA
# jYLj1Dgz9n7RQsbbnoYRAB0GJjTueO2vyDLoG86DnoYfgljwKVWrAZeA5oan4JYS
# j0nFqQy43Tqh7JXqwKJfUA3J0iSw7dWsn3WVkfUA2lVqr3ogbB4rY+xqiyNwe5kh
# G5SMyfQ+pZHf4acDXc/+SY0+Tu8phNScJWht9goe8uSkuvZBIoe9XH2kzUmWyVrn
# SZzhW+oZL6aRLEcn1gAK8Ys9ZmidhukiKlmZf7HW1hNU6ttFkI2LT/tQzg8Y0tLy
# q5uDgBA7Vgh3gD+bVbDTiV3hhaOXxvb3asjn+F0IMIIGwDCCBKigAwIBAgITMwAL
# qwrerLg+OnskQgAAAAurCjANBgkqhkiG9w0BAQwFADBaMQswCQYDVQQGEwJVUzEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYDVQQDEyJNaWNyb3Nv
# ZnQgSUQgVmVyaWZpZWQgQ1MgQU9DIENBIDAzMB4XDTI2MTEwOTAxNTQzMVoXDTI2
# MTExMjAxNTQzMVowgYMxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1CcmFi
# YW50MRIwEAYDVQQHEwlTY2hpam5kZWwxIzAhBgNVBAoTGkpvaG4gQmlsbGVrZW5z
# IENvbnN1bHRhbmN5MSMwIQYDVQQDExpKb2huIEJpbGxla2VucyBDb25zdWx0YW5j
# eTCCAaIwDQYJKoZIhvcNAQEBBQADggGPADCCAYoCggGBAM1fCqXKRKyWeflnsyS9
# aA9DDuCPhvj/qCSSC4EOYpk5LHX31Du/kr7yEzO2bzMcU6SyYSSdtCCxm3Hz/9IN
# uu7RTKvxMztwpUcwEFWUqKJT/r9+Aofml7blcPspN4COvE8XYKdUs0D9YlSs5IQ+
# H/JbqoRYm93iJhDUb2wTEDFwk/LlktBxDwUkeYPnxBO543UIVG+h7iIeirDOUf7J
# EN9E9y6ax2+dehdNF9S97J/We/I8bcLiSvPJE9thcciWJZNec57phIkPcOecy5AB
# yjYJOIvnaepY6Fakbfyr/g+2Vn5Xjh6ER4wdFDZzzEowtAedW0uNIMSaVzgWqtFd
# ZxEmS8wOrWT6Zr158TSBETsiq9/z0TWD0283141oZ19mFVMw+gicQK3LWLqek8qa
# eXX8aDsR6md3Xa3EFzbphnDEmEL99BowclGCdSl5T9wzzdcPqfVUx9WiJwdDAsXu
# uT880oczgdlPqmeSXSC6n+RGtnxuXQEgfUP1LkCT7pKRUQIDAQABo4IB0zCCAc8w
# DAYDVR0TAQH/BAIwADAOBgNVHQ8BAf8EBAMCB4AwOgYDVR0lBDMwMQYKKwYBBAGC
# N2EBAAYIKwYBBQUHAwMGGSsGAQQBgjdhyvTxC4Kx0oMR99yjTpbrujEwHQYDVR0O
# BBYEFD1pR92SRoohFhYQpAqIUaAkp2weMB8GA1UdIwQYMBaAFKRDDH92WqWF5z6N
# KA8MF6JFaXDGMGcGA1UdHwRgMF4wXKBaoFiGVmh0dHA6Ly93d3cubWljcm9zb2Z0
# LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUyMElEJTIwVmVyaWZpZWQlMjBDUyUy
# MEFPQyUyMENBJTIwMDMuY3JsMHQGCCsGAQUFBwEBBGgwZjBkBggrBgEFBQcwAoZY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNyb3NvZnQl
# MjBJRCUyMFZlcmlmaWVkJTIwQ1MlMjBBT0MlMjBDQSUyMDAzLmNydDBUBgNVHSAE
# TTBLMEkGBFUdIAAwQTA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraW9wcy9Eb2NzL1JlcG9zaXRvcnkuaHRtMA0GCSqGSIb3DQEBDAUAA4IC
# AQB5Hz+E7nfKF7oIkRng0TK2+pqmhSsIxQswK/lpQHKzf4BzCvMY+GWve0+6bUQ6
# WnvmKNgZ83xYCkDn2r0JCv9McfUzVmGrCTFB/qV7K9gA/gSfu13KvQ68gI1SZOru
# vgKemfSHw3Hup9AXOSod9nTA13GIqiOsCqEbRY0X5ZgIQExm5knZMUhedtH4XfPK
# IYJpormtoTDRNTdARYjYOZo/n28r2p08Ks7qvu902c+IN2eapGrtXVn2Y9pdjWdo
# WUA+LpuavkU1GbcbvMaAFm1Wp5dvKmfWTBUD7Mwb2ur6WFEmGLwa3rrya514TYvs
# eR2S+TJXyqZ2T4QA/QNB3QAGhTsqyyVgnVuXP1yyZY7SiC4cwkQiAuwgZD75+g7J
# 2XDaAI2C49Q4M/Z+0ULG256GEQAdBiY07njtr8gy6BvOg56GH4JY8ClVqwGXgOaG
# p+CWEo9JxakMuN06oeyV6sCiX1ANydIksO3VrJ91lZH1ANpVaq96IGweK2Psaosj
# cHuZIRuUjMn0PqWR3+GnA13P/kmNPk7vKYTUnCVobfYKHvLkpLr2QSKHvVx9pM1J
# lsla50mc4VvqGS+mkSxHJ9YACvGLPWZonYbpIipZmX+x1tYTVOrbRZCNi0/7UM4P
# GNLS8qubg4AQO1YId4A/m1Ww04ld4YWjl8b292rI5/hdCDCCBygwggUQoAMCAQIC
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
# BgNVBAMTIk1pY3Jvc29mdCBJRCBWZXJpZmllZCBDUyBBT0MgQ0EgMDMCEzMAC6sK
# 3qy4Pjp7JEIAAAALqwowDQYJYIZIAWUDBAIBBQCgXjAQBgorBgEEAYI3AgEMMQIw
# ADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAvBgkqhkiG9w0BCQQxIgQgTLoN
# 9d8zYrhniyK17fDCHdH+YahbPzhFk4WJuN6O9eYwDQYJKoZIhvcNAQEBBQAEggGA
# ozXkZdPGce1qSY/tKSyYpF1s7wOnGhMhACg/N7vEw2z6oXDobZqTxHC+obvtbbGO
# sSFNzUGo627tSp/11fsbgG1XD8rzxVooGbG6hH72EM6aSy3+BcU8XNFvhS8BJEGq
# 1NVLxwPPHhnYr9XMy6z3oqDhFMkMmtPKJqiifiu1u4HlmBy0jgQjI4zhXsMqWicU
# niEWfEVUkh4QUrRhJfT1yH24g441U3RRSuPkvnnquty1U8PjYXs9JxOIi1YxHqeQ
# Ds+dwqPMhe8M9LyILhtM8Fwlr6GWL5ywTz+mB2Pqhg0K2p48vBbM7Ug3+HdWX9eM
# XvdD4agHqNgyfSxzZuZIg7O4s8Vg8zshHVGXYWYWQFC5ZJZw0V0pnvXYQgc9whq+
# smydNXFOJ/DmebtM6GnPKK1zv1NSusABOu4YXpUKAH0lK1/nZcsuI2CBqcGxvkbq
# 72vFwXV6OPUg2pygxED5ikjb2S5vA7orCG1DSv97Om/KQXXroacASTH3N/iYMhsc
# oYIUsjCCFK4GCisGAQQBgjcDAwExghSeMIIUmgYJKoZIhvcNAQcCoIIUizCCFIcC
# AQMxDzANBglghkgBZQMEAgEFADCCAWoGCyqGSIb3DQEJEAEEoIIBWQSCAVUwggFR
# AgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIBQdHUNmpHqTWmJgaEK9
# DHszq/SRBmIy5mEAYxeAwNI2AgZq7daDF78YEzIwMjYxMTEwMTAyMzEyLjE2N1ow
# BIACAfSggemkgeYwgeMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjdCMUEtMDVFMC1EOTQ3MTUwMwYD
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
# JYbYbBh7pmgAXVswggefMIIFh6ADAgECAhMzAAAAWXzacemNXvXAAAAAAABZMA0G
# CSqGSIb3DQEBDAUAMGExCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBQdWJsaWMgUlNBIFRpbWVz
# dGFtcGluZyBDQSAyMDIwMB4XDTI2MDEwODE4NTkwMVoXDTI3MDEwNzE4NTkwMVow
# geMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsT
# JE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEnMCUGA1UECxMe
# blNoaWVsZCBUU1MgRVNOOjdCMUEtMDVFMC1EOTQ3MTUwMwYDVQQDEyxNaWNyb3Nv
# ZnQgUHVibGljIFJTQSBUaW1lIFN0YW1waW5nIEF1dGhvcml0eTCCAiIwDQYJKoZI
# hvcNAQEBBQADggIPADCCAgoCggIBAKYu5/40eEX+hT+5jFa146bid3dA4LnXYntv
# kP3CGw4LGARFhnvLMSJ/VtsubzDaeFnm7yb2KSM70WmHQprdCVqpvUH7l0uB4jNw
# 7urLoAR9kKHLE0VlMlDStDSxUBI3qwsdrjvdmvV0k+9/njuDEiSlzJTf7Dowd1K3
# bO4beRyaFhR+Y8tymECOqlOAffYrG2wZdVM51+QSBSe+PEykr8C6OnnqSipuF8fZ
# vCb6/huk0Zm6ZwsaixSHIAT2IEGvS7c63Im8jV3a8R0K6i2yiw0NNlnTSpwy/Zfv
# 7iwsLBwhfbjBTn+XOl6mPzDXQQ3V+SRP9xXbGKOsBTxzGid7aKAHw3o4Ahl9UGWL
# H9kNP3VUokE6JYkjlfpuUGZ6gQyqDewfxD4VoYIlopt4HZ0xQvqajuJx+cr8LR/I
# Z56gLLmwyMzde5+vtjBoilry/gSZwVGwgkvkIgpKPBQHGsSB0y3szr7Y7wEb6v0y
# Zal1XUvWnnz3inTaSWsCFrLPVwVmXy3ncY5/d25VpOkht+m697GWNbvsNOhAOHRa
# ftE9j/hhkoM6RsyJfBLnhqMcA/wcavf5oj5NeyRQdGZeLKcls9csKS3sBUzPidxx
# 2iiNH9CPaDq/bLJEOXasYohXMnRinu+fUk81s8VO7DQSF6ffn5oqSHoV8lf1Ax6u
# +kdShb8BAgMBAAGjggHLMIIBxzAdBgNVHQ4EFgQUj5bnC18D0vlnSRhCOiODGGuX
# NnYwHwYDVR0jBBgwFoAUa2koOjUvSGNAz3vYr0npPtk92yEwbAYDVR0fBGUwYzBh
# oF+gXYZbaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9z
# b2Z0JTIwUHVibGljJTIwUlNBJTIwVGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNy
# bDB5BggrBgEFBQcBAQRtMGswaQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2lvcHMvY2VydHMvTWljcm9zb2Z0JTIwUHVibGljJTIwUlNBJTIw
# VGltZXN0YW1waW5nJTIwQ0ElMjAyMDIwLmNydDAMBgNVHRMBAf8EAjAAMBYGA1Ud
# JQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDBmBgNVHSAEXzBdMFEG
# DCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29m
# dC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wCAYGZ4EMAQQCMA0GCSqG
# SIb3DQEBDAUAA4ICAQBEMhzC/ZcjpG/zURE7z2Yp5vrUxUjsE5Xa3t/2RGvESwvb
# msk3bLHhSFAajgo2XQ8xoGDP3sUhKCLPeICSbkVv6V8sSp8fJ8Jos6yrawf2YVis
# 8tcV+OO7U9S6JGPQzpmPncfzQc4ne1fqZ4+HiKabIDEoFdddQT2Egkk9fzxCY/EZ
# 52avJ27dSfrI/IDmyn9V10O3iQpg2F+C9vNTrk7nVgoDoHa9+Q3pYr0IHGnSmt5i
# rgGT436zo5WnXP8FxMhswH1aiyiSZiVzhor10C9C52cP3C8/PEoMKUXstLjoPO0T
# MkeW/1Fr186KXD45QRgBo0xImgtWTdzWFnlD+p7+iDBIuSrNcRXDRYuq/aYZaDhW
# SI0SYdPIWVh5XvXuWA31a8oQ0SO+oPa3Nk80k0864wiiyJ1KsbSnaaefg9vspegh
# rpY8ljCwxfCUtx5HQRNgAJOI8IKACK4d014Mk0hlRO0lQVRHegqIg29K6Xqkc360
# W2ZJGUcstlKokkVj6KAHjGyrLRPzepYfiZUJq4gXyxbpvKb1XJ2FN2682aUoNXo9
# RyRK1ch0f66k6+yj88kzvuC7+vJWtNDs/UpIM6Hhm0kU64JUJ7MMEQcAc7kpft7G
# m7YeRK+oKgqUgYXCfmzbX8nJXJZnPa8ADWVsIqsuNAxCI0CZXkULofqo5Be6zzGC
# A9QwggPQAgEBMHgwYTELMAkGA1UEBhMCVVMxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
# b3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFB1YmxpYyBSU0EgVGltZXN0
# YW1waW5nIENBIDIwMjACEzMAAABZfNpx6Y1e9cAAAAAAAFkwDQYJYIZIAWUDBAIB
# BQCgggEtMBoGCSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
# IgQgtJ4+xZvS7Vn5+buPKnD1xSEqCzdslE8CIhUzAl1cYfIwgd0GCyqGSIb3DQEJ
# EAIvMYHNMIHKMIHHMIGgBCDLRbqx24bpscXEJ+Hjj9xrcUVw7R8OyyMfSB2YGK3+
# vDB8MGWkYzBhMQswCQYDVQQGEwJVUzEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
# cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUHVibGljIFJTQSBUaW1lc3RhbXBp
# bmcgQ0EgMjAyMAITMwAAAFl82nHpjV71wAAAAAAAWTAiBCACjos3WNNAlDnGB+u1
# j+TFVuADzLWfRYWTNcqQqegKeTANBgkqhkiG9w0BAQsFAASCAgBL5cDCjqrALP+a
# 9EWJkERWu/QuXqPXqm63EeEFvkWvI6KnmGwnCPsU4NqTaDf65yaVEfgXVePLvZP2
# 71RjWLwi3qG4Qeo+BLupfrhydGk4WGerou0kQOdL53oM32gqv+5AG0Xk/A3d+yuE
# Nk7NujhvIx8vixYDTuCSeiBb7gIieBgPgp+WxTOf37wYESXMPiBxHU/XNExj3BBb
# QxkZm9eH36tuuZK7CGsDEJNxJMBKsKz6qucb35zQzJ/GGtt6MZ2DtZFug3gpvsr3
# AKG1WLhe4bdw8nR9tnVvMoT9oFgIGXKgccS/FRk/pNAd8ElTzPXctVAumC4asI5r
# dIQq9D36GRssK8AoHuIFgb25cP9cEuYmX3H/ydxVUHJBOkSAK2sFJuV9SbdeeJrW
# IDoNcam+n39Wbe072d3rl6qssG7N1uJvhhlucjb+9w5eFDk2X2zpntz9oZz3j+G/
# EepaOstit0vBOzo5/160sPb0Ij47bgNz7J1S/B5etfNV2mKg17SwUP/z3C6ANw4U
# QkXICdoD8ds50UPd6Z6P3I+4kEmsn/W9kfxU8x2iIQYl8jmk+CU6GTWl9YS14QRY
# J9AnCzujaCZGh7p2hUVMGAwfXFL3hZeA9FGAanW49z+5kW1hCnCjzpHSTc0mb4bM
# RUDAm+TT3exA94xuDrGqlyZMAE5N6w==
# SIG # End signature block
