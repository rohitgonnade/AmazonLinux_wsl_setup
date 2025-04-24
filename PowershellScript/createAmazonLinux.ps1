#if you can't run powershel script then ->  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  or  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Get the script's directory
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$path = Join-Path $scriptDir "../installedAmazon1"
if (Test-Path $path)
{
    Remove-Item -Path $path -Recurse -Force
}

$tarFile = Join-Path $scriptDir "../al2023.tar"
if (Test-Path $tarFile)
{
    Remove-Item -Path $tarFile -Force
}

# create amazon linx tar file
wsl -d Ubuntu-24.04 -e bash Linux_scripts/Ubuntu/createAmazonLinux.sh

wsl --terminate Ubuntu-24.04
# wsl --unregister Ubuntu

#import tar as distribution in WSL
mkdir installedAmazon
wsl --import AmazonLinux .\installedAmazon\ al2023.tar
wsl --set-default AmazonLinux

Remove-Item -Path $tarFile -Force

Write-Host "To new amazon linux use command : wsl -d AmazonLinux"
