$ErrorActionPreference = "Stop"

$serviceFolder = "C:\Services\Roko"
$serviceName = "RokoBarcodeScanner"
$artifactsFolder = "modestas\*"

If((Test-Path $serviceFolder) -ne $true) {
    New-Item $serviceFolder
}

Copy-Item $artifactsFolder $serviceFolder
New-Service -Name $serviceName -BinaryPathName "$serviceFolder\BarcodeScanner.dll"

Start-Service -Name $serviceName