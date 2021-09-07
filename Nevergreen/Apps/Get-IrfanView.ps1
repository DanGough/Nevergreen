try {
    $Version = Get-Version -Uri 'https://www.irfanview.com/main_history.htm' -Pattern 'Version ((?:\d+\.)+\d+)'

    $Apps = @(
        @{Name = 'IrfanView'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_x64_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView Plugins'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_plugins_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView Plugins'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_plugins_x64_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_deutsch\.exe$'; Language = 'Deutsch-German' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_deutsch\.zip$'; Language = 'Deutsch-German' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_russian\.exe$'; Language = 'Russian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_russian\.zip$'; Language = 'Russian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_chinese\.exe$'; Language = 'Chinese' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_chinese\.zip$'; Language = 'Chinese' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_spanish\.exe$'; Language = 'Spanish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_spanish\.zip$'; Language = 'Spanish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portugues-Brasil\.exe$'; Language = 'Portugues-Brasil' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portugues-Brasil\.zip$'; Language = 'Portugues-Brasil' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_japanese\.exe$'; Language = 'Japanese' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_japanese\.zip$'; Language = 'Japanese' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_italian\.exe$'; Language = 'Italian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_italian\.zip$'; Language = 'Italian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_nederlands\.exe$'; Language = 'Nederlands' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_nederlands\.zip$'; Language = 'Nederlands' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_polski\.exe$'; Language = 'Polski' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_polski\.zip$'; Language = 'Polski' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portuguese\.exe$'; Language = 'Portuguese' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_portuguese\.zip$'; Language = 'Portuguese' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_ukrainian\.exe$'; Language = 'Ukrainian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_ukrainian\.zip$'; Language = 'Ukrainian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_finnish\.exe$'; Language = 'Finnish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_finnish\.zip$'; Language = 'Finnish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hungarian\.exe$'; Language = 'Hungarian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hungarian\.zip$'; Language = 'Hungarian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_czech\.exe$'; Language = 'Czech/Cesky' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_czech\.zip$'; Language = 'Czech/Ceskyi' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_french\.exe$'; Language = 'French' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_french\.zip$'; Language = 'French' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovak\.exe$'; Language = 'Slovak' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovak\.zip$'; Language = 'Slovak' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_arabic\.exe$'; Language = 'Arabic' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_arabic\.zip$'; Language = 'Arabic' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_estonian\.exe$'; Language = 'Estonian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_estonian\.exe$'; Language = 'Estonian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovenscina\.zip$'; Language = 'Slovenscina' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_slovenscina\.exe$'; Language = 'Slovenscina' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_romanian\.zip$'; Language = 'Romanian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_romanian\.exe$'; Language = 'Romanian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_turkish\.zip$'; Language = 'Turkish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_turkish\.exe$'; Language = 'Turkish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_lithuanian\.exe$'; Language = 'Lithuanian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_lithuanian\.zip$'; Language = 'Lithuanian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_swedish\.exe$'; Language = 'Svenska/Swedish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_swedish\.zip$'; Language = 'Svenska/Swedish' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hebrew\.exe$'; Language = 'Hebrew' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_hebrew\.zip$'; Language = 'Hebrew' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_bulgarian\.exe$'; Language = 'Bulgarian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_bulgarian\.zip$'; Language = 'Bulgarian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_catalan\.exe$'; Language = 'Catalan' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_catalan\.zip$'; Language = 'Catalan' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_korean\.exe$'; Language = 'Korean' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_korean\.zip$'; Language = 'Korean' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_english_gb\.exe$'; Language = 'English-British' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_english_gb\.zip$'; Language = 'English-British' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_dansk\.exe$'; Language = 'Dansk' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_dansk\.zip$'; Language = 'Dansk' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_latvian\.exe$'; Language = 'Latvian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_latvian\.zip$'; Language = 'Latvian' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_uzbek\.exe$'; Language = 'Uzbek' }
        @{Name = 'IrfanView Language'; Architecture = 'x86'; Type = 'Zip'; Uri = 'https://www.irfanview.com/languages.htm'; Pattern = 'irfanview_lang_uzbek\.zip$'; Language = 'Uzbek' }
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