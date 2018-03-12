<#

.SYNOPSIS
Gets All Mailboxes that have a forward address

.DESCRIPTION
Gets All Mailboxes that have a forward address and shows the Name, email address and forwarding address

.EXAMPLE
.\Get_All_Mailboxes_That_Have_A_Forward.ps1



#>

[CmdletBinding()]Param()

Get-Mailbox | Where {$_.ForwardingAddress -ne $null} | Select Name, PrimarySMTPAddress, ForwardingAddress