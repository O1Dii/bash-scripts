#!/bin/bash

cols=$(tput cols)
center=$(( $cols / 2 ))

echo_sep_string () {
	string_length=$(echo $1 | wc -c)
	string_half_length=$(( $string_length / 2 ))
	data_string="$center $cols $string_half_length"

	first_part=$(echo $data_string | awk '{for(i = 0; i < $1 - $3; i++) print "="}' | tr -d '\n')
	second_part=$(echo $data_string | awk '{for(i = $1 + $3; i < $2; i++) print "="}' | tr -d '\n')

	echo -e "\n$first_part$1$second_part\n"
}

echo_sep_string 'Currently logged user'
whoami

echo_sep_string 'Current shell'
tput longname; echo

echo_sep_string 'Home directory'
echo $HOME

echo_sep_string 'OS type'
uname -m

echo_sep_string 'Current path setting(formated)'
echo $PATH | tr ':' '\n'

echo_sep_string 'Current working directory'
pwd

echo_sep_string 'Number of currently logged users'
who -q | awk 'END {print substr($0, length($0), 1)}'

echo_sep_string 'OS info'
uname -s -r -v

echo_sep_string 'Available shells'
cat /etc/shells | sed '1d'

echo_sep_string 'Mouse info'
mouse_device_id=$(xinput list --short | grep -i mouse | grep -oP '(?<=id=)\d+')
xinput list-props $mouse_device_id | sed 's/^\s*//g'

echo_sep_string 'CPU info'
lscpu

echo_sep_string 'Memory info'
lsmem

echo_sep_string 'Storage info'
lshw -c storage 2> /dev/null | sed '1d' | sed 's/^\s*//g'

echo_sep_string 'File system info'
df -h
