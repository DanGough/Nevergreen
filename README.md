# Nevergreen

## About
<br>

Nevergreen is a Powershell module that returns the latest version and download links for various Windows applications.
<br>

It can be used as an alternative to the excellent [Evergreen](https://github.com/aaronparker/Evergreen) module, for apps that project does not support, or where it might not return the results you want.
<br>

Evergreen relies on API queries to obtain its data, and HTML scraping is not welcome. This is the reason Nevergreen was born, a place to accept all the Evergreen rejects! Please note this method is inherently more prone to breaking when websites are changed, hence the name!
<br>
<br>

## Supported apps
<br>

- 7-Zip (Evergreen URLs return HTML files at present and version is not the latest)
- 8x8 Work
- Adobe/Harman AIR
- Adobe Creative Cloud
- Adobe Acrobat Reader / Pro
  - MSP update patches only
  - Evergreen does not always report the latest optional releases, whereas this implementation should.
- Advanced Installer
- Advanced IP Scanner
- Advanced Port Scanner
- Anaconda
- Apple iTunes
- AutoIt
- Cisco Webex
- Cisco Webex Access Anywhere
- Cisco Webex Support Manager
- Citrix ShareFile
- Druide Antidote
- Eclipse Temeru Runtime (AKA AdoptOpenJDK Hotspot)
- Elgato 4K Capture Utility
- Elgato Audio Effects
- Elgato Camera Hub
- Elgato Control Center
- Elgato Game Capture
- Elgato Stream Deck
- Elgato Video Capture
- FileOpen Plugin
- Fujifilm Pixel Shift Combiner
- Fujifilm Raw File Converter EX
- Fujifilm X Acquire
- Fujifilm X Raw Studio
- Fujifilm X Webcam
- Google Drive
- Google Earth Pro
- IBM Semeru Runtime (AKA AdoptOpenJDK OpenJ9)
- IGEL Universal Management Suite
- Jabra Direct
- Komodo Labs NEWT Professional
- Komodo Labs Slitheris
- Lenovo Commercial Vantage
- LibreOffice / LibreOfficeHelp
- Logitech Camera Setings
- LSoft Active Disk Image Lite
- LSoft Active Boot Disk
- Microsoft Azure CLI
- Microsoft Azure Information Protection UL Client
- Microsoft OpenJDK
- Microsoft Power BI Desktop
- Microsoft Power BI Report Builder
- Microsoft SSMS
  - This is already in Evergreen but has a known issue against it where the feed is providing the build version rather than the release version most know it by.
- Microsoft Sysinternals tools (all suites and individual tools)
- Microsoft Windows ADK
- Mimecast for Outlook
- Miniconda
- nmap
- Npcap
- Opera
- OpenVPN Community
- OpenVPN Connect
- PatchMyPC Publisher
- PatchMyPC Advanced Insights
- PatchMyPC Return On Investment Tool
- PatchMyPC MEM Patching Optimizer
- Philippe Jounin Tftpd64
- PingIdentity PingID
- Python
- QGIS
- Radio Detection CAT Manager
- Redstor Backup Pro Storage Platform Console
- RIA eID
- TMurgent AppVDefConGroups
- TMurgent AppVManage
- TMurgent AppVManifestEditor
- TMurgent PsfTooling
- TMurgent PullApps
- TMurgent TMEdit
- TMurgent TMEditX
- Zebra Card Studio
- Zoom VDI
  - This is already in Evergreen but the VDI downloads just return the version as 'Latest'

<br>

The [Apps folder in the main branch](https://github.com/DanGough/Nevergreen/tree/main/Nevergreen/Apps) will always show the apps supported in the latest release.
<br>

Also, you can check the [latest commits to the Apps folder in the dev branch](https://github.com/DanGough/Nevergreen/commits/dev/Nevergreen/Apps) to see what's being worked on.
<br>
<br>

## Bugs
<br>

Because these apps rely on HTML scraping, they are prone to breakage when the websites are changed. If you encounter an issue, please file a report under the [Issues](https://github.com/DanGough/Nevergreen/issues) tab.
<br>

Fix contributions are also welcomed - fork the repository, create the fix in a new branch in your copy, then create a pull request for me to review. If you're not familiar with Git, just post the fixed code directly within the issue.
<br>
<br>

## Requests
<br>

If you have a request to add an application to Nevergreen, please abide by the following:
<br>

- If the app has a queryable API feed to obtain the latest version, it is better suited for inclusion in [Evergreen](https://github.com/aaronparker/Evergreen). It can be hard to find these API feeds, but if for example the app in question is hosted on Github, Evergreen has built-in functions for getting those apps easily.

- Please check the [New Apps](https://github.com/DanGough/Nevergreen/projects/1) area under the [Projects](https://github.com/DanGough/Nevergreen/projects) tab to see if the app is already on the to-do list.

- If it is not, you are welcome to add a request via the [Issues](https://github.com/DanGough/Nevergreen/issues) tab. Please include any helpful information such as the URLs for the download page and release notes if possible.
<br>

## Supported Powershell Versions
<br>

This has been tested with Powershell 5.1 and 7.x, and the module manifests lists the minimum supported version as 5.1. It may work on 3.0, but it has never been tested.
<br>
<br>

## Installation

### Powershell Gallery
<br>

Simply install directly from the [Powershell Gallery](https://www.powershellgallery.com/packages/Nevergreen) by running the following command:
<br>

```powershell
Install-Module -Name Nevergreen
```
<br>

To update:
```powershell
Update-Module -Name Nevergreen
```
<br>

### Manual Installation
<br>

Download the latest Main branch, either by downloading the zip file directly from Github, or by installing [Git](https://git-scm.com/downloads) and typing:
<br>

```
git clone https://github.com/DanGough/Nevergreen.git
```
<br>

If you downloaded and extracted a zip file, you may need to unblock the files first:
```powershell
Get-ChildItem -Path <path> -Recurse | Unblock-File
```
<br>

Then from within the Nevergreen folder, run the following command to temporarily import the module into your session:

```powershell
Import-Module .\Nevergreen\Nevergreen.psd1
```
<br>

You can also copy it to one of the folders listed under `$env:PSModulePath` to make it available in all future sessions without having to import it.
<br>
<br>

## Usage
<br>

List all supported apps:
```powershell
Find-NevergreenApp
```
<br>

List all Adobe and Microsoft apps (accepts arrays and uses a RegEx match):
```powershell
Find-NevergreenApp -Name Adobe,Microsoft
```
<br>

Get version and download links for Microsoft Power BI Desktop (all platforms):
```powershell
Get-NevergreenApp -Name MicrosoftPowerBIDesktop
```
<br>

Get version and download links for Microsoft Power BI Desktop (64-bit only):
```powershell
Get-NevergreenApp -Name MicrosoftPowerBIDesktop | Where-Object {$_.Architecture -eq 'x64'}
```
<br>

Combine both commands to get all results!
```powershell
Find-NevergreenApp | Get-NevergreenApp
```


<br>
