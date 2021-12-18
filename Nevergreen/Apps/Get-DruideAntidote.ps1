$Apps = @(
    @{Name = 'Antidote'; Architecture = 'x86'; Type = 'Msp'; Pattern = 'Diff_Antidote_10_C_(?:\d+\.)+(?:\d+)\.msp$' }
    @{Name = 'Antidote French Module'; Architecture = 'x86'; Type = 'Msp'; Pattern = 'Diff_Antidote_10_Module_F_(?:\d+\.)+(?:\d+)\.msp$' }
    @{Name = 'Antidote English Module'; Architecture = 'x86'; Type = 'Msp'; Pattern = 'Diff_Antidote_10_Module_E_(?:\d+\.)+(?:\d+)\.msp$' }
    @{Name = 'Connectix'; Architecture = 'x86'; Type = 'Msp'; Pattern = 'Diff_Connectix_10_C_(?:\d+\.)+(?:\d+)\.msp$' }
)

foreach ($App in $Apps) {
    try {
        $URL = Get-Link -Uri 'https://www.antidote.info/fr/assistance/mises-a-jour/installation/antidote-10/windows' -MatchProperty href -Pattern $App.Pattern
        $Version = $URL  | Get-Version
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }
}

    try {
        $URL = 'https://telechargement.druide.com/telecharger/Reseau/antidote_10/GestionnaireMultiposte_Antidote10.exe'
        New-NevergreenApp -Name 'Multi-User Manager' -Version $Version -Uri $URL -Architecture 'x86' -Type 'Exe'
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
    }