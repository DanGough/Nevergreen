# Nevergreen

## About
<br>
Nevergreen is a Powershell module that returns the latest version and download links for various Windows applications.
<br>
<br>

It can be used as an alternative to the excellent [Evergreen](https://github.com/aaronparker/Evergreen) module, for apps that project does not support, or where it might not return the results you want.
<br>
<br>

Evergreen relies on API queries to obtain its data, and HTML scraping is not welcome. This is the reason Nevergreen was born, a place to accept all the Evergreen rejects! Please note this method is inherently more prone to breaking when websites are changed, hence the name!
<br>
<br>
<br>

## Bugs
<br>
Because these apps rely on HTML scraping, they are prone to breakage when the websites are changed. If you encounter an issue, please file a report under the Issues tab.
<br>
<br>

Fix contributions are also welcomed - fork the repository, create the fix in a new branch in your copy, then create a pull request for me to review. If you're not familiar with Git, just post the fixed code directly within the issue.
<br>
<br>
<br>

## Requests
<br>
If you have a request to add an application to Nevergreen, please abide by the following:
<br>
<br>

- If the app has a queryable API feed to obtain the latest version, it is better suited for inclusion in [Evergreen](https://github.com/aaronparker/Evergreen). It can be hard to find these API feeds, but if for example the app in question is hosted on Github, Evergreen has built-in functions for getting those apps easily.

- Please check the [New Apps](https://github.com/DanGough/Nevergreen/projects/1) area under the [Projects](https://github.com/DanGough/Nevergreen/projects) tab to see if the app is already on the to-do list.

- If it is not, you are welcome to add a request via the [Issues](https://github.com/DanGough/Nevergreen/issues) tab. Please include any helpful information such as the URLs for the download page and release notes if possible.
<br>
<br>
<br>

## Supported Powershell Versions
<br>
This has been tested with Powershell 5.1 and 7.1.3, and the module manifests lists the minimum supported version as 5.1. It may work on 3.0, but it has never been tested.
<br>
<br>
<br>

## Installation
<br>

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
