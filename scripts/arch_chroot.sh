#!/bin/bash

archchroot 'locale-gen'

# Setup user
archchroot "useradd -mG wheel $IS_USER"
echo -e "${WHITE}Set password for ${IS_USER}${NC}"
archchroot "passwd $IS_USER"
echo_info "User $IS_USER added"

echo -e "${WHITE}Set root password${NC}"
archchroot "passwd"

archchroot "grub-install --target=i386-pc $DISK"

# Remove grub menu
archchroot "grub-mkconfig -o /boot/grub/grub.cfg"
echo_update "Grub updated"

#archchroot "mkinitcpio -p linux"


archchroot "mkdir /home/${IS_USER}/.ssh"
archchroot "chown ${IS_USER}:${IS_USER} /home/${IS_USER}/.ssh"
archchroot "chmod 0755 /home/${IS_USER}/.ssh"
echo ${SSH_DEFAULT_KEY} >> /mnt/home/${IS_USER}/.ssh/authorized_keys
echo_info "SSH setup done"
