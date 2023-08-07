#!/bin/bash

archchroot 'locale-gen'

# Setup user
archchroot "useradd -mG wheel $IS_USER"
echo "Set password for $IS_USER"
archchroot "passwd $IS_USER"
echo_info "User $IS_USER added"

echo "Set root password"
archchroot passwd

archchroot "grub-install --target=i386-pc $DISK"

# Remove grub menu
archchroot "grub-mkconfig -o /boot/grub/grub.cfg"
echo_update "Grub updated"

archchroot "mkinitcpio -p linux"
