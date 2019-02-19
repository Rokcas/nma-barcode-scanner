$ErrorActionPreference = "Stop"

$serviceFolder = "C:\Services\Roko"
$serviceName = "RokoBarcodeScanner"
$artifactsFolder = "modestas"

Remove-Item $serviceFolder -Recurse -ErrorAction Ignore

Copy-Item $artifactsFolder -Destination $serviceFolder -Recurse

Remove-Service -Name $serviceName -ErrorAction Ignore
New-Service -Name $serviceName -BinaryPathName "$serviceFolder\BarcodeScanner.dll"

Start-Service -Name $serviceName