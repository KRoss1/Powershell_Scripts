<#
.AUTHOR
Kieran Ross

.SYNOPSIS
Finds Where SMTP Address is being used

.DESCRIPTION
Uses Get-Recipient to find where a certain SMTP Address is used


.PARAMETER EmailAddress
Email Address you want to find


.EXAMPLE
.\Get_Where_SMTPAddress_is_Used.ps1 -EmailAddress "Info@Domain.co.uk"


#>

[CmdletBinding()]Param(
    [Parameter(Mandatory=$true)]
        [String]$EmailAddress
)

Write-Verbose "Adding Exchange Commands"
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn

Write-Verbose "Searching for Email Address: $EmailAddress"
Get-Recipient | Select-Object Name -Expand EmailAddresses | Where-Object {$_.SMTPAddress -match "$EmailAddress"} | Format-Table Name, SMTPAddress