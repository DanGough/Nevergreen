$Resp = Invoke-WebRequest -Uri 'https://www.radiodetection.com/en-gb/resources/software-downloads/cat4-manager' -UseBasicParsing

$Version = ($Resp.Content | Select-String -Pattern 'Version:\s(.+)<').Matches.Groups[1].Value
$URL32 = $Resp.Links | Where-Object href -Like '*.zip*' | Select-Object -First 1 -ExpandProperty href

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}