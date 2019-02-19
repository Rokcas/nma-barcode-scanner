$ErrorActionPreference = "Stop"

Invoke-Expression "dotnet build"
Invoke-Expression "dotnet publish BarcodeScanner -o artifacts -r 'win7-x64' --self-contained"