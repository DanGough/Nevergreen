$Apps = @(
    @{Architecture = 'x64'; Type = 'Zip'; Pattern = 'Notepad3_((?:\d+\.)+\d+)_Setup\.zip'}
    @{Architecture = 'x86'; Type = 'Zip'; Pattern = 'Notepad3_((?:\d+\.)+\d+)_x86_Setup\.zip'}
)

try {

    $Links = (Invoke-WebRequest -Uri 'https://www.rizonesoft.com/downloads/notepad3/' -DisableKeepAlive -UseBasicParsing).Links

    foreach ($App in $Apps) {
        $URL = $Links | Where-Object outerHTML -match $App.Pattern | Select-Object -ExpandProperty href -First 1
        if ($URL) {
            $Version = $matches[1]
            New-NevergreenApp -Name 'Notepad3' -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
        }
    }

}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}