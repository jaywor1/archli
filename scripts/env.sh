#!/bin/bash

# Colors
export NC='\033[0m'
export RED='\033[0;31m'
export BROWN='\033[0;33m'
export YELLOW='\033[1;33m'
export CYAN='\033[0;36m'
export BLUE='\033[0;34m'
export GREEN='\033[0;32m'
export WHITE='\033[1;37m'


# Disk related
export DISK="/dev/sda"

# PKGS
export PACSTRAP_PKGS=('linux' 'linux-firmware' 'base' 'base-devel' 'vi' 'vim' 'networkmanager' 'man-pages' 'grub' 'openssh' 'ansible' 'git')

# Config
export IS_HOSTNAME=archli
export IS_USER=archli
export SSH_DEFAULT_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILt0H3XF+Y5TeTrUpCr96LUvaMhoSzIIlZYgN0AXwu6n bia"
