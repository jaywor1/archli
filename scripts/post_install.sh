#!/bin/bash

# Enable and start NetworkManager
systemctl enable NetworkManager --now

# Config sshd
sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/"

# Enable and start sshd
systemctl enable sshd --now

# Update pacman
pacman -Syyu

echo "Run ansible playbook if you have one"
