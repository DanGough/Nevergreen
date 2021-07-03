function Get-NevergreenApp {
    <#
    .SYNOPSIS
        Attempts to retrieve the latest version and download link for the selected application.

    .DESCRIPTION
        The application name must be a valid supported name - use Find-Nevergreen app to list supported applications. The output of this command may retrieve multiple results, filter using Where-Object and Select-Object where appropriate.

    .NOTES
        Site: https://packageology.com
        Author: Dan Gough
        Twitter: @packageologist

    .LINK
        https://github.com/DanGough/Nevergreen

    .PARAMETER Name
        The application name to return details for. Must be an exact match for a supported application name.

    .EXAMPLE
        Get-NevergreenApp -Name MicrosoftPowerBIDesktop

        Description:
        Returns the latest version and download links for all available platforms.

    .EXAMPLE
        Get-NevergreenApp -Name MicrosoftPowerBIDesktop | Where-Object {$_.Architecture -eq 'x64'}

        Description:
        Returns the latest version and download links for the 64-bit version only.

    .EXAMPLE
        Find-NevergreenApp | Get-NevergreenApp

        Description:
        List results for all apps!
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            HelpMessage = "Specify an application name. Use Find-NevergreenApp to list supported applications.")]
        [ValidateNotNull()]
        [System.String[]] $Name
    )

    begin {
        $AppDir = [System.IO.Path]::Combine((Split-Path -Path $PSScriptRoot -Parent), 'Apps')
        $ProgressPreference = 'SilentlyContinue'
    }

    process {
        foreach ($AppName in $Name) {
            $Script = [System.IO.Path]::Combine($AppDir, "Get-$AppName.ps1")
            if (Test-Path -LiteralPath $Script -PathType Leaf) {
                try {
                    $Output = &$Script
                    if ($Output.Version -and $Output.Uri) {
                        $Output
                    }
                }
                catch {
                    Write-Error -Message "Error retriving results for '$AppName': $($_.Exception.Message)"
                }
            }
            else {
                Write-Error "Unknown application name: $AppName"
            }
        }
    }

    end {
    }
}