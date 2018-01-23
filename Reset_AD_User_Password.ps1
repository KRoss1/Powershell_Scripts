param(
[String]$Username,
[SecureString]$Password
)

Set-ADAccountPassword $Username -NewPassword $Password
Set-ADUser $Username -ChangePasswordAtLogon $true

