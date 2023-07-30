#!/bin/bash

pacman -S --noconfirm git && echo_install "git"

cd /opt
git clone https://aur.archlinux.org/jellyfin.git
cd jellyfin
su $USER
makepkg -si --noconfirm && echo_install "jellyfin"

# Exit to root
exit

systemctl enable jellyfin && echo_info "Enabled jellyfin.service"
systemctl start jellyfin && echo_info "Started jellyfin.service"
