<#

.SYNOPSIS
Grants Full Access Permission to Mailbox

.DESCRIPTION
Uses Add-MailboxPermission to grant Full Access to a Users Mailbox

.PARAMETER Mailbox
Specifies the Mailbox you want to add permission to

.PARAMETER User
Specifies the User you want to add to the mailbox

.EXAMPLE
Add_Full_Access_Permission_Mailbox -Mailbox "Accounts" -User "Mike"

.EXAMPLE
Reset_AD_User_Password.ps1 -Mailbox Engineering -User mike.jones


#>

param(
    [Parameter(Mandatory=$true)]
        [String]$Mailbox,
    [Parameter(Mandatory=$true)]
        [SecureString]$User
)

Add-MailboxPermission -Identity $Mailbox -User $User -AccessRights FullAccess