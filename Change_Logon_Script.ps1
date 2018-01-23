<#

.SYNOPSIS
Sets the Logon Sctipt for a given user

.DESCRIPTION
Uses Get-ADUser to retrive desired user then Set-ADUser to add the ScriptPath parameter

.PARAMETER Username
Specifies the Username of the user that you want to change the logon script for

.PARAMETER LogonScript
Specifies the Logon Sctipt that you want to use

.EXAMPLE
Change_Logon_Sctipt.ps1 -Username "John" -LogonScript "logon.bat"

.EXAMPLE
Change_Logon_Script.ps1 -Username mike.wallace -LogonScript Engineering.bat

#>

param (
    [Parameter(Mandatory=$true)]
        [String]$Username,
    [Parameter(Mandatory=$true)]
        [String]$LogonScript
    )  

    Write-Verbose "Setting Logon Script for AD User"
    Get-ADUser $Username | Set-ADUser -scriptpath $LogonScript
