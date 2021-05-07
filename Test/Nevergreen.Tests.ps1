$PSModulePath = [System.IO.Path]::Combine((Split-Path -Path $PSScriptRoot -Parent), 'Nevergreen')
$ModuleManifestPath = [System.IO.Path]::Combine($PSModulePath, 'Nevergreen.psd1')

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should -Not -BeNullOrEmpty
        $? | Should -Be $true
    }
}
