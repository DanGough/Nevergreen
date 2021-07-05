try {
    $Version = Get-Version -Uri 'https://www.jabra.co.uk/Support/release-notes/release-note-jabra-direct' -Pattern 'Release version:.+\s((?:\d+\.)+\d+)'
    $URL = Get-Link -Uri 'https://www.jabra.co.uk/software-and-services/jabra-direct' -MatchProperty href -Pattern '/.+Direct.+\.exe$'

    New-NevergreenApp -Name 'Jabra Direct' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}