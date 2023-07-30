#!/bin/bash

source scripts/test.sh

if [ $? -ne 0 ]; then
	echo "[   TERMINATING   ]: Tests didn't pass"
else
	echo_info "All tests passed"
fi

source scripts/env.sh
source scripts/functions.sh
source scripts/disk.sh

cp -rv scripts /mnt/scripts
cp -rv config /mnt/config
arch-chroot /mnt bash -c /scripts/arch-chroot.sh

echo_info "[   INSTALL SUCCESS   ]: Rebooting in 10 seconds"

sleep 10

reboot
