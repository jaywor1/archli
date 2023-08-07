#!/bin/bash

# Umount all partitions
umount $DISK_FS && echo_info "Unmounted fs partition"
swapoff $SWAP && echo_info "Turn off swap"
# Create partition table
sfdisk /dev/sda < config/archli_sda_partition_table.txt && echo_ok "Created partition table"

# Swap
mkswap $SWAP && echo_ok "Created swap"
swapon $SWAP && echo_ok "Enabled swap"

# Filesystem
mkfs.ext4 $DISK_FS -F && echo_ok "Formated Archli Filesystem"
mount $DISK_FS /mnt && echo_ok "Filesystem mounted"

# Install packages via pacstrap
pacstrap /mnt ${PACSTRAP_PKGS[@]} && echo_install "Pacstrap packages"

# File Sytstem Table
genfstab -U /mnt > /mnt/etc/fstab && echo_ok "Generated file system table"

# Copy files
echo_info "Copying post_install.sh to root dir"
cp -v scripts/post_install.sh /mnt/root
chmod 744 /mnt/root/post_install.sh
chown root:root /mnt/root/post_install.sh

echo_ok "No errors in disk script"
