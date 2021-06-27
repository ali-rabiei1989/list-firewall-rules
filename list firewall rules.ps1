# Author : Ali Rabiei
# Creation Date : 11/18/2020
# This script lists all enabled firewall rules
# --------------------------------------

Import-Module NetSecurity

$rules = Get-NetFirewallRule -Enabled True -direction Inbound

foreach ($rule in $rules){

    Get-NetFirewallPortFilter | ForEach-Object {
        [pscustomobject]@{
            Rule = $Rule.DisplayName
            Protocol = $_.Protocol
            LocalPort = $_.LocalPort
        }
    }
}
