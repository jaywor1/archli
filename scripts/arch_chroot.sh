#!/bin/bash

# Hostname
echo $HOSTNAME > /etc/hostname && echo_info "Hostname set to $HOSTNAME"

# locale-gen
vim /etc/locale.gen
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
grub-mkconfig -o /boot/grub/grub.cfg

