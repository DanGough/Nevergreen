function Get-NevergreenApp {
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
    }

    process {
        foreach ($AppName in $Name) {
            $Script = [System.IO.Path]::Combine($PSScriptRoot, 'Apps', "Get-$AppName.ps1")
            if (Test-Path -LiteralPath $Script -PathType Leaf) {
                try {
                    $Output = &$Script
                    if ($Output.Version -and $Output.Uri) {
                        $Output
                    }
                }
                catch {
                    Write-Error -ErrorRecord $_
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