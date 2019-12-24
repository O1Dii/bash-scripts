#!/bin/bash

public_ip=$(curl -s ifconfig.me)

if [[ "$public_ip" =~ [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]]
then
	echo your public ip is $public_ip
else
	echo problems with getting public ip from server
fi

echo your private ip is $(hostname -I | awk '{print $1}')

if [[ $# -lt 1 ]]
then
	echo host not passed
	exit 0
fi

returned_packages_amount=$(ping -c 1 -q $1 | grep loss | awk '{print $4}')
if [[ $returned_packages_amount > 0 ]]
then
	echo desired service is up
else
	echo desired service is down
fi

echo counting jumps...

echo amount of jumps is $(traceroute $1 | awk 'END {print $1}')

