#!/bin/bash

function print_slow(){
	for (( i=0; i<${#1}; i++ )); do
		if [ "${1:$i:1}" == "|" ]; then
			echo ""
		else
  			printf "${1:$i:1}"
		fi
		sleep $2
	done
	echo ""
}

print_slow "ABCDEFGHIJKLMN|OPQRSTUVWXYZ" 0.2
