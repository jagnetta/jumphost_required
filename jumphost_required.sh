#!/bin/bash
# 
#
# If there were no arguments provided, exit.
#
if [ -z $1  ]; then
	exit 1
else
# do a lookup on the input and unless the IP starts with a 10 then fail
#
	if [[ `nslookup $1 | tail -2 | cut -d ' ' -f 2 | cut -d '.' -f 1` != 10 ]]; then
       		exit 1
	fi
fi
