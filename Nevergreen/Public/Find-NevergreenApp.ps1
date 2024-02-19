function Find-NevergreenApp {
    <#
    .SYNOPSIS
        Returns a list of all apps currently supported by Nevergreen.

    .DESCRIPTION
        Retrieves a list of supported applications by querying Get-*.ps1 under the Apps folder.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER Name
        The application name to return details for. Uses a RegEx match so will return all apps where the name contains the supplied string. Accepts an array for multiple matches, or can also accept values from the pipeline.

    .EXAMPLE
        Find-NevergreenApp

        Description:
        Returns a list of all currently supported applications.

    .EXAMPLE
        Find-NevergreenApp -Name 'Microsoft'

        Description:
        Returns a list of all currently supported applications with 'Microsoft' in the name.

    .EXAMPLE
        Find-NevergreenApp -Name 'Adobe','Microsoft'

        Description:
        Returns a list of all currently supported applications matching 'Adobe' or 'Microsoft'.
    #>
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $false,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName)]
        [System.String[]] $Name = ''
    )

    begin {
        $AppDir = [System.IO.Path]::Combine((Split-Path -Path $PSScriptRoot -Parent), 'Apps')
        $Apps = (Get-ChildItem -Path $AppDir).BaseName -replace '^Get-'
        $Results = @()
    }

    process {
        foreach ($AppName in $Name) {
            $Results += $Apps | Where-Object { $_ -match $AppName }
        }
    }

    end {
        $Results | Select-Object -Unique
    }
}