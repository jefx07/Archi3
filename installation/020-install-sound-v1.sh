#!/usr/bin/env bash
set -e

echo "Installing PulseAudio..."

sudo pacman --noconfirm --needed -S pulseaudio pulseaudio-alsa
sudo pacman --noconfirm --needed -S alsa-utils alsa-plugins alsa-lib

