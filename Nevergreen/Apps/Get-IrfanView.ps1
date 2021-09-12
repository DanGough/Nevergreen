try {
    $Version = Get-Version -Uri 'https://www.irfanview.com/main_history.htm' -Pattern 'Version ((?:\d+\.)+\d+)'

    $Apps = @(
        @{Name = 'IrfanView'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_setup\.exe$'; Language = 'en' }
        @{Name = 'IrfanView'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_x64_setup\.exe$'; Language = 'en' }
        @{Name = 'IrfanView Plugins'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_plugins_setup\.exe$'; Language = 'en' }
        @{Name = 'IrfanView Plugins'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_plugins_x64_setup\.exe$'; Language = 'en' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_deutsch\.exe$'; Language = 'de' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_deutsch\.zip$'; Language = 'de' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_russian\.exe$'; Language = 'ru' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_russian\.zip$'; Language = 'ru' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_chinese\.exe$'; Language = 'zh' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_chinese\.zip$'; Language = 'zh' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_spanish\.exe$'; Language = 'es' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_spanish\.zip$'; Language = 'es' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portugues-Brasil\.exe$'; Language = 'pt-BR' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portugues-Brasil\.zip$'; Language = 'pt-BR' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_japanese\.exe$'; Language = 'ja' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_japanese\.zip$'; Language = 'ja' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_italian\.exe$'; Language = 'it' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_italian\.zip$'; Language = 'it' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_nederlands\.exe$'; Language = 'nl-NL' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_nederlands\.zip$'; Language = 'nl-NL' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_polski\.exe$'; Language = 'pl' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_polski\.zip$'; Language = 'pl' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portuguese\.exe$'; Language = 'pt-PT' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portuguese\.zip$'; Language = 'pt-PT' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_ukrainian\.exe$'; Language = 'uk' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_ukrainian\.zip$'; Language = 'uk' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_finnish\.exe$'; Language = 'fi' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_finnish\.zip$'; Language = 'fi' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hungarian\.exe$'; Language = 'hu' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hungarian\.zip$'; Language = 'hu' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_czech\.exe$'; Language = 'cs' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_czech\.zip$'; Language = 'cs' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_french\.exe$'; Language = 'fr' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_french\.zip$'; Language = 'fr' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovak\.exe$'; Language = 'sk' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovak\.zip$'; Language = 'sk' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_arabic\.exe$'; Language = 'ar' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_arabic\.zip$'; Language = 'ar' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_estonian\.exe$'; Language = 'et' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_estonian\.exe$'; Language = 'et' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovenscina\.zip$'; Language = 'sl' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovenscina\.exe$'; Language = 'sl' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_romanian\.zip$'; Language = 'ro' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_romanian\.exe$'; Language = 'ro' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_turkish\.zip$'; Language = 'tr' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_turkish\.exe$'; Language = 'tr' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_lithuanian\.exe$'; Language = 'lt' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_lithuanian\.zip$'; Language = 'lt' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_swedish\.exe$'; Language = 'sv' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_swedish\.zip$'; Language = 'sv' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hebrew\.exe$'; Language = 'he' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hebrew\.zip$'; Language = 'he' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_bulgarian\.exe$'; Language = 'bg' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_bulgarian\.zip$'; Language = 'bg' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_catalan\.exe$'; Language = 'ca' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_catalan\.zip$'; Language = 'ca' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_korean\.exe$'; Language = 'ko' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_korean\.zip$'; Language = 'ko' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_english_gb\.exe$'; Language = 'en-GB' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_english_gb\.zip$'; Language = 'en-GB' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_dansk\.exe$'; Language = 'da' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_dansk\.zip$'; Language = 'da' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_latvian\.exe$'; Language = 'lv' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_latvian\.zip$'; Language = 'lv' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_uzbek\.exe$'; Language = 'uz' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_uzbek\.zip$'; Language = 'uz' }
    )

    foreach ($App in $Apps) {
        try {
            $URL = Get-Link -Uri $App.Uri -MatchProperty href -Pattern $App.Pattern
            New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type -Language $App.Language
        }
        catch {
        }
    }

}
catch {
    Write-Error "$($MyInvocation.MyCommand): Error querying 'https://www.irfanview.com/main_history.htm': $($_.Exception.Message)"
}