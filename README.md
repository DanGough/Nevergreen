# Nevergreen

## About
Nevergreen is a Powershell module that returns the latest version and download links for various Windows applications.

It can be used as an alternative to the excellent [Evergreen](https://github.com/aaronparker/Evergreen) module, for apps that project does not support, or where it might not return the results you want.

Evergreen uses API queries to obtain its data whereas this module is more focussed on web scraping. This is inherently more prone to breaking when websites are changed, hence the name!

## Supported Powershell Versions
This has been tested with Powershell 5.1 and 7.1.3. Other versions may work but have not been tested, YMMV.

## Installation

### Powershell Gallery
Coming soon!

### Manual Installation
Download the latest Main branch, either by downloading the zip file directly from Github, or by installing Git and typing:

`git clone https://github.com/DanGough/Nevergreen.git`

If you extracted the zip, you may need to unblock the files first:
```powershell
Get-ChildItem -Path <path> -Recurse | Unblock-File
```
Then from within the Nevergreen folder, run the following command to temporarily import the module into your session:

```powershell
Import-Module .\Nevergreen\Nevergreen.psd1
```
You can also copy it to one of the folders listed under '$env:PSModulePath' to make it available in all future sessions without having to import it.