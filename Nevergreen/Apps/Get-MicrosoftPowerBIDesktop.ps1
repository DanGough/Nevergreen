$DownloadPageUri = 'https://www.microsoft.com/download/details.aspx?id=58494'
$JSONBlobPattern = '(?<scriptStart><script>[\w.]+__DLCDetails__=).*?(?<JSObject-scriptStart></script>)'

$Data = Invoke-WebRequest -Uri $DownloadPageUri `
    | Select-Object -Property 'Content' `
    | Select-String -Pattern $JSONBlobPattern `
    | Select-Object -ExpandProperty 'Matches' `
    | ForEach-Object {$_.Groups['JSObject'].Value} `
    | Select-Object -First 1 `
    | ConvertFrom-JSON

$Data.dlcDetailsView.downloadFile `
    | ForEach-Object {
            $Arch = 'x86'
            if ($_.name.EndsWith('x64.exe')) {
                $Arch = 'x64'
            }
            New-NeverGreenApp `
                -Name 'Microsoft Power BI Desktop' `
                -Version ([Version]$_.version) `
                -Uri $_.url `
                -Architecture $Arch `
                -Type 'Exe'
        }
