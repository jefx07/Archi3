#!/usr/bin/env bash
set -e

echo "Installing prerequisites for pacaur..."
sudo pacman --needed -S base-devel fakeroot jshon expac

echo "Installing pacaur..."
mkdir /tmp/tmp-pacaur
cd /tmp/tmp-pacaur
wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg
sudo pacman --noconfirm -U *.tar.xz
cd -

echo "Installing base packages..."
pacaur --noedit -S \
  i3-gaps-next-git

echo "Installing window manager dependencies..."
pacaur --needed --noedit -S \
  xcb-util-keysyms \
  xcb-util-wm \
  xcb-util-cursor \
  yajl \
  startup-notification \
  libev

echo "Installing core software..."
pacaur --needed --noedit -S \
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

echo "Installing tools..."
pacaur --needed --noedit -S \
  i3lock \
  i3blocks-gaps-git \
  i3status-git \
  acpi \
  arandr \
  compton-git \
  dmenu \
  dunst \
  evince \
  feh \
  file-roller \
  galculator \
  glxinfo \
  gsimplecal \
  htop \
  imagemagick \
  lm_sensors \
  lxappearance \
  lxinput \
  mpv \
  network-manager-applet \
  pavucontrol \
  pulseaudio-ctl \
  python \
  ranger \
  rofi \
  screenfetch \
  scrot \
  thunar \
  thunar-archive-plugin \
  ttf-font-awesome \
  ttf-hack \
  tumbler \
  viewnior \
  vim \
  w3m \
  xclip \
  xcursor-breeze \
  xfburn \
  xfce4-power-manager \
  youtube-dl

echo "Installing LightDM..."
sudo pacman -S \
  lightdm \
  lightdm-gtk-greeter \
  lightdm-gtk-greeter-settings

echo "Display manager being activated..."
sudo systemctl enable lightdm.service

echo "Reboot and select the proper desktop environment."

