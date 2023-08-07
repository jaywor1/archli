#!/bin/bash

source scripts/test.sh

if [ $? -ne 0 ]; then
	echo_error "All tests did not pass"
else
	echo_ok "All tests passed"
fi

source scripts/env.sh
source scripts/functions.sh
source scripts/disk.sh
source scripts/configure.sh
source scripts/arch_chroot

echo_info "[   INSTALL SUCCESS   ]: Rebooting in 10 seconds"

sleep 10

reboot
