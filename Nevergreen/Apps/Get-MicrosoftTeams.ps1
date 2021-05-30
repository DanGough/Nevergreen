$DownloadPageURL = "https://github.com/ItzLevvie/MicrosoftTeams-msinternal/blob/master/defconfig"
$DownloadPage = Invoke-WebRequest -Uri $DownloadPageURL -UseBasicParsing

# Continuous deployment/Development ring
$regexDev64EXE = 'continuous deployment(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionDev64EXE = ($DownloadPage.Content | Select-String -Pattern $regexDev64EXE).Matches.Groups[2].Value
$URLDev64EXE = ($DownloadPage.Content | Select-String -Pattern $regexDev64EXE).Matches.Groups[3].Value

$regexDev64MSI = 'continuous deployment(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionDev64MSI = ($DownloadPage.Content | Select-String -Pattern $regexDev64MSI).Matches.Groups[2].Value
$URLDev64MSI = ($DownloadPage.Content | Select-String -Pattern $regexDev64MSI).Matches.Groups[3].Value

$regexDev32EXE = 'continuous deployment(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionDev32EXE = ($DownloadPage.Content | Select-String -Pattern $regexDev32EXE).Matches.Groups[2].Value
$URLDev32EXE = ($DownloadPage.Content | Select-String -Pattern $regexDev32EXE).Matches.Groups[3].Value

$regexDev32MSI = 'continuous deployment(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionDev32MSI = ($DownloadPage.Content | Select-String -Pattern $regexDev32MSI).Matches.Groups[2].Value
$URLDev32MSI = ($DownloadPage.Content | Select-String -Pattern $regexDev32MSI).Matches.Groups[3].Value

$regexDevArm64EXE = 'continuous deployment(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionDevArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexDevArm64EXE).Matches.Groups[2].Value
$URLDevArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexDevArm64EXE).Matches.Groups[3].Value

$regexDevArm64MSI = 'continuous deployment(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionDevArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexDevArm64MSI).Matches.Groups[2].Value
$URLDevArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexDevArm64MSI).Matches.Groups[3].Value

# Exploration/Beta ring
$regexBeta64EXE = 'exploration(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionBeta64EXE = ($DownloadPage.Content | Select-String -Pattern $regexBeta64EXE).Matches.Groups[2].Value
$URLBeta64EXE = ($DownloadPage.Content | Select-String -Pattern $regexBeta64EXE).Matches.Groups[3].Value

$regexBeta64MSI = 'exploration(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionBeta64MSI = ($DownloadPage.Content | Select-String -Pattern $regexBeta64MSI).Matches.Groups[2].Value
$URLBeta64MSI = ($DownloadPage.Content | Select-String -Pattern $regexBeta64MSI).Matches.Groups[3].Value

$regexBeta32EXE = 'exploration(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionBeta32EXE = ($DownloadPage.Content | Select-String -Pattern $regexBeta32EXE).Matches.Groups[2].Value
$URLBeta32EXE = ($DownloadPage.Content | Select-String -Pattern $regexBeta32EXE).Matches.Groups[3].Value

$regexBeta32MSI = 'exploration(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionBeta32MSI = ($DownloadPage.Content | Select-String -Pattern $regexBeta32MSI).Matches.Groups[2].Value
$URLBeta32MSI = ($DownloadPage.Content | Select-String -Pattern $regexBeta32MSI).Matches.Groups[3].Value

$regexBetaArm64EXE = 'exploration(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionBetaArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexBetaArm64EXE).Matches.Groups[2].Value
$URLBetaArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexBetaArm64EXE).Matches.Groups[3].Value

$regexBetaArm64MSI = 'exploration(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionBetaArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexBetaArm64MSI).Matches.Groups[2].Value
$URLBetaArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexBetaArm64MSI).Matches.Groups[3].Value

# Preview ring
$regexPreview64EXE = 'preview(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionPreview64EXE = ($DownloadPage.Content | Select-String -Pattern $regexPreview64EXE).Matches.Groups[2].Value
$URLPreview64EXE = ($DownloadPage.Content | Select-String -Pattern $regexPreview64EXE).Matches.Groups[3].Value

$regexPreview64MSI = 'preview(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionPreview64MSI = ($DownloadPage.Content | Select-String -Pattern $regexPreview64MSI).Matches.Groups[2].Value
$URLPreview64MSI = ($DownloadPage.Content | Select-String -Pattern $regexPreview64MSI).Matches.Groups[3].Value

$regexPreview32EXE = 'preview(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionPreview32EXE = ($DownloadPage.Content | Select-String -Pattern $regexPreview32EXE).Matches.Groups[2].Value
$URLPreview32EXE = ($DownloadPage.Content | Select-String -Pattern $regexPreview32EXE).Matches.Groups[3].Value

