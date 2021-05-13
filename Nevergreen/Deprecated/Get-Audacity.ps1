$Resp = Invoke-WebRequest -Uri 'https://www.audacityteam.org/download/windows/' -UseBasicParsing
$Version = ($Resp.Content | Select-String -Pattern 'Current\sVersion:\s(.+)<').Matches.Groups[1].Value
$URL = ($Resp.Content | Select-String -Pattern '<a\shref="(.+)">direct\slink</a>').Matches.Groups[1].Value

if ($Version -and $URL) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL
    }
}