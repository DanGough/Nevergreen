$Apps = @(
    @{Name = 'K-Lite Codec Pack'; Channel ='Basic'; Architecture = 'Multi'; Type = 'Exe'; Uri = 'https://www.codecguide.com/download_k-lite_codec_pack_basic.htm' }
    @{Name = 'K-Lite Codec Pack'; Channel ='Standard'; Architecture = 'Multi'; Type = 'Exe'; Uri = 'https://www.codecguide.com/download_k-lite_codec_pack_standard.htm' }
    @{Name = 'K-Lite Codec Pack'; Channel ='Full'; Architecture = 'Multi'; Type = 'Exe'; Uri = 'https://www.codecguide.com/download_k-lite_codec_pack_full.htm' }
    @{Name = 'K-Lite Codec Pack'; Channel ='Mega'; Architecture = 'Multi'; Type = 'Exe'; Uri = 'https://www.codecguide.com/download_k-lite_codec_pack_mega.htm' }
)

foreach ($App in $Apps) {
    try {
        $Version = Get-Version -Uri $App.Uri -Pattern 'Version ((?:\d+\.)+\d+)'
        $URL = Get-Link -Uri $App.Uri -MatchProperty href -Pattern "\.$($App.Type)$"
        New-NevergreenApp -Name $App.Name -Version $Version -Uri $URL -Channel $App.Channel -Architecture $App.Architecture -Type $App.Type
    }
    catch {
        Write-Error "$($MyInvocation.MyCommand): Error querying '$($App.Uri)': $($_.Exception.Message)"
    }
}