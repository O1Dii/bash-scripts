#!/bin/bash

if [[ $# -lt 3 ]]
then
	echo not enough arguments
	exit 0
fi

calc(){ awk "BEGIN { print "$*" }"; }

case "$2" in
	\+ ) echo $(calc $1+$3);;
	\- ) echo $(calc $1-$3);;
	x ) echo $(calc $1*$3);;
	/ ) echo $(calc $1/$3);;
	* ) echo wrong operation;;
esac

exit 0
