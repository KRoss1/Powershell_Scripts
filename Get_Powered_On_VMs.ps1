Get-Module -ListAvailable VM* | Import-Module

$server = Read-Host "Enter VMware Host or Server"
$credential = Get-Credential

Connect-VIServer -Server $server -Credential $credential

Get-VM | Where-Object {$_.PowerState -eq "PoweredOn"} | Select-Object name, PowerState, NumCpu, MemoryGB

Disconnect-VIServer -Server $server 