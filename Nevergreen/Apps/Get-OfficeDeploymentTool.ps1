# Get Office Deployment Tool details by using the JSON-Object of the
# Javascript to get the download details.
$DownloadPageUri = 'https://www.microsoft.com/en-us/download/details.aspx?id=49117'
# Pattern to get the JSON-Object by matching the
# script start block + variable declaration to the script end block.
$JSONBlobPattern = '(?<scriptStart><script>[\w.]+__DLCDetails__=).*?(?<JSObject-scriptStart></script>)'

$Data = Invoke-WebRequest -Uri $DownloadPageUri `
    | Select-Object -Property 'Content' `
    | Select-String -Pattern $JSONBlobPattern `
    | Select-Object -ExpandProperty 'Matches' `
    | ForEach-Object {$_.Groups['JSObject'].Value} `
    | Select-Object -First 1 `
    | ConvertFrom-JSON

New-NeverGreenApp `
    -Name 'Office Deployment Tool' `
    -Uri $Data.dlcDetailsView.downloadFile.url `
    -Version $Data.dlcDetailsView.downloadFile.Version `
    -Architecture 'Multi' `
    -Type 'Exe'
