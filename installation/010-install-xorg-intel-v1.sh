#!/usr/bin/env bash
set -e

echo "This is the opensource driver for intel"

echo "Installing the Xorg Server..."

sudo pacman --noconfirm --needed -S xorg-server xorg-xinit xorg-twm xterm
sudo pacman --noconfirm --needed -S xf86-video-intel

