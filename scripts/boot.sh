#!/bin/bash
### BOOT RELATED STUFF

# Install grub
pacman -S grub efibootmgr && echo_install "grub"

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

# Remove grub menu
sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub && echo_info "hidden grub menu"
grub-mkconfig -o /boot/grub/grub.cfg && echo_update "grub"

# Faster boot time
sed -i 's/HOOKS=.*/HOOKS=(systemd autodetect modconf kms keyboard keymap consolefont block filesystems fsck)/' /etc/mkinitcpio.conf && echo_update "/etc/mkinitcpio.conf"
mkinitcpio -p linux