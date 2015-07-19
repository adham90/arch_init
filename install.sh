#!/bin/bash

#pacman -Syu
#pacman -S --noconfirm xorg-server xorg-server-utils xorg-xinit mesa
#xinit
#pacman -S --noconfirm vicious xorg-twm xorg-xclock xterm
#pacman -S --noconfirm xf86-video-intel libva-intel-driver
#pacman -S --noconfirm xf86-input-synaptics
#pacman -S --noconfirm ruby

git clone https://github.com/adham90/dotfile.git dotfile
ruby dotfile/setup.rb

