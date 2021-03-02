#!/bin/bash
# we're testing to see if we need to use the jumphost.  we don't need the jumphost when the target IP address starts with 10.
# this script is called by ssh config, so that script is checking to see if it needs the jumphost.
# if this script exits successfully, then it means that input was provided, and that the ip address did not start with 10
# in the second case we're forcing the "false" value "1" if the "starts with a 10" condition is met
# if the 10 is found, we exit with 1 and that tells ssh we didn't need the jump
# if the value turns out to not be a 10, then this script exits successfully, and ssh invokes the jump condiion. 
#
# If there were no arguments provided, exit.  You really don't want to wait for nslookup to timeout over nothing, do you?
if [ -z $1  ]; then
	exit 1
# do a lookup on the input and if the IP address starts with a 10, then fail; otherwise, exit successfully, and let SSH use the jumphost 
#
elif [[ `nslookup $1 | tail -2 | head -1 | cut -d ' ' -f 2 | cut -d '.' -f 1` == 10 ]]; then
	exit 1
fi
