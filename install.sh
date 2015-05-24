#!/bin/bash

pacman -Sy xorg-server xorg-server-utils xorg-xinit mesa
xinit
cp /etc/X11/xinit/xinitrc ~/.xinitrc
pacman -Sy awsome vicious xorg-twm xorg-xclock xterm
pacman -Sy xf86-video-intel libva-intel-driver
echo "exec awesome" >> ~/.xinitrc
mkdir -p ~/.config/awesome/
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/
pacman -Sy xf86-input-synaptics
pacman -Syu


