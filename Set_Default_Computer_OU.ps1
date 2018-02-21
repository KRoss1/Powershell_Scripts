<#

.SYNOPSIS
Sets the default OU for Computers in Active Directory

.DESCRIPTION
Uses redircmp to set default Computer OU

.PARAMETER OU
Specifies the OU 


.EXAMPLE
Set_Default_Computer_OU.ps1 -OU "OU=Computers,OU=Company,DC=Domain,DC=local"


#>

param(
    [Parameter(Mandatory=$true)]
        [String]$OU
)
redircmp $OU