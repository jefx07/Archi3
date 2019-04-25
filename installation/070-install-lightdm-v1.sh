#!/usr/bin/env bash
set -e

echo "Installing base packages..."
sudo pacman -S --noconfirm --needed xfce4

sudo pacman -S --noconfirm --needed thunar-archive-plugin thunar-media-tags-plugin xfce4-screenshooter

echo "Installing core software..."
sudo pacman --needed --noconfirm -S \
  curl \
  dconf-editor \
  dmidecode \
  dosfstools \
  gksu \
  gnome-keyring \
  gnome-themes-standard \
  gparted \
  gtk-engine-murrine \
  gvfs \
  lsb-release \
  ntfs-3g \
  p7zip \
  polkit-gnome \
  unzip \
  wget \
  xdg-user-dirs \
  zip

xdg-user-dirs-update


echo "Installing LightDM..."
sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings


echo "Display manager being activated..."
sudo systemctl enable lightdm.service

echo "Reboot and select the proper desktop environment."

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"

echo "Type sudo reboot"

