$certs = Get-ChildItem -Path Cert:\LocalMachine\My | Select-Object Thumbprint, FriendlyName, NotAfter
$certs | ForEach-Object {
    [PSCustomObject]@{
        "{#CERTTHUMBPRINT}" = $_.Thumbprint
        "{#CERTNAME}"       = $_.FriendlyName
        "{#CERTEXPIRY}"     = $_.NotAfter
    }
} | ConvertTo-Json