$regexPreview32MSI = 'preview(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionPreview32MSI = ($DownloadPage.Content | Select-String -Pattern $regexPreview32MSI).Matches.Groups[2].Value
$URLPreview32MSI = ($DownloadPage.Content | Select-String -Pattern $regexPreview32MSI).Matches.Groups[3].Value

$regexPreviewArm64EXE = 'preview(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionPreviewArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexPreviewArm64EXE).Matches.Groups[2].Value
$URLPreviewArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexPreviewArm64EXE).Matches.Groups[3].Value

$regexPreviewArm64MSI = 'preview(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionPreviewArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexPreviewArm64MSI).Matches.Groups[2].Value
$URLPreviewArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexPreviewArm64MSI).Matches.Groups[3].Value

# Production/General ring
$regexProd64EXE = 'production build(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionProd64EXE = ($DownloadPage.Content | Select-String -Pattern $regexProd64EXE).Matches.Groups[2].Value
$URLProd64EXE = ($DownloadPage.Content | Select-String -Pattern $regexProd64EXE).Matches.Groups[3].Value

$regexProd64MSI = 'production build(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionProd64MSI = ($DownloadPage.Content | Select-String -Pattern $regexProd64MSI).Matches.Groups[2].Value
$URLProd64MSI = ($DownloadPage.Content | Select-String -Pattern $regexProd64MSI).Matches.Groups[3].Value

$regexProd32EXE = 'production build(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionProd32EXE = ($DownloadPage.Content | Select-String -Pattern $regexProd32EXE).Matches.Groups[2].Value
$URLProd32EXE = ($DownloadPage.Content | Select-String -Pattern $regexProd32EXE).Matches.Groups[3].Value

$regexProd32MSI = 'production build(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-x86.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionProd32MSI = ($DownloadPage.Content | Select-String -Pattern $regexProd32MSI).Matches.Groups[2].Value
$URLProd32MSI = ($DownloadPage.Content | Select-String -Pattern $regexProd32MSI).Matches.Groups[3].Value

$regexProdArm64EXE = 'production build(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.exe)'
$VersionProdArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexProdArm64EXE).Matches.Groups[2].Value
$URLProdArm64EXE = ($DownloadPage.Content | Select-String -Pattern $regexProdArm64EXE).Matches.Groups[3].Value

$regexProdArm64MSI = 'production build(.*?|\n)*?((?:\d+\.)+(?:\d+)).+win-arm64.+(https.+(?:\d+\.)+(?:\d+).+.msi)'
$VersionProdArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexProdArm64MSI).Matches.Groups[2].Value
$URLProdArm64MSI = ($DownloadPage.Content | Select-String -Pattern $regexProdArm64MSI).Matches.Groups[3].Value

# Continuous deployment/Development ring
if ($VersionDev64EXE -and $URLDev64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionDev64EXE
        Ring         = 'Development'
        Architecture = 'x64'
        Type         = 'Exe'
        URI          = $URLDev64EXE
    }
}

if ($VersionDev64EXE -and $URLDev64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionDev64MSI
        Ring         = 'Development'
        Architecture = 'x64'
        Type         = 'Msi'
        URI          = $URLDev64MSI
    }
}

if ($VersionDev32EXE -and $URLDev32EXE)
{
    [PSCustomObject]@{
        Version      = $VersionDev32EXE
        Ring         = 'Development'
        Architecture = 'x86'
        Type         = 'Exe'
        URI          = $URLDev32EXE
    }
}

if ($VersionDev32MSI -and $URLDev32MSI)
{
    [PSCustomObject]@{
        Version      = $VersionDev32MSI
        Ring         = 'Development'
        Architecture = 'x86'
        Type         = 'Msi'
        URI          = $URLDev32MSI
    }
}

if ($VersionDevArm64EXE -and $URLDevArm64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionDevArm64EXE
        Ring         = 'Development'
        Architecture = 'Arm64'
        Type         = 'Exe'
        URI          = $URLDevArm64EXE
    }
}

if ($VersionDevArm64MSI -and $URLDevArm64MSI)
{
    [PSCustomObject]@{
        Version      = $VersionDevArm64MSI
        Ring         = 'Development'
        Architecture = 'Arm64'
        Type         = 'Msi'
        URI          = $URLDevArm64MSI
    }
}

# Exploration/Beta ring
if ($VersionBeta64EXE -and $URLBeta64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionBeta64EXE
        Ring         = 'Beta'
        Architecture = 'x64'
        Type         = 'Exe'
        URI          = $URLBeta64EXE
    }
}

