$Platforms = @(
    @{Architecture = 'x86'; Language = 'Neutral'; Pattern = 'AcroRdrDCUpd\d{8,12}\.msp'}
    @{Architecture = 'x86'; Language = 'Multi'; Pattern = 'AcroRdrDCUpd\d{8,12}_MUI\.msp'}
    @{Architecture = 'x64'; Language = 'Neutral'; Pattern = 'AcroRdrDCx64Upd\d{8,12}\.msp'}
)

foreach ($Platform in $Platforms) {

    $ReleaseURL = 'https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html'
    $SearchCount = 5

    do {
        $ReleaseURL = Get-Link -Uri $ReleaseURL -Headers @{"accept-language"="en-GB,en;q=0.9,en-US;q=0.8"} -MatchProperty outerHTML -Pattern '>Next' -PrefixParent

        $URL = Get-Link -Uri $ReleaseURL -Headers @{"accept-language"="en-GB,en;q=0.9,en-US;q=0.8"} -MatchProperty href -Pattern $Platform.Pattern
        if ($URL) {
            $Version = ($URL | Get-Version -Pattern '(\d{8,12}).+msp') -replace '(\d{2})(\d{3})(\d+)','$1.$2.$3'
            New-NevergreenApp -Name 'Adobe Acrobat Reader' -Version $Version -Uri $URL -Architecture $Platform.Architecture -Language $Platform.Language -Type 'Msp'
            break
        }

        $SearchCount--
    } until ($SearchCount -eq 0)

    if ($SearchCount -eq 0) {
        Write-Warning "Could not find release for Adobe Acrobat Reader $($Platform.Architecture) $($Platform.Language)"
    }

}