#!/bin/bash
# 
# Check whether the user had supplied -h or --help.  If yes, then display usage example.
#
	if [[ $1 == "--help" || $1 == "-h" ]]
		then
			echo -e "\nThis script will attempt to determine if a jumphost is needed to reach the target server.\nUsage: ./jumphost_needed.sh [hostname]\n"
			exit 1
	fi
#
# If there were no arguments provided, and they didn't ask for help, prompt for the input and continue.
#
	if [ $# -lt 1 ]
		then
			echo -e -n "\nEnter the servername please (e.g., "ukp-g1" or "ukp-g1.tpn.thinkingphones.net").\n\tServer Name:  "
			read -r hostname
		else
			hostname=$1
	fi
#
#
#echo -e "\aThanks!\n\tYou entered:  $text.\n"
nslookup $hostname

dig $hostname
