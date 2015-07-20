#!/bin/bash

HOME=$(eval echo ~${SUDO_USER})

sudo su -c whoami
sudo pacman -Syu
sudo pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit mesa
xinit
sudo pacman -S --noconfirm vicious xorg-twm xorg-xclock xterm
sudo pacman -S --noconfirm xf86-video-intel libva-intel-driver
sudo pacman -S --noconfirm xf86-input-synaptics
sudo pacman -S --noconfirm ruby

git clone https://github.com/adham90/dotfile.git $HOME/dotfile
sudo $HOME/dotfile/setup.sh

