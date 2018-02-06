param (
    [Parameter(Mandatory=$true)]
    [String]$Username
)

get-mailboxfolderstatistics $Username | Format-Table Name, Identity, folderpath, foldertype

