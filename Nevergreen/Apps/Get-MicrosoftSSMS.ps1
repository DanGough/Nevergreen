$URL64 = 'https://aka.ms/ssmsfullsetup'

$Version = ((Invoke-WebRequest 'https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15' -UseBasicParsing).Content | Select-String -Pattern '<li>Release\snumber:\s((?:\d+\.)+(?:\d+))</li>').Matches.Groups[1].Value

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}