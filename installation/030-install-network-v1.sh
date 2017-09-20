#!/usr/bin/env bash
set -e

echo "Installing NetworkManager..."

sudo pacman --noconfirm --needed -S networkmanager

echo "NetworkManager being activated..."

sudo systemctl enable NetworkManager.service

