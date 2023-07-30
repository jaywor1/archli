#!/bin/bash

# Colors
export NC='\033[0m'
export RED='\033[0;31m'
export BROWN='\033[0;33m'
export YELLOW='\033[1;33m'
export CYAN='\033[0;36m'
export BLUE='\033[0;34m'


# Disk related
export DISK="/dev/sda"
export SWAP="${DISK}2"
export DISK_FS="${DISK}3"

# PKGS
export PACSTRAP_PKGS=('linux' 'linux-firmware' 'base' 'base-devel' 'vi' 'vim' 'networkmanager' 'man-pages')

# Config
export HOSTNAME=$HOSTNAME
export USER=archli
