#!/bin/bash
# 
#
# If there were no arguments provided, exit.
#
if [ -z $1  ]; then
	exit 1
else
# do a lookup on the input and if the IP starts with a 10 then fail
#
	# result=`nslookup $1 | tail -2 | cut -d ' ' -f 2 | cut -d '.' -f 1`
	if [[ `nslookup $1 | tail -2 | cut -d ' ' -f 2 | cut -d '.' -f 1` == 10 || -n `nslookup $1 | grep \*` ]]; then
       		exit 1
	fi
fi
