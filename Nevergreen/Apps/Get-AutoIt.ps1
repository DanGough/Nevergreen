$Version = (Invoke-WebRequest 'https://www.autoitscript.com/site/autoit/downloads' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'v((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.autoitscript.com/site/autoit/downloads' -MatchProperty href -Pattern 'autoit-v.+-setup\.exe' | Set-UriPrefix -Prefix 'https://www.autoitscript.com'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}