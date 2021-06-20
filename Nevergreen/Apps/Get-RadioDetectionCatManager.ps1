$Version = (Invoke-WebRequest -Uri 'https://www.radiodetection.com/en-gb/resources/software-downloads/cat4-manager' -DisableKeepAlive -UseBasicParsing).Content | Get-Version -Pattern 'Version: ((?:\d+\.)+\d+)'

$URL32 = Get-Link -Uri 'https://www.radiodetection.com/en-gb/resources/software-downloads/cat4-manager' -MatchProperty href -Pattern '\.zip'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}