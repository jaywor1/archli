#!/bin/bash

echo "TESTING"
sudo pacman -Syu
sudo mkinitcpio -p linux

sudo pacman -S network-manager
sudo pacman -S nano
sudo pacman -S g++
sudo pacman -S firefox
sudo pacman -S base
sudo pacman -S base-devel
sudo pacman -S linux
sudo pacman -S linux-firmware
sudo pacman -S feh
sudo pacman -S xxd
sudo pacman -S vlc
