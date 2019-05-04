#!/bin/bash
# Website: https://t3chnocat.com

# Text coloring
yellow='\033[1;33m'
red='\033[1;91m'
nc='\033[0m'

##### User variables start #####

# Change this to your wireless interface name
nic=wlan1

# Change this to the directory you want to save captures to
save=/root/wpa-captures

# Change this to your wordlist folder
wordlist=/usr/share/wordlists

# Wifi channels to be scanned - default is all
channel=1,2,3,4,5,6,7,8,9,10,11,12,13,14,36,38,40,42,44,46,48,52,54,56,58,60,62,64,100,102,104,106,108,110,112,114,116,118,120,122,124,126,128,132,134,136,138,140,149,151,153,155,157,159,161

# Verbosity of status while capturing. 1=EAPOL, 2=PROBEREQUEST/PROBERESPONSE, 4=AUTHENTICATION, 8=ASSOCIATION. This is a bitmasked so to set to 15(1+2+4+8) to see all
status=1

# Comment this to enable deauthentication of clients. WARNING: THIS CAN BE DISRUPTIVE
deauth=--disable_deauthentications

##### User variables end #####

while :
do

	clear

	echo
	echo -e "${yellow} _____    _    ______   __    _   _  ______  __ ${nc}"
	echo -e "${yellow}| ____|  / \  / ___\ \ / /   | | | |/ ___\ \/ / ${nc}"
	echo -e "${yellow}|  _|   / _ \ \___ \\  V _____| |_| | |    \  /  ${nc}"
	echo -e "${yellow}| |___ / ___ \ ___) || |_____|  _  | |___ /  \  ${nc}"
	echo -e "${yellow}|_____/_/   \_|____/ |_|     |_| |_|\____/_/\_\ ${nc}"
	echo
	echo -e "${red}		        -Written by t3chnocat-${nc}"
	echo
	echo "1. Prepare the wifi adapter"
	echo "2. Capture all the things!"
	echo "3. Targeted capture"
	echo "4. Convert capture files for Hashcat"
	echo "5. Crack files with Hashcat"
	echo "6. View handshakes/PMKIDs from capture file"
	echo
	echo
	echo "Any other key to exit."

	echo
	read -p $'\e[91m'"Enter the number of the action you want: "$'\e[0m' action

	if	[ "$action" = "1" ]
	then
		./assets/01_easy-hcx-prep $nic
	elif	[ "$action" = "2" ]
	then
		./assets/02_easy-hcx-capture-all $nic $save $status $channel $deauth
	elif	[ "$action" = "3" ]
	then
		./assets/03_easy-hcx-capture-targeted $nic $save $channel $status $deauth
	elif	[ "$action" = "4" ]
	then
		./assets/04_easy-hcx-convert $save
	elif	[ "$action" = "5" ]
	then
		./assets/05_easy-hcx-hashcat $save $wordlist
	elif	[ "$action" = "6" ]
	then
		./assets/06_easy-hcx-capture-info $save
	else
		exit;
	fi
done
