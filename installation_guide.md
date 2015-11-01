#Arch Linux installation guide

1. See what disk structure there is:
`$ lsblk`
2. Format boot partition:
`$ mkfs.ext4 /dev/sda<root>`
3. Mount:
``` 
$ mount /dev/sda<root> /mnt
$ mkdir /mnt/home
$ mount /dev/sda<home> /mnt/home
```
4. Change mirror for **pacman**:
`$ nano /etc/pacman.d/mirrorlist`
5. Install base and devel system:
`$ pacstrap -i /mnt base base-devel`
6. Generate fstab and check it:
```
$ genfstab -U -p /mnt >> /mnt/etc/fstab
$ nano /mnt/etc/fstab
```
7. Chroot to mnt:
`arch-chroot /mnt /bin/bash`
8. Set up locale, for me uncomment en_US UTF-8 in locale.gen:
```
$ nano /etc/locale.gen
$ locale-gen
```
9. Create locale.conf and export locale:
`$ echo LANG=en_US.UTF-8 > /etc/locale.conf`
`$ export LANG=en_US.UTF-8`
10. Set Time Zone by linking to time zone info to localtime:
`$ ln -s /usr/share/zoneinfo/Egypt /etc/localtime`
11. Set Hardware Clock to UTC:
`$ hwclock --systohc --utc`
12. Set Hostname:
`$ echo adham-pc > /etc/hostname`
13. Configure Network:
`$ systemctl enable dhcpcd.service`
14. Set root password:
`$ passwd`
15. Create new user that will be **sudo**:
`$ useradd -m -g users -G wheel,video -s /bin/bash adham`
16. Install **sudo** with **pacman**:
`$ pacman -S sudo`
17. Uncomment wheel group from sudoers **”%wheel ALL=(ALL)”**, so that user just created can be sudo:
`$ visudo`
18. Set password to created user:
`$ passwd adham`
19. Since we use **MBR** not **GPT** lets install **GRUB BIOS** bootloader:
`pacman -S grub-bios`
20. Install and configure **GRUB** to **/dev/sda**:
```
$ grub-install --recheck /dev/sda
$ grub-mkconfig -o /boot/grub/grub.cfg
```
21. Exit chroot, unmount mounted partitions and reboot:
```
$ exit
$ umount -R /mnt/home
$ umount -R /mnt
$ reboot
```
22. Install X server:
`$ pacman -S xorg-server xorg-server-utils xorg-xinit`
23. Install mesa for 3D support:
`$ pacman -S mesa`
24. Log or su as created user. Copy .xinitrc and add following content:
```
$ xinit
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc
$ nano ~/.xinitrc
```
25. Install xterm, xclock twm and awsome:
`$ pacman -S awsome vicious xorg-twm xorg-xclock xterm`
26. Intel graphics
```
$ pacman -S xf86-video-intel libva-intel-driver nvidia nvidia-utils
```
27. Config **awsome**:
```
$ echo "exec awesome" >> ~/.xinitrc
$ mkdir -p ~/.config/awesome/
$ cp /etc/xdg/awesome/rc.lua ~/.config/awesome/ # basic config
```
or config **i3**
`$ pacman -S i3 dmenu`
copy i3 folder in to your .config file
copy i3status.conf in to your home dir and rename it to `.i3status.conf`
use font awesome to get the status bar icons 
font-awesome cheatsheet
https://fortawesome.github.io/Font-Awesome/cheatsheet/

28. Install Laptop touchpad:
`$ pacman -S xf86-input-synaptics`

29. Update with pacman:
`$ pacman -Syu`
