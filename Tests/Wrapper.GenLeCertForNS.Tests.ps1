Describe 'GenLeCertForNS wrapper compatibility' {
    BeforeAll {
        $script:WrapperPath = (Resolve-Path -LiteralPath (Join-Path -Path $PSScriptRoot -ChildPath '..\GenLeCertForNS.ps1')).Path
    }

    It 'contains SkipCertificateCheck injection guard for eligible operations' {
        $content = Get-Content -LiteralPath $script:WrapperPath -Raw

        $content | Should -Match '\$skipCertificateCheckEligible\s+-and\s+-not\s+\$skipCertificateCheckSpecified'
        $content | Should -Match '&\s+\$commandName\s+-SkipCertificateCheck\s+@args'
    }

    It 'contains explicit detection for user-supplied SkipCertificateCheck' {
        $content = Get-Content -LiteralPath $script:WrapperPath -Raw

        ($content -like "*-ieq '-SkipCertificateCheck'*") | Should -BeTrue
        ($content -like "*-match '^-SkipCertificateCheck:.+$'*") | Should -BeTrue
    }

    It 'contains AutoUpdate argument detection and forwards original arguments' {
        $content = Get-Content -LiteralPath $script:WrapperPath -Raw

        ($content -like "*-ieq '-AutoUpdate'*") | Should -BeTrue
        $content | Should -Match '&\s+\$commandName\s+@args'
    }

    It 'contains clean-expired handling that marks SkipCertificateCheck as ineligible' {
        $content = Get-Content -LiteralPath $script:WrapperPath -Raw

        $content | Should -Match "'-CleanAllExpiredCertsOnDisk'"
        $content | Should -Match '\$cleanAllExpiredRequested\s+=\s+\$true'
    }

    It 'shows compatibility warning when CleanAllExpiredCertsOnDisk is used' {
        function global:Request-NSACMECertificate { [PSCustomObject]@{ Status = 'Stub' } }
        try {
            Mock Import-Module {}
            Mock Write-Warning {}

            . $script:WrapperPath -CleanAllExpiredCertsOnDisk -CertDir 'C:\Certs' | Out-Null

            Should -Invoke Write-Warning -Times 1 -ParameterFilter { $Message -like '*forwarding -CleanAllExpiredCertsOnDisk*' }
        } finally {
            Remove-Item -Path Function:\global:Request-NSACMECertificate -ErrorAction SilentlyContinue
        }
    }
}
