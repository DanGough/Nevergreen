$VDILinks = (Invoke-WebRequest -Uri 'https://support.zoom.us/hc/en-us/articles/4415057249549' -UseBasicParsing).Links

$Apps = @(
    @{Name = 'Zoom VDI Client'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomInstallerVDI\.msi$' }
    @{Name = 'Zoom Citrix Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomCitrixHDXMediaPlugin\.msi$' }
    @{Name = 'Zoom VMware Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomVmwareMediaPlugin\.msi$' }
    @{Name = 'Zoom AVD Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomWVDMediaPlugin\.msi$' }
    @{Name = 'Zoom Amazon Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomVDIUniversalPlugin\.msi$' }
    @{Name = 'Zoom VDI Log Tool'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomVDITool\.exe$' }
)

foreach ($App in $Apps) {
    $URL = $VDILinks | Where-Object href -Match $App.Pattern | Select-Object -ExpandProperty href -First 1
    $Version = $VDILinks | Where-Object href -Match $App.Pattern | Select-Object -ExpandProperty outerHTML -First 1 | Get-Version -Pattern '((?:\d+\.)+\d+)<'

    if ($URL -and $Version) {
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    else {
        Write-Warning -Message "Unable to retrieve details for $($App.Name)"
    }
}