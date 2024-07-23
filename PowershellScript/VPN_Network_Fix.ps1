#Requires -RunAsAdministrator
netsh winsock reset
netsh int ip reset all
netsh winhttp reset proxy
ipconfig /flushdns
netsh winsock reset
shutdown /r

Write-Output "Reset network completed"
