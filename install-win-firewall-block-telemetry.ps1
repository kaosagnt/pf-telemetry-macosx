# %BEGIN_COPYRIGHT%
# 
# Copyright 2019-2025 Ian McWilliam (kaosagnt@gmail.com).
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# %END_COPYRIGHT%

# Powershell to load the range of telemetry IP addresses
# to block.

#Requires -RunAsAdministrator

$telemetry_file="./pf.anchors.org.ianm.pf/telemetry-ipaddresses"
$telemetry_name="Block Telemetry IP Addresses"

If( Test-Path -Path $telemetry_file ) {

	$ip_addresses = Get-Content -Path $telemetry_file  |
		Where-Object { $_ -match '^\d'}

	# Debug
	foreach ($ip_address in $ip_addresses) { Write-Host "IP Address = $ip_address" }
	Write-Host ""

	# Add to firewall.
	Write-Host "Adding Telemetry IP Addresses to Windoze Firewall."

	#Set-NetFirewallProfile -All -Enabled true

	Remove-NetFirewallRule -DisplayName "$telemetry_name" -ErrorAction SilentlyContinue

	New-NetFirewallRule -DisplayName "$telemetry_name" -Direction Outbound -Enabled True `
		-Action Block -RemoteAddress ([string[]]$ip_addresses)
	
	try {
		Get-NetFirewallRule -DisplayName "$telemetry_name" -ErrorAction Stop
		Write-Host "Status: Enabled"

	} catch [Exception] {

		write-host $_.Exception.message
	}
} else {

    Write-Host "Unable to find telemetry file: $telemetry_file"
}

Write-Host ""
Write-Host "Press Enter to exit."
Read-Host
