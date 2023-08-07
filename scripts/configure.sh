#!/bin/bash

# Setup user
useradd -mG wheel $USER
echo "Set password for $USER"
passwd $USER
echo_info "User $USER added"

# Sudoers config
sed -i 's/^#%wheel ALL=(ALL:ALL) ALL$/%wheel ALL=(ALL:ALL) ALL/' /mnt/etc/sudoers && echo_config "Configured sudoers"
chmod 0440 /mnt/etc/sudoers && echo_config "/mnt/etc/sudoers perms to 0440"
chown root:root /mnt/etc/sudoers && echo_config "/mnt/etc/sudoers owner to root"

# Hostname
echo $HOSTNAME > /mnt/etc/hostname && echo_config "Hostname set to $HOSTNAME"

# locale-gen
sed -i 's/#en_US\.UTF-8/en_US\.UTF-8/' /mnt/etc/locale.gen && echo_ok "Set default locale (en_US.UTF-8)"
echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf && echo_config "Configured /mnt/etc/locale.conf"

# /etc/hosts
/mnt/etc/hosts < EOF
Static table lookup for hostanems
echo 127.0.0.1		    localhost
echo ::1		        localhost
echo 127.0.1.1		    ${HOSTNAME}.localdomain	    $HOSTNAME
EOF

echo_config "/mnt/etc/hosts configured"

echo "Set root password"
passwd


sed -i 's/GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub && echo_config "Hidden grub menu"

# Faster boot time
sed -i 's/HOOKS=.*/HOOKS=(systemd autodetect modconf kms keyboard keymap consolefont block filesystems fsck)/' /etc/mkinitcpio.conf && echo_update "/mnt/etc/mkinitcpio.conf"
mkinitcpio -p linux


# Install jellyfin
source /scripts/jellyfin.sh
