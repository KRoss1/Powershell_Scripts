param (
    [Parameter(Mandatory=$true)]
    [String]$Username
    [Parameter(Mandatory=$true)]
    [String]$Folder
)

Search-Mailbox -Identity $Username -SearchQuery "#$Folder#" -DeleteContent