$ErrorActionPreference = "Stop"

$serviceFolder = "C:\Services\Roko"
$serviceName = "RokoBarcodeScanner"
$artifactsFolder = "modestas"

Remove-Item $serviceFolder -Recurse -ErrorAction Ignore
Copy-Item $artifactsFolder -Destination $serviceFolder -Recurse

Stop-Service -Name $serviceName -ErrorAction Ignore
Start-Sleep -Seconds 5
Invoke-Expression "sc.exe delete $serviceName"
New-Service -Name $serviceName -BinaryPathName "$serviceFolder\BarcodeScanner.exe"

Start-Service -Name $serviceName