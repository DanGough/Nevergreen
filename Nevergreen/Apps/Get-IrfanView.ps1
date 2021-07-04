try {
    $Version = Get-Version -Uri 'https://www.irfanview.com/main_history.htm' -Pattern 'Version ((?:\d+\.)+\d+)'

    $Apps = @(
        @{Name = 'IrfanView'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_x64_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView Plugins'; Architecture = 'x86'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_plugins_setup\.exe$'; Language = 'English' }
        @{Name = 'IrfanView Plugins'; Architecture = 'x64'; Type = 'Exe'; Uri = 'https://www.fosshub.com/IrfanView.html'; Pattern = 'iview\d+_plugins_x64_setup\.exe$'; Language = 'English' }
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