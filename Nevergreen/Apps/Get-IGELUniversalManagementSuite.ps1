$URL64 = Get-Link -Uri 'https://www.igel.com/software-downloads/workspace-edition/' -MatchProperty 'data-filename' -Pattern 'setup-igel-ums-windows.+\.exe' -ReturnProperty 'data-filename'
$Version = $URL64 | Get-Version

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}