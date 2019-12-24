#!/bin/bash

for name in $(ls $1 -p | grep -v /)
do
	if [[ "$name" =~ ^[A-Z0-9_\.\-]+$ ]]
	then
		var=$(echo $name | tr A-Z a-z)
	else
		var=$(echo $name | tr a-z A-Z)
	fi

	mv $1/$name $1/$var
done
