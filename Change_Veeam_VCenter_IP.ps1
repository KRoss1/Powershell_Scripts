<#

.SYNOPSIS
Change the IP Address of VCenter Server used in Veeam

.DESCRIPTION
Uses Veeam Powershell commands to change IP Address of VCenter

.PARAMETER VBServer
Specifies the Server where Veeam is installed

.PARAMETER VBJob
Specifies the new IP of the VCenter


.EXAMPLE
Change_Veeam_VCenter_IP.ps1 -VBServer SOL-BAK01 -VBJob "192.128.10.50"

#>

param(
    [Parameter(Mandatory=$true)]
        [string]$VBServer,
    [Parameter(Mandatory=$true)]
        [string]$VCenterIP
)

Add-PSSnapin veeampssnapin

Write-Verbose "Connecting to $VBserver"
Connect-VBRServer -Server $VBServer

$Server = Get-VBRServer

$Server.SetName("$VBServer")