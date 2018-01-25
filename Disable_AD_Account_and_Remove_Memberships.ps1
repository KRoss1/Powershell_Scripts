<#

.SYNOPSIS
Disables Active Directory Account and Removes all Group Memberships

.DESCRIPTION
Uses Disable-ADAccount and and Get-ADPrincipalGroupMembership to Disable Account and to get the list of Group Memberships for the user

.PARAMETER Username
Specifies the User you want to disable

.EXAMPLE
Disable_AD_Account_and_Remove_Memberships.ps1 -Mailbox "Accounts" -Username "Mike"

.EXAMPLE
Disable_AD_Account_and_Remove_Memberships.ps1 -Mailbox Engineering -Username mike.jones


#>

param (
    [Parameter(Mandatory=$true)]
        [String]$Username
)

$memberOfGroups = Get-ADPrincipalGroupMembership -Identity $who | select  -ExpandProperty distinguishedName

Get-ADUser $who    

    Write-Verbose "Disabling Active Directory Account"
    Disable-ADAccount $who
    
    Write-Verbose "Starting to Remove Group Memberships"
    foreach ($group in $memberOfGroups) {

        Remove-ADGroupMember -Identity $group -Members $who
        Write-Verbose "Removed from Group: $group"

        }
    