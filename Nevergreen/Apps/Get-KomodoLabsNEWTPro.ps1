$Version = (Invoke-WebRequest 'https://www.komodolabs.com/product-downloads' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'NEWT Professional v((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.komodolabs.com/product-downloads' -MatchProperty href -Pattern 'newtpro\.exe$' | Set-UriPrefix -Prefix 'https://www.komodolabs.com'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}