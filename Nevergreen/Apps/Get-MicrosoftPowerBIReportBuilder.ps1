$DownloadPageUri = 'https://www.microsoft.com/en-us/download/details.aspx?id=105942'
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
            New-NeverGreenApp `
                -Name 'Microsoft Power BI Report Builder' `
                -Version ([Version]$_.version) `
                -Uri $_.url `
                -Architecture 'x86' `
                -Type 'Msi'
        }
