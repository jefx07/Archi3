#!/usr/bin/env bash
set -e

echo "Installing dependencies..."
sudo pacman -S expac yajl --noconfirm

mkdir ~/tmp
cd ~/tmp/

echo "Installing cower..."
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg -i PKGBUILD --noconfirm

echo "Installing pacaur..."
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg -i PKGBUILD --noconfirm

echo "Cleaning up..."
cd
rm -r ~/tmp

