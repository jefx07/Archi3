#!/usr/bin/env bash
set -e

echo "Installing LightDM..."
sudo pacman -S \
  lightdm \
  lightdm-gtk-greeter \
  lightdm-gtk-greeter-settings

echo "Display manager being activated..."
sudo systemctl enable lightdm.service

echo "Reboot and select the proper desktop environment."

