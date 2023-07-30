#!/bin/bash

# Umount all partitions
umount $DISK_FS && echo_info "Unmounted fs partition"
swapoff $SWAP && echo_info "Turn off swap"
# Create partition table
sfdisk /dev/sda < config/archli_sda_partition_table.txt && echo_info "Created partition table"

# Swap
mkswap $SWAP && echo_info "Created swap"
swapon $SWAP && echo_info "Enabled swap"

# Filesystem
mkfs.ext4 $DISK_FS -F && echo_info "Formated Archli Filesystem"
mount $DISK_FS /mnt && echo_info "Filesystem mounted"

# Install packages via pacstrap
pacstrap /mnt ${PACSTRAP_PKGS[@]} && echo_install "Pacstrap packages"

# File Sytstem Table
genfstab -U /mnt > /mnt/etc/fstab
