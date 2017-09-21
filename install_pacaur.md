## Installing pacaur (and cower)

First, install the necessary dependencies.

```
sudo pacman -S expac yajl --noconfirm
```

Next, create a temporary working directory for building packages as **normal user**

```
mkdir ~/tmp
```
Go to that directory and download and install Cower as shown below.

```
cd ~/tmp/
```

```
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
```

```
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
```

```
makepkg -i PKGBUILD --noconfirm
```

Then, download and install Pacaur package.

```
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
```

```
makepkg -i PKGBUILD --noconfirm
```

Finally, cleanup the temporary working directory:

```
cd
rm -r ~/tmp
```

