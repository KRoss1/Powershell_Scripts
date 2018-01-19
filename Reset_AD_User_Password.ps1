$username = Read-Host 'Enter Username'
$newPassword = Read-Host "Enter the New Password" -AsSecureString

Set-ADAccountPassword $username -NewPassword $newPassword
Set-ADUser $username -ChangePasswordAtLogon $true

