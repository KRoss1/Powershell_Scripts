<#

.SYNOPSIS
Lists All Groups that the user is a member of

.DESCRIPTION
Uses Get-ADUser to retrive user then selects the memberof property

.PARAMETER Username
Specifies the Username of the user that you want to get the memberships for


.EXAMPLE
List_All_Groups_for_User.ps1 -Username "John"

.EXAMPLE
List_All_Groups_for_User.ps1 -Username mike.wallace 


#>
param(
    [Parameter(Mandatory=$true)]
        [string]$username
)

Write-Verbose "Getting List of Groups"
GET-ADUser -Identity $username –Properties MemberOf | Select-Object -ExpandProperty MemberOf | Get-ADGroup -Properties Name | Select-Object Name