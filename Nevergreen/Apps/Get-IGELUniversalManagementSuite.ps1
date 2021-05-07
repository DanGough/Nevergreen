$ProgressPreference = 'SilentlyContinue'

$URL64 = ((Invoke-WebRequest 'https://www.igel.com/software-downloads/workspace-edition/' -UseBasicParsing).Links | Where-Object data-filename -Like '*setup-igel-ums-windows*.exe')[0].'data-filename'
$Version = $URL64 -replace '^.+setup-igel-ums-windows_(.+)\.exe$','$1'

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}