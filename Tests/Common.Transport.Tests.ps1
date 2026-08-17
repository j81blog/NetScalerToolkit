$modulePath = Join-Path -Path $PSScriptRoot -ChildPath '..\NetScalerToolkit\NetScalerToolkit.Common\NetScalerToolkit.Common.psd1'
Import-Module $modulePath -Force

Describe 'Common NITRO transport' {
    InModuleScope NetScalerToolkit.Common {
        BeforeAll {
        function New-TestNSSession {
            [pscustomobject] @{
                Name = 'UnitTest'
                ManagementUrl = 'https://ns.example.test'
                NitroApiVersion = 'v1'
                Version = '14.1'
                MetadataVersion = '14.1'
                DefaultHeaders = @{
                    'Content-Type' = 'application/json'
                    'Accept' = 'application/json'
                }
                AuthenticationMode = 'SessionCookie'
                Credential = $null
                WebSession = $null
                SkipCertificateCheck = $false
                LastResponse = $null
            }
        }

        function New-TestNitroResponse {
            param(
                [Parameter()]
                [object] $Response = ([pscustomobject] @{ errorcode = 0; message = 'Done'; severity = 'NONE' }),

                [Parameter()]
                [int] $StatusCode = 200,

                [Parameter()]
                [string] $Method = 'GET'
            )

            $result = [pscustomobject] @{
                Response = $Response
                StatusCode = $StatusCode
                StatusDescription = 'OK'
                Headers = @{}
                Uri = 'https://ns.example.test/nitro/v1/config/test'
                Method = $Method
                RequestHeaders = @{}
                RequestBody = $null
                RawContent = '{}'
                NitroErrorCode = $Response.errorcode
                NitroSeverity = $Response.severity
                NitroMessage = $Response.message
                StartedAt = Get-Date
                EndedAt = Get-Date
                DurationMs = 1
            }
            $result.PSObject.TypeNames.Insert(0, 'NetScalerToolkit.NitroResponse')
            foreach ($property in $Response.PSObject.Properties) {
                if ($result.PSObject.Properties.Name -notcontains $property.Name) {
                    $result | Add-Member -NotePropertyName $property.Name -NotePropertyValue $property.Value
                }
            }

            return $result
        }
        }

        BeforeEach {
            $script:CapturedRequests = [System.Collections.Generic.List[object]]::new()
            $script:Attempt = 0
        }

        It 'merges session headers, custom headers, and NITRO behavior headers' {
            Mock Invoke-NSRestMethod {
                $script:CapturedRequests.Add($Request)
                return New-TestNitroResponse -Response ([pscustomobject] @{
                    errorcode = 0
                    message = 'Done'
                    severity = 'NONE'
                    test = [pscustomobject] @{ name = 'item1' }
                }) -Method $Request.Method
            }

            $session = New-TestNSSession
            $result = Invoke-NSRestRequest -Session $session -Method GET -Task config -Type test -Headers @{ Accept = 'application/vnd.test+json'; 'X-Custom' = 'abc' } -NitroWarning yes -NitroOnError CONTINUE

            $result.name | Should -Be 'item1'
            $script:CapturedRequests.Count | Should -Be 1
            $request = $script:CapturedRequests[0]
            $request.Headers['Content-Type'] | Should -Be 'application/json'
            $request.Headers['Accept'] | Should -Be 'application/vnd.test+json'
            $request.Headers['X-Custom'] | Should -Be 'abc'
            $request.Headers['X-NITRO-WARNING'] | Should -Be 'yes'
            $request.Headers['X-NITRO-ONERROR'] | Should -Be 'CONTINUE'
            $session.LastResponse.PSObject.TypeNames | Should -Contain 'NetScalerToolkit.NitroResponse'
        }

        It 'returns null for ignored NITRO not-found responses' {
            $response = New-TestNitroResponse -StatusCode 404 -Response ([pscustomobject] @{
                errorcode = 258
                message = 'No such resource'
                severity = 'ERROR'
            })

            $result = ConvertFrom-NSNitroResponse -Response $response -Type test -Uri $response.Uri -IgnoreNotFound

            $result | Should -BeNullOrEmpty
        }

        It 'returns null when a system user does not exist' {
            # Through Invoke-NSRestRequest, which carries its own copy of the not-found list.
            Mock Invoke-NSRestMethod {
                return New-TestNitroResponse -StatusCode 599 -Response ([pscustomobject] @{
                    errorcode = 2626
                    message = 'User does not exist'
                    severity = 'ERROR'
                }) -Method $Request.Method
            }

            $session = New-TestNSSession
            $result = Invoke-NSRestRequest -Session $session -Method GET -Task config -Type systemuser -Resource 'NoSuchUser' -ReturnNullOnNotFound

            $result | Should -BeNullOrEmpty
        }

        It 'suggests SkipCertificateCheck when the TLS handshake is rejected' {
            Mock Invoke-WebRequest {
                $inner = [System.Security.Authentication.AuthenticationException]::new('The remote certificate is invalid according to the validation procedure.')
                throw [System.InvalidOperationException]::new('The SSL connection could not be established, see inner exception.', $inner)
            }

            $request = @{ Uri = 'https://ns.example.test/nitro/v1/config/login'; Method = 'POST' }

            { Invoke-NSRestMethod -Request $request } | Should -Throw -ExpectedMessage '*-SkipCertificateCheck*'
        }

        It 'does not suggest SkipCertificateCheck when it is already set' {
            Mock Invoke-WebRequest {
                $inner = [System.Security.Authentication.AuthenticationException]::new('The remote certificate is invalid according to the validation procedure.')
                throw [System.InvalidOperationException]::new('The SSL connection could not be established, see inner exception.', $inner)
            }

            $request = @{ Uri = 'https://ns.example.test/nitro/v1/config/login'; Method = 'POST' }

            $thrown = $null
            try {
                Invoke-NSRestMethod -Request $request -SkipCertificateCheck
            } catch {
                $thrown = $_
            }

            $thrown | Should -Not -BeNullOrEmpty
            $thrown.Exception.Message | Should -Not -BeLike '*-SkipCertificateCheck*'
        }

        It 'throws a structured error record for NITRO failures' {
            $response = New-TestNitroResponse -StatusCode 400 -Response ([pscustomobject] @{
                errorcode = 273
                message = 'Invalid argument'
                severity = 'ERROR'
            })

            try {
                ConvertFrom-NSNitroResponse -Response $response -Type lbvserver -Uri $response.Uri -Task config -Resource test -Action update
                throw 'Expected ConvertFrom-NSNitroResponse to throw.'
            } catch {
                $_.FullyQualifiedErrorId | Should -Be 'NetScalerNitroRequestFailed'
                $_.Exception.Data['NitroErrorCode'] | Should -Be 273
                $_.Exception.Data['Type'] | Should -Be 'lbvserver'
                $_.Exception.Data['Task'] | Should -Be 'config'
                $_.Exception.Data['Resource'] | Should -Be 'test'
                $_.Exception.Data['Action'] | Should -Be 'update'
                $_.Exception.Data['HttpStatusCode'] | Should -Be 400
            }
        }

        It 'writes warnings by default and can throw on warning severity' {
            $response = New-TestNitroResponse -Response ([pscustomobject] @{
                errorcode = 0
                message = 'Minor warning'
                severity = 'WARNING'
            })

            { ConvertFrom-NSNitroResponse -Response $response -Type test -Uri $response.Uri -WarningAction Stop } | Should -Throw -ExpectedMessage '*Minor warning*'
            { ConvertFrom-NSNitroResponse -Response $response -Type test -Uri $response.Uri -ThrowOnWarning } | Should -Throw -ErrorId 'NetScalerNitroRequestFailed'
        }

        It 'retries safe methods for selected HTTP status codes' {
            Mock Invoke-NSRestMethod {
                $script:CapturedRequests.Add($Request)
                $script:Attempt++
                if ($script:Attempt -eq 1) {
                    return New-TestNitroResponse -StatusCode 503 -Response ([pscustomobject] @{
                        errorcode = 0
                        message = 'Service unavailable'
                        severity = 'NONE'
                    }) -Method $Request.Method
                }

                return New-TestNitroResponse -StatusCode 200 -Response ([pscustomobject] @{
                    errorcode = 0
                    message = 'Done'
                    severity = 'NONE'
                    test = [pscustomobject] @{ name = 'retried' }
                }) -Method $Request.Method
            }

            $session = New-TestNSSession
            $result = Invoke-NSRestRequest -Session $session -Method GET -Task config -Type test -RetryCount 1 -RetryDelaySeconds 1

            $result.name | Should -Be 'retried'
            $script:CapturedRequests.Count | Should -Be 2
        }

        It 'does not retry unsafe methods unless requested' {
            Mock Invoke-NSRestMethod {
                $script:CapturedRequests.Add($Request)
                return New-TestNitroResponse -StatusCode 503 -Response ([pscustomobject] @{
                    errorcode = 0
                    message = 'Service unavailable'
                    severity = 'NONE'
                }) -Method $Request.Method
            }

            $session = New-TestNSSession
            { Invoke-NSRestRequest -Session $session -Method POST -Task config -Type test -Payload @{ test = @{ name = 'x' } } -RetryCount 1 } | Should -Throw -ErrorId 'NetScalerNitroRequestFailed'
            $script:CapturedRequests.Count | Should -Be 1
        }

        It 'keeps raw response payload fields available at top level' {
            Mock Invoke-NSRestMethod {
                return New-TestNitroResponse -Response ([pscustomobject] @{
                    errorcode = 0
                    message = 'Done'
                    severity = 'NONE'
                    nsversion = [pscustomobject] @{ version = 'NetScaler NS13.1: Build 63.16.nc' }
                }) -Method $Request.Method
            }

            $session = New-TestNSSession
            $response = Invoke-NSRestRequest -Session $session -Method GET -Task config -Type nsversion -RawResponse

            $response.PSObject.TypeNames | Should -Contain 'NetScalerToolkit.NitroResponse'
            $response.nsversion.version | Should -Be 'NetScaler NS13.1: Build 63.16.nc'
        }

        It 'keeps NITRO args separators literal while encoding argument values' {
            Mock Invoke-NSRestMethod {
                $script:CapturedRequests.Add($Request)
                return New-TestNitroResponse -Response ([pscustomobject] @{
                    errorcode = 0
                    message = 'Done'
                    severity = 'NONE'
                }) -Method $Request.Method
            }

            $session = New-TestNSSession
            Invoke-NSRestRequest -Session $session -Method DELETE -Task config -Type systemfile -Resource 'TST-fullchain.pfx' -Query @{ args = 'filelocation:/nsconfig/ssl/' } -RawResponse | Out-Null

            $script:CapturedRequests.Count | Should -Be 1
            $script:CapturedRequests[0].Uri | Should -Be 'https://ns.example.test/nitro/v1/config/systemfile/TST-fullchain.pfx?args=filelocation:%2Fnsconfig%2Fssl%2F'
        }

        It 'validates every item in generated array parameters' {
            { Assert-NSParameterValue -ParameterName Feature -Value @('LB', 'RESPONDER') -AllowedValuesByVersion @{ '14.1' = @('LB', 'RESPONDER', 'CS') } -MetadataVersion '14.1' } | Should -Not -Throw
            { Assert-NSParameterValue -ParameterName Feature -Value @('LB', 'UNKNOWN') -AllowedValuesByVersion @{ '14.1' = @('LB', 'RESPONDER', 'CS') } -MetadataVersion '14.1' } | Should -Throw -ExpectedMessage '*UNKNOWN*'
        }

        It 'continues when HA secondary session attachment fails' {
            Mock Connect-NSNode {
                throw 'Unable to connect to secondary node.'
            } -ParameterFilter {
                $ManagementUrl -like 'https://10.0.0.2/*'
            }
            Mock Write-Warning {}

            $credential = [pscredential]::new('nsroot', (ConvertTo-SecureString 'unit-test' -AsPlainText -Force))
            $session = [pscustomobject] @{
                ManagementUrl = 'https://lb.example.test/'
                IsHA = $true
                IsSecondary = $false
                ConnectedNodeIP = '10.0.0.1'
                PrimaryIP = '10.0.0.1'
                SecondaryIP = '10.0.0.2'
                PrimarySession = $null
                SecondarySession = $null
                HAInfo = [pscustomobject] @{
                    PrimaryNode = [pscustomobject] @{ id = 0; state = 'PRIMARY' }
                    SecondaryNode = [pscustomobject] @{ id = 1; state = 'SECONDARY' }
                }
            }

            $result = Connect-NSHANodeSessions -Session $session -Credential $credential

            $result.PrimarySession | Should -Not -BeNullOrEmpty
            $result.SecondarySession | Should -BeNullOrEmpty
            Should -Invoke Write-Warning -Times 1 -ParameterFilter { $Message -like 'Unable to attach secondary HA session*' }
        }

        It 'throws when connected to secondary and failover to primary cannot be established' {
            Mock Connect-NSNode {
                throw 'Primary node is unreachable.'
            } -ParameterFilter {
                $ManagementUrl -like 'https://10.0.0.1/*'
            }

            $credential = [pscredential]::new('nsroot', (ConvertTo-SecureString 'unit-test' -AsPlainText -Force))
            $session = [pscustomobject] @{
                ManagementUrl = 'https://10.0.0.2/'
                IsHA = $true
                IsSecondary = $true
                ConnectedNodeIP = '10.0.0.2'
                PrimaryIP = '10.0.0.1'
                SecondaryIP = '10.0.0.2'
            }

            { Connect-NSHANodeSessions -Session $session -Credential $credential } | Should -Throw -ExpectedMessage '*Primary node is unreachable*'
        }
    }
}
