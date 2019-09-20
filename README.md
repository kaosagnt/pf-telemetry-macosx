macOS X / Windows 10 Telemetry filter
--------------------------------------

macOS
-----

- Uses the PF firewall software in built to the Macos Kernel to block application egress of telemetry data.

- Will stop Virtual Machine guest OS from sending telmetry data as well.

- Installs a LaunchDeamon plist file to load the pf packet filter rules and table when Macos boots. LaunchDaemon will wait for the network to be ready before loading rules and retry upon failure.

- Uses the -E flag to pfctl (Enable the packet filter and increment the pf enable reference count)

- Places the block rule and table into its own pf anchor keeping the rules separate from the Macos default rules.

- Installs a newsyslog config file to rotate the log file.

````
pfctl -v -s Anchors
No ALTQ support in kernel
ALTQ related functions disabled
  com.apple
  com.apple/200.AirDrop
  com.apple/200.AirDrop/Bonjour
  com.apple/250.ApplicationFirewall
  org.ianm.pf
  org.ianm.pf/telemetry
````

- show_pf_telemetry_table script will show status of loaded telemetry table.

````
show_pf_telemetry_table

No ALTQ support in kernel
ALTQ related functions disabled
   13.107.21.200
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 176                Bytes: 11008              ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   52.237.236.160
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 66                 Bytes: 4128               ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   111.221.29.13
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 407                Bytes: 25456              ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   111.221.29.253
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 515                Bytes: 32240              ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   117.18.232.200
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 187                Bytes: 11696              ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   203.5.76.9
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 99                 Bytes: 6192               ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   203.5.76.25
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 88                 Bytes: 5504               ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]
   204.79.197.200
	Cleared:     Mon Aug 20 09:29:46 2018
	In/Block:    [ Packets: 0                  Bytes: 0                  ]
	In/Pass:     [ Packets: 0                  Bytes: 0                  ]
	Out/Block:   [ Packets: 143                Bytes: 8944               ]
	Out/Pass:    [ Packets: 0                  Bytes: 0                  ]

````

Windows 10 Firewall
--------------------

- Uses the Windows 10 firewall built into the Windows to block application egress of telemetry data.

install_win_firewall_block_telemetry.bat
install-win-firewall-block-telemetry.ps1

- Run the install_win_firewall_block_telemetry.bat using the RunAS Administrator function of Windows. This will parse the telemetry IP Address file and add an outgoing block filter rule. 
