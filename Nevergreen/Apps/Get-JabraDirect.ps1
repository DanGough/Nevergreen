try {
    $Version = Get-Version -Uri 'https://www.jabra.com/Support/release-notes/release-note-jabra-direct' -UserAgent 'Googlebot/2.1 (+http://www.google.com/bot.html)' -Pattern '((?:\d+\.)+\d+)<br>'
    $URL = Get-Link -Uri 'https://www.jabra.com/software-and-services/jabra-direct' -MatchProperty href -Pattern '/Jabra.+\.exe$'

    New-NevergreenApp -Name 'Jabra Direct' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'Exe'
}
catch {
    Write-Error "$($MyInvocation.MyCommand): $($_.Exception.Message)"
}