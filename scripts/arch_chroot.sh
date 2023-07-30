#!/bin/bash

# Setup user
useradd -mG wheel $USER
echo "Set password for $USER"
passwd $USER
echo_info "User $USER added"

# Sudoers config
cp -v /config/sudoers /etc/sudoers
chmod 0440 /etc/sudoers && echo_config "/etc/sudoers perms to 0440"
chown root:root /etc/sudoers && echo_config "/etc/sudoers owner to root"

# Hostname
echo $HOSTNAME > /etc/hostname && echo_info "Hostname set to $HOSTNAME"

# locale-gen
cp -v /config/locale.gen /etc/locale.gen
loacle-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo_info "locale-gen"

# /etc/hosts
echo "Static table lookup for hostanems" > /etc/hosts
echo "127.0.0.1		localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1		${HOSTNAME}.localdomain	$HOSTNAME" >> /etc/hosts

echo_info "/etc/hosts configured"

echo "Set root password"
passwd

pacman -S --noconfirm grub
grub-install --target=i386-pc $DISK

# Remove grub menu
sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub && echo_info "hidden grub menu"
grub-mkconfig -o /boot/grub/grub.cfg && echo_update "grub"

# Faster boot time
sed -i 's/HOOKS=.*/HOOKS=(systemd autodetect modconf kms keyboard keymap consolefont block filesystems fsck)/' /etc/mkinitcpio.conf && echo_update "/etc/mkinitcpio.conf"
mkinitcpio -p linux


# Install jellyfin
source /scripts/jellyfin.sh
