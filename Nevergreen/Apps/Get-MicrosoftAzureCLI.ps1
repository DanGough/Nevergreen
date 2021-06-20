$URL32 = (Resolve-Uri -Uri 'https://aka.ms/installazurecliwindows').Uri
$Version = $URL32 | Get-Version

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}