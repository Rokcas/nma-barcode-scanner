$ErrorActionPreference = "Stop"

$serviceFolder = "C:\Services\Roko"
$serviceName = "RokoBarcodeScanner"
$artifactsFolder = "modestas\*"

If((Test-Path $artifactsFolder) -ne $true) {
    New-Item $artifactsFolder      
}

Copy-Item $artifactsFolder $serviceFolder
New-Service -Name $serviceName -BinaryPathName "$serviceFolder\BarcodeScanner.dll"

Start-Service -Name $serviceName