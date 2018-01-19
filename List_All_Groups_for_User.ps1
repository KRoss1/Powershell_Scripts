$username = Read-Host "Enter Username"
Get-ADUser $username -Properties memberof | Select -ExpandProperty memberof