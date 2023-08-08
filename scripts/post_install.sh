#!/bin/bash

# Enable and start NetworkManager
systemctl enable NetworkManager --now

# Enable and start sshd
systemctl enable sshd --now

# Update pacman
pacman -Syyu --noconfirm

echo "Run ansible playbook if you have one"
