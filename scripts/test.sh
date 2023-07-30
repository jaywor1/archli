#!/bin/bash

echo_info "Running tests"

ping -c 1 8.8.8.8

if [ $? -ne 0 ]; then
	echo_info "Network error"
	exit 1	
else
	exit 0
fi
