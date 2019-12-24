#!/bin/bash

while [ 1 ]
do
	current_time=$(date '+%H:%M:%S')
	put_col=$(($(tput cols) - 8))
	( tput sc; tput cup 0 $put_col; echo $current_time; tput rc; )
	sleep 0.5
done
