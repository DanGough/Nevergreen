$VDILinks = (Invoke-WebRequest -Uri 'https://support.zoom.us/hc/en-us/articles/4415057249549' -UseBasicParsing -UserAgent 'Googlebot/2.1 (+http://www.google.com/bot.html)').Links

$Apps = @(
    @{Name = 'Zoom VDI Client'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomInstallerVDI.+?msi$' }
    @{Name = 'Zoom VDI Client'; Architecture = 'x64'; Type = 'Msi'; Pattern = 'ZoomInstallerVDI.+?msi\?archType.+x64$' }
    @{Name = 'Zoom Citrix Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomCitrixHDXMediaPlugin\.msi$' }
    @{Name = 'Zoom VDI Universal Plugin'; Architecture = 'x86'; Type = 'Msi'; Pattern = 'ZoomVDIUniversalPlugin.+?msi$' }
    @{Name = 'Zoom VDI Universal Plugin'; Architecture = 'x64'; Type = 'Msi'; Pattern = 'ZoomVDIUniversalPlugin.+?msi\?archType.+x64$' }
)

foreach ($App in $Apps) {
    $URL = $VDILinks | Where-Object href -Match $App.Pattern | Select-Object -ExpandProperty href -First 1
    $Version = $URL | Get-Version

    if ($URL -and $Version) {
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    else {
        Write-Warning -Message "Unable to retrieve details for $($App.Name) $($App.Architecture) $($App.Type)"
    }
}