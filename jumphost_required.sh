#!/bin/bash
# 
# Check whether the user had supplied -h or --help.  If yes, then display usage example.
#
	#if [[ $1 == "--help" || $1 == "-h" ]]
		#then
			#echo -e "\nThis script will attempt to determine if a jumphost is needed to reach the target server.\nUsage: ./jumphost_needed.sh [hostname]\n"
			#exit 1
	#fi
#
# If there were no arguments provided, and they didn't ask for help, prompt for the input and continue.
#
	if [ -z $1  ]
		then
		exit 1
	else
	result=`nslookup $1 | tail -2 | cut -d ' ' -f 2 | cut -d '.' -f 1`
	if [ $result == 10 ]
		then
               		 exit 1
		fi

	fi
