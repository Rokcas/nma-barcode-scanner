$ErrorActionPreference = "Stop"

$serviceFolder = "C:\Services\Reno"
$serviceName = "RenoBarcodeScanner"
$artifactsFolder = "modestas\*"

Copy-Item $artifactsFolder $serviceFolder
New-Service -Name $serviceName -BinaryPathName "$serviceFolder\BarcodeScanner.dll"

Start-Service -Name $serviceName