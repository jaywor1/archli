#!/bin/bash

# Setup user
archchroot "useradd -mG wheel $USER"
echo "Set password for $USER"
archchroot "passwd $USER"
echo_info "User $USER added"

archchroot "loacle-gen"

echo "Set root password"
archchroot passwd

archchroot "grub-install --target=i386-pc $DISK"

# Remove grub menu
archchroot "grub-mkconfig -o /boot/grub/grub.cfg"
echo_update "Grub updated"

archchroot mkinitcpio -p linux