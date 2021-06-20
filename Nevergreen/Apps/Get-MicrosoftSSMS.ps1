$URL64 = 'https://aka.ms/ssmsfullsetup'

$Version = (Invoke-WebRequest 'https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15' -UseBasicParsing).Content | Get-Version -Pattern 'Release number: ((?:\d+\.)+\d+)'

if ($Version -and $URL64) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x64'
        URI          = $URL64
    }
}