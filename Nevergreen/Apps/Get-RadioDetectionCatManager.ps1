$Response = Invoke-WebRequest -Uri 'https://www.radiodetection.com/en-gb/resources/software-downloads/cat4-manager' -UseBasicParsing

$Version = ($Response.Content | Select-String -Pattern 'Version:\s((?:\d+\.)+(?:\d+))<').Matches.Groups[1].Value
$URL32 = $Response.Links | Where-Object href -Like '*.zip*' | Select-Object -First 1 -ExpandProperty href

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}