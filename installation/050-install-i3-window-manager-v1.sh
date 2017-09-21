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
  i3-gaps \
  termite-git

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
  compton \
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
  volumeicon \
  w3m \
  xclip \
  xcursor-breeze \
  xdotool \
  xfburn \
  xfce4-power-manager \
  youtube-dl

#  pavucontrol \
#  pulseaudio-ctl \

