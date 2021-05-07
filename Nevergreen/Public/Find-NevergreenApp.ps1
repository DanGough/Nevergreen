function Find-NevergreenApp {
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $false,
            Position = 0)]
        [System.String] $Filter
    )

    begin {
    }

    process {
        $AppDir = [System.IO.Path]::Combine((Split-Path -Path $PSScriptRoot -Parent), 'Apps')
        (Get-ChildItem -Path $AppDir).BaseName | ForEach-Object {$_.Split('-')[1]} | Where-Object {$_ -match $Filter}
    }

    end {
    }
}