$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://download.microsoft.com/download/6/f/f/6ffefc73-39ab-4cc0-bb7c-4093d64c2669/en-US/17.10.5.1/x86/msodbcsql.msi'
$url64    = 'https://download.microsoft.com/download/6/f/f/6ffefc73-39ab-4cc0-bb7c-4093d64c2669/en-US/17.10.5.1/x64/msodbcsql.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url
  url64bit       = $url64

  softwareName   = 'Microsoft OLE DB Driver for SQL Server'

  checksum       = '23fea4333b4f1a9c8f8bb13455056acc7f57119672ba015676925bc1982c8f87'
  checksumType   = 'sha256'
  checksum64     = 'f4b68aee4625d73dc983fe40d49b91ec5765b4d9dd44ff964f35556d6ee7d869'
  checksumType64 = 'sha256'

  # MSI
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" IACCEPTMSODBCSQLLICENSETERMS=YES"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs