<#

.SYNOPSIS
Gets Status of Veeam Backup Job

.DESCRIPTION
Uses Veeam Powershell commands to retrieve backup status

.PARAMETER VBServer
Specifies the Server where Veeam is installed

.PARAMETER VBJob
Specifies the Job you want to know the status of


.EXAMPLE
Get_Veeam_Backup_Job_Status.ps1 -VBServer SOL-BAK01 -VBJob "VM Backup"



#>

param(
    [Parameter(Mandatory=$true)]
        [string]$VBServer,
    [Parameter(Mandatory=$true)]
        [string]$VBJob
)

Add-PSSnapin veeampssnapin

Write-Verbose "Connecting to $VBserver"
Connect-VBRServer -Server $VBServer

$Job = Get-VBRJob -Name $VBJob



$Results = New-Object PSObject -property @{JobName = $Job.Name; Status = $Job.State;}

$Results | Select JobName, Status