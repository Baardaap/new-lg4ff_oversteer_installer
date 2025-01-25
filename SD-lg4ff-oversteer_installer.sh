#!/bin/bash

sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux holo

sudo pacman -Sy --noconfirm
sudo pacman -S base-devel dkms linux-neptune-65-headers initramfs-tools --noconfirm

git clone https://aur.archlinux.org/oversteer.git
cd oversteer
makepkg -sric --noconfirm
cd ../
sudo rm -r oversteer

cd /usr/src
sudo git clone https://github.com/berarma/new-lg4ff.git
cd ~/

sudo dkms remove new-lg4ff/0.4.2 -all
sudo dkms install /urs/src/new-lg4ff

sudo mkinitcpio -P

sudo rm -r /usr/src/new-lg4ff
sudo steamos-readonly enable