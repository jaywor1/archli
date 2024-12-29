#!/bin/bash


# Umount all partitions
umount "$DISK_FS" && echo_info "Unmounted fs partition"
swapoff "$SWAP" && echo_info "Turn off swap"

echo_info "Starting gdisk partition on ${DISK}..."
(
  echo o      # Create new partition table

  # BIOS boot partition
  echo n      # Add new partition
  echo 1      # Partition number
  echo ''     # First sector
  echo +10MB  # Size of 10MB
  echo ef02   # Type for bios boot

  # Linux swap
  echo n      # Create new partition
  echo 2      # Partition number
  echo ''     # First sector
  echo +16GB  # Size of swap
  echo '8300' # Linux filesystem

  # Root partition
  echo n      # Add new partition
  echo 3      # Partition number
  echo ''     # First sector
  echo ''     # Last sector
  echo '8300' # Linux filesystem
) | gdisk "$DISK"

# Swap
mkswap "${DISK}2" && echo_ok "Created swap"
swapon "${DISK}2" && echo_ok "Enabled swap"

# Filesystem
mkfs.btrfs "${DISK}3" && echo_ok "Formated Archli Filesystem (btrfs)"
mount "${DISK}3" /mnt && echo_ok "Filesystem mounted"

# Install packages via pacstrap
pacstrap /mnt "${PACSTRAP_PKGS[@]}" && echo_install "Pacstrap packages"

# File Sytstem Table
genfstab -U /mnt > /mnt/etc/fstab && echo_ok "Generated file system table"

# Auto mount for ssd drive
#echo '# External SSD drive mount' >> /mnt/etc/fstab
#echo 'UUID="8C86-4B0C"	/media		exfat		rw,auto,user	0 2' >> /mnt/etc/fstab

# Copy files
echo_info "Copying post_install.sh to root dir"
cp -v scripts/post_install.sh /mnt/root
chmod 744 /mnt/root/post_install.sh
chown root:root /mnt/root/post_install.sh

echo_ok "No errors in disk script"
