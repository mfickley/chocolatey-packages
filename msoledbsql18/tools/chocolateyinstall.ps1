$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$url      = 'https://download.microsoft.com/download/2/6/1/2613c841-cf12-4ba3-b0f8-50dcc195faa4/en-US/18.6.7.0/x86/msoledbsql.msi'
$url64    = 'https://download.microsoft.com/download/2/6/1/2613c841-cf12-4ba3-b0f8-50dcc195faa4/en-US/18.6.7.0/x64/msoledbsql.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi'
  url            = $url
  url64bit       = $url64

  softwareName   = 'Microsoft OLE DB Driver for SQL Server'

  checksum       = 'eaa4f67f8327356d894c4b64ee7498dd099594f2f9ebf5ca7018e73c24b8321b'
  checksumType   = 'sha256'
  checksum64     = '561c35db933ae137968b41f64415e8d9c69d84d49e18fd08a2750d7a82a2b229'
  checksumType64 = 'sha256'

  # MSI
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" IACCEPTMSOLEDBSQLLICENSETERMS=YES"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs