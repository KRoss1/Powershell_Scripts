<#
.AUTHOR
Kieran Ross

.SYNOPSIS
Lists All Groups in a Specific OU and also returns each Member of the group and exports to CSV

.DESCRIPTION
Checks the OU for all groups and returns them into a Variable. Then for each group it stores the members in a variable.
Then writes out to an Array the Group that is currently being checked and each member of that group. When all the members are done, it moves to the next group in the Group Array.
Once all groups are finished it will export a CSV file to the Current Users Desktop.

.PARAMETER OU
Specifies the OU you want to search

.EXAMPLE
.\List_All_Groups_Plus_Members.ps1 -OU "OU=Office,DC=Company,DC=Local"


#>

[CmdletBinding()] param (
    [Parameter(Mandatory=$true)]
        [String]$OU
    ) 

Write-Verbose "Creating Output Array Object"
$outArray = @()

Write-Verbose "Getting All the Groups in $OU"
$Groups = Get-ADGroup -filter * -SearchBase $OU


Write-Verbose "Starting to Loop through Groups"
foreach ($group in $Groups){

Write-Verbose "Current Group: $group"
Write-Verbose "Getting All Members of this Group"
    $Members = Get-ADGroupMember $group


Write-Verbose "Starting to Loop through Members"
    foreach ($member in $Members){
        $groupName = $group | select -ExpandProperty Name
        $memberName = $Member.Name

        $Out = "" | select "Group", "Member"
        $Out.group = $groupName
        $Out.member = $memberName

        Write-Verbose "Adding Information to Output Array - Member: $memberName"
        $outArray += $Out
    }
   
} 

Write-Verbose "Exporting Output Array to CSV"
$outArray | export-csv "c:\Users\$env:Username\Desktop\List_of_Groups_and_Members.csv"
Write-Verbose "Export Location: c:\Users\$env:Username\Desktop\List_of_Groups_and_Members.csv"