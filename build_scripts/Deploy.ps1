$ErrorActionPreference = "Stop"

$serviceFolder = "C:\Services\Beno"
$serviceName = "BenoBarcodeScanner"
$artifactsFolder = "package"

Remove-Item $serviceFolder -Recurse -ErrorAction Ignore
Copy-Item $artifactsFolder -Destination $serviceFolder -Recurse

Stop-Service -Name $serviceName -ErrorAction Ignore
Invoke-Expression "sc delete $serviceName"
New-Service -Name $serviceName -BinaryPathName "$serviceFolder\BarcodeScanner.exe"

Start-Service -Name $serviceName