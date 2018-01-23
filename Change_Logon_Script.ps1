param(
        [String]$Username,
        [String]$LogonScript
)


Get-ADUser $Username | Set-ADUser -scriptpath $LogonScript