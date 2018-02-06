param (
    [Parameter(Mandatory=$true)]
    [String]$Credential
)

$UserCredential = Get-Credential -Credential $Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

Connect-MsolService -Credential $UserCredential