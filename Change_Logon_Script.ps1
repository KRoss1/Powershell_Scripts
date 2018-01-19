$username = Read-Host "Enter Username"
$script = Read-Host "Enter Logon Script"
Get-ADUser $username | Set-ADUser -scriptpath $script