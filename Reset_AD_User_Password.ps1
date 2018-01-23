<#

.SYNOPSIS
Resets Password for a given user

.DESCRIPTION
Uses Set-ADAccountPassword to reset the password of an account

.PARAMETER Username
Specifies the Username of the user that you want to change password for

.PARAMETER Password
Specifies the Password that you want to use

.EXAMPLE
Reset_AD_User_Password.ps1 -Username "John" -Password "P@ssword1"

.EXAMPLE
Reset_AD_User_Password.ps1 -Username mike.wallace -Password P@ssword1

.EXAMPLE
Reset_AD_User_Password.ps1 -Username mike.wallace -Password P@ssword1 -ChangeAtNextLogon

#>

param(
    [Parameter(Mandatory=$true)]
        [String]$Username,
    [Parameter(Mandatory=$true)]
        [SecureString]$Password,
        
        [switch]$ChangeAtNextLogon
)

Write-Verbose "Setting AD Account Password"
Set-ADAccountPassword $Username -NewPassword $Password


if ($ChangeAtNextLogon) {
Write-Verbose "Setting to Change At Next Logon"
    Set-ADUser $Username -ChangePasswordAtLogon $true
}


