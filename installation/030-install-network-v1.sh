#!/usr/bin/env bash
set -e

echo "Installing NetworkManager..."

sudo pacman --noconfirm --needed -S networkmanager
sudo pacman --noconfirm --needed -S network-manager-applet

echo "NetworkManager being activated..."

sudo systemctl enable NetworkManager.service

echo "################################################################"
echo "#########   network management software installed  #############"
echo "################################################################"

echo "Installing Broadcom wireless driver"

sudo pacman --noconfirm --needed -S broadcom-wl-dkms

#sudo cp 20-mac-address.conf /etc/NetworkManager/conf.d

echo "Driver installed"

