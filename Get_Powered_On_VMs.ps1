Get-Module -ListAvailable VM* | Import-Module

$server = Read-Host "Enter VMware Host or Server"
$credential = Get-Credential

Connect-VIServer -Server $server -Credential $credential

Get-VM | where {$_.PowerState -eq "PoweredOn"}

Disconnect-VIServer