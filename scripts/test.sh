#!/bin/bash

echo_info "Running tests"

ping -c 1 8.8.8.8

if [ $? -ne 0 ]; then
	echo_info "Network error"
	export TESTS=1
else
	export TESTS=0
fi
