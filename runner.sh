#!/bin/bash

source scripts/env.sh
source scripts/functions.sh
source scripts/test.sh

if [ $TESTS -ne 0 ]; then
	echo_error "All tests did not pass"
else
	echo_ok "All tests passed"
fi

source scripts/disk.sh
source scripts/configure.sh
source scripts/arch_chroot.sh

echo_info "[   INSTALL SUCCESS   ]: Rebooting in 15 seconds (Reminder: after shutdown unplug your installation USB)"
echo -e "\033[1;31mDON'T FORGET TO RUN /root/post_install.sh after booting"

sleep 15

reboot
