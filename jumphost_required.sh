#!/bin/bash
# we're testing to see if we need to use the jumphost.  we don't need the jumphost when the target IP address starts with 10.
# this script is called by ssh config, so that script is checking to see if it needs the jumphost.
# if this script exits successfully, then it means that input was provided, and that the ip address did not start with 10
# in the second case we're forcing the "false" value "1" if the "starts with a 10" condition is met
# if the 10 is found, we exit with 1 and that tells ssh we didn't need the jump
# if the value turns out to not be a 10, then this script exits successfully, and ssh invokes the jump condiion. 
#
# If there were no arguments provided, exit.  You really don't want to wait for nslookup to timeout over nothing, do you?

if [ -z $1 ]; then 
	echo "No input given."
	exit 1
else
	hostTest=`nslookup $1 | tail -2 | head -1 | cut -d ' ' -f 2 | cut -d '.' -f 1`
	echo "hostTest is now:  $hostTest"
	if [[ "$hostTest" =~ [a-zA-Z] ]] ; then
		echo "$hostTest is not a number!"
		exit 1
	elif [[ "$hostTest" -eq "10" ]] ; then
		echo "$hostTest is a 10, take the express!" 
		exit 1
	else
		echo "$hostTest is not a 10, you need a jump!"
		exit 0
	fi
fi
