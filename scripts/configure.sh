#!/bin/bash

# Sudoers config
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /mnt/etc/sudoers && echo_config "Configured sudoers"
chmod 0440 /mnt/etc/sudoers && echo_config "/mnt/etc/sudoers perms to 0440"
chown root:root /mnt/etc/sudoers && echo_config "/mnt/etc/sudoers owner to root"

# Hostname
echo $IS_HOSTNAME > /mnt/etc/hostname && echo_config "Hostname set to $IS_HOSTNAME"

# locale-gen
sed -i 's/#en_US\.UTF-8/en_US\.UTF-8/' /mnt/etc/locale.gen && echo_ok "Set default locale (en_US.UTF-8)"
echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf && echo_config "Configured /mnt/etc/locale.conf"

# /etc/hosts
echo "\#Static table lookup for hostanems" > /mnt/etc/hosts
echo "127.0.0.1		    localhost" >> /mnt/etc/hosts
echo "::1		        localhost" >> /mnt/etc/hosts
echo "127.0.1.1		    ${IS_HOSTNAME}.localdomain	    $IS_HOSTNAME" >> /mnt/etc/hosts

echo_config "Configured /mnt/etc/hosts"

sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /mnt/etc/default/grub && echo_config "Hidden grub menu"

# Faster boot time
sed -i 's/HOOKS=.*/HOOKS=(systemd autodetect modconf kms keyboard keymap consolefont block filesystems fsck)/' /etc/mkinitcpio.conf && echo_update "/mnt/etc/mkinitcpio.conf"

# Configure sshd
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /mnt/etc/ssh/sshd_config && echo_config "Configured sshd"
mkdir "/mnt/home/$IS_USER/.ssh" && chown "$IS_USER:$IS_USER" "/mnt/home/$IS_USER/.ssh" && chmod 0755 "/mnt/home/$IS_USER/.ssh" && echo_ok "Created .ssh folder"
echo "$SSH_DEFAULT_KEY" >> "/mnt/home/$IS_USER/.ssh/authorized_keys" && echo_ok "Added default ssh key to access user $IS_USER"

