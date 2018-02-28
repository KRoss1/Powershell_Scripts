<#
.AUTHOR
Kieran Ross

.SYNOPSIS
Sets the Script Execution Policy

.DESCRIPTION
Checks the current Execution Policy and changes it to RemoteSigned if not already


.EXAMPLE
.\Set_Execution_Policy.ps1


#>

[CmdletBinding()]Param()

function SetExecPolicy {
    $CurrentPolicy = Get-ExecutionPolicy
    Write-Verbose "The current execution policy is set to $CurrentPolicy"

    If ($CurrentPolicy -ne 'RemoteSigned')
    {
    
    Write-Verbose "Setting Policy to RemoteSigned"
    SET-EXECUTIONPOLICY RemoteSigned
    RETURN
    }

    }


    SetExecPolicy


    