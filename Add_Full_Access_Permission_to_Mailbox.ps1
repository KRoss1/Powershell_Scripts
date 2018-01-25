<#

.SYNOPSIS
Grants Full Access Permission to Mailbox

.DESCRIPTION
Uses Add-MailboxPermission to grant Full Access to a Users Mailbox

.PARAMETER Mailbox
Specifies the Mailbox you want to add permission to

.PARAMETER User
Specifies the User you want to add to the mailbox

.PARAMETER Server
Specifies the Server the mailbox is on

.PARAMETER ExchangeUsername
Specifies the Admin Credentials to use

.PARAMETER Password
Specifies the Admin Credentials Password to use

.EXAMPLE
Add_Full_Access_Permission_to_Mailbox.ps1 -Mailbox "Accounts" -User "Mike" -Server Exchange1 -ExchangeUsername Domain\ExchangeAdmin -Password P@ssword1

.EXAMPLE
Add_Full_Access_Permission_to_Mailbox.ps1 -Mailbox Engineering -User mike.jones -Server Exchange1 -ExchangeUsername Domain\ExchangeAdmin -Password P@ssword1


#>

param(
    [Parameter(Mandatory=$true)]
        [String]$Mailbox,
    [Parameter(Mandatory=$true)]
        [string]$User,
    [Parameter(Mandatory=$true)]
        [String]$Server,
    [Parameter(Mandatory=$true)]
        [String]$ExchangeUsername,
    [Parameter(Mandatory=$true)]
        [SecureString]$Password    
    
)

$ScriptBlock = {
    Add-MailboxPermission -Identity $args[0] -User $args[1] -AccessRights FullAccess
}

$credential = New-Object -TypeName System.Management.Automation.PSCredential $ExchangeUsername,$Password

Invoke-Command -ComputerName $Server -Credential $credential -ScriptBlock $ScriptBlock -ArgumentList $Mailbox, $User