if ($VersionBeta64EXE -and $URLBeta64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionBeta64MSI
        Ring         = 'Beta'
        Architecture = 'x64'
        Type         = 'Msi'
        URI          = $URLBeta64MSI
    }
}

if ($VersionBeta32EXE -and $URLBeta32EXE)
{
    [PSCustomObject]@{
        Version      = $VersionBeta32EXE
        Ring         = 'Beta'
        Architecture = 'x86'
        Type         = 'Exe'
        URI          = $URLBeta32EXE
    }
}

if ($VersionBeta32MSI -and $URLBeta32MSI)
{
    [PSCustomObject]@{
        Version      = $VersionBeta32MSI
        Ring         = 'Beta'
        Architecture = 'x86'
        Type         = 'Msi'
        URI          = $URLBeta32MSI
    }
}

if ($VersionBetaArm64EXE -and $URLBetaArm64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionBetaArm64EXE
        Ring         = 'Beta'
        Architecture = 'Arm64'
        Type         = 'Exe'
        URI          = $URLBetaArm64EXE
    }
}

if ($VersionBetaArm64MSI -and $URLBetaArm64MSI)
{
    [PSCustomObject]@{
        Version      = $VersionBetaArm64MSI
        Ring         = 'Beta'
        Architecture = 'Arm64'
        Type         = 'Msi'
        URI          = $URLBetaArm64MSI
    }
}

# Preview ring
if ($VersionPreview64EXE -and $URLPreview64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionPreview64EXE
        Ring         = 'Preview'
        Architecture = 'x64'
        Type         = 'Exe'
        URI          = $URLPreview64EXE
    }
}

if ($VersionPreview64EXE -and $URLPreview64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionPreview64MSI
        Ring         = 'Preview'
        Architecture = 'x64'
        Type         = 'Msi'
        URI          = $URLPreview64MSI
    }
}

if ($VersionPreview32EXE -and $URLPreview32EXE)
{
    [PSCustomObject]@{
        Version      = $VersionPreview32EXE
        Ring         = 'Preview'
        Architecture = 'x86'
        Type         = 'Exe'
        URI          = $URLPreview32EXE
    }
}

if ($VersionPreview32MSI -and $URLPreview32MSI)
{
    [PSCustomObject]@{
        Version      = $VersionPreview32MSI
        Ring         = 'Preview'
        Architecture = 'x86'
        Type         = 'Msi'
        URI          = $URLPreview32MSI
    }
}

if ($VersionPreviewArm64EXE -and $URLPreviewArm64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionPreviewArm64EXE
        Ring         = 'Preview'
        Architecture = 'Arm64'
        Type         = 'Exe'
        URI          = $URLPreviewArm64EXE
    }
}

if ($VersionPreviewArm64MSI -and $URLPreviewArm64MSI)
{
    [PSCustomObject]@{
        Version      = $VersionPreviewArm64MSI
        Ring         = 'Preview'
        Architecture = 'Arm64'
        Type         = 'Msi'
        URI          = $URLPreviewArm64MSI
    }
}

# Production/General ring
if ($VersionProd64EXE -and $URLProd64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionProd64EXE
        Ring         = 'Production'
        Architecture = 'x64'
        Type         = 'Exe'
        URI          = $URLProd64EXE
    }
}

if ($VersionProd64EXE -and $URLProd64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionProd64MSI
        Ring         = 'Production'
        Architecture = 'x64'
        Type         = 'Msi'
        URI          = $URLProd64MSI
    }
}

if ($VersionProd32EXE -and $URLProd32EXE)
{
    [PSCustomObject]@{
        Version      = $VersionProd32EXE
        Ring         = 'Production'
        Architecture = 'x86'
        Type         = 'Exe'
        URI          = $URLProd32EXE
    }
}

if ($VersionProd32MSI -and $URLProd32MSI)
{
    [PSCustomObject]@{
        Version      = $VersionProd32MSI
        Ring         = 'Production'
        Architecture = 'x86'
        Type         = 'Msi'
        URI          = $URLProd32MSI
    }
}

if ($VersionProdArm64EXE -and $URLProdArm64EXE)
{
    [PSCustomObject]@{
        Version      = $VersionProdArm64EXE
        Ring         = 'Production'
        Architecture = 'Arm64'
        Type         = 'Exe'
        URI          = $URLProdArm64EXE
    }
}

if ($VersionProdArm64MSI -and $URLProdArm64MSI)
{
    [PSCustomObject]@{
        Version      = $VersionProdArm64MSI
        Ring         = 'Production'
        Architecture = 'Arm64'
        Type         = 'Msi'
        URI          = $URLProdArm64MSI
    }
}
