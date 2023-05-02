# Getting intermittent certificate errors from this URL. -SkipCertificateCheck on Invoke-WebRequest resolves it but that is PS7 only.
# Have seen up to 31 retries needed, so a 50 retry loop implemented!

$RetryCount = 50

for ($i = 0; $i -lt $RetryCount; $i++) {
    try {
        $Version = Get-Version -Uri 'https://www.jabra.com/Support/release-notes/release-note-jabra-direct' -UserAgent 'Googlebot/2.1 (+http://www.google.com/bot.html)' -Pattern '((?:\d+\.)+\d+)<br>' -ErrorAction Stop
        $URL = Get-Link -Uri 'https://www.jabra.com/software-and-services/jabra-direct' -MatchProperty href -Pattern '/Jabra.+\.exe$' -ErrorAction Stop
        New-NevergreenApp -Name 'Jabra Direct' -Version $Version -Uri $URL -Architecture 'Multi' -Type 'exe'
        return
    }
    catch {
        Write-Verbose "Attempt $($i+1) failed, retrying... $_"
    }
}
Write-Error $error[0]