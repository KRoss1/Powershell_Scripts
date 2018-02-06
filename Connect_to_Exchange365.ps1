param (
    [Parameter(Mandatory=$true)]
    [String]$Credential
)

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $Credential -Authentication Basic -AllowRedirection

Import-PSSession $Session

Connect-MsolService -Credential $Credential