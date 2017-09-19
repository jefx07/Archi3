## Pre-installation

#### Connect to the internet

The installation image enables the dhcpcd daemon on boot for wired network devices. The connection may be checked with:

```
# ping archlinux.org
```

If no connection is available, stop the *dhcpcd* service with `systemctl stop dhcpcd@`, `Tab`

For wireless connections, iw, wpa_supplicant and netctl are available.

```
# wifi-menu
```

#### Partition the disks

To identify devices, use *lsblk* or *fdisk*

```
# fdisk -l
```

#### Format the partions

```
# mkfs.ext4 /dev/sda1
# mkswap /dev/sda2
```

#### Mount the file systems

Mount the file system on the root partion to `/mnt`, for example

```
# mount /dev/sda1 /mnt
# swapon /dev/sda2
```


## Installation

#### Select the mirrors

Packages to be installed must be downloaded from mirror servers, which are defined in `/etc/pacman.d/mirrorlist`.

This file will later be copied to the new system by pacstrap, so it is worth getting right.

#### Install the base packages

Use the *pacstrap* script to install the `base` package group:

```
# pacstrap /mnt base base-devel
```

## Configure the system

#### Fstab

Generate an fstab file (use `-U` or `-L` to define by UUID or labels, respectively):

```
# genfstab -U /mnt >> /mnt/etc/fstab
```

Check the resulting file in `/mnt/etc/fstab` afterwards, and edit it in case of errors.

#### Chroot

```
# arch-chroot /mnt /bin/bash
```

#### Time zone

Set the [time zone](https://wiki.archlinux.org/index.php/Time_zone):

```
# rm /etc/localtime
```

```
# ln -s /usr/share/zoneinfo/Pacific/Auckland /etc/localtime
```

Run hwclock to generate `/etc/adjtime`:

```
# hwclock --systohc --utc
```

#### Locale

Uncomment en_US.UTF-8 and other needed localizations in `/etc/locale.gen`,

```
# nano /etc/locale.gen
```

and generate them with:

```
# locale-gen
```

Set the `LANG` variable in `locale.conf` accordingly, for example:

```
# echo LANG=en_NZ.UTF-8 > /etc/locale.conf
```

```
# export LANG=en_NZ.UTF-8
```

#### Hostname

Choose a name for your computer

```
# echo dell-pc > /etc/hostname
```

Consider adding a matching entry to `hosts`:

```
# nano /etc/hosts
```

```
127.0.0.1	localhost.localdomain	localhost
::1		localhost.localdomain	localhost
127.0.1.1	myhostname.localdomain	dell-pc
```

#### Network configuration

The newly installed environment has no network connection activated by default.

For Wireless configuration, install the `iw` and `wpa_supplicant` packages. Optionally install `dialog` for usage of *wifi-menu*.

```
# pacman -S iw wpa_supplicant dialog
```

#### Initramfs

Creating a new *initramfs* is usually not required, because mkinitcpio was run on installation of the `linux` package with *pacstrap*.
For special configurations, modify the `mkinitcpio.conf` file and recreate the initramfs image:

```
# mkinitcpio -p linux
```

#### Root password

Set the root password:

```
# passwd
```

#### Boot loader

If you have an Intel CPU, install the intel-ucode package in addition, and enable microcode updates.

```
# pacman -S intel-ucode
```

Install grub:

```
# pacman -S grub os-prober
```

then do:

```
# grub-install --target=i386-pc --recheck /dev/sdx
```
where /dev/sdx is the partitioned disk where grub is to be installed.

```
# grub-mkconfig -o /boot/grub/grub.cfg
```


## Reboot

Exit the chroot environment by typing `exit`.

Optionally manually unmount all the partitions with `umount -R /mnt`: this allows noticing any "busy" partitions

Finally, restart the machine by typing `reboot`: any partitions still mounted will be automatically unmounted by *systemd*. Remember to remove the installation media and then login into the new system with the root account.


## Create user account

Login with root

Add user:

```
# useradd -m -g users -G wheel,storage,power -s /bin/bash jeff
```

```
# passwd jeff
```

```
# EDITOR=nano visudo
```

Look for these lines with an hashtag in front

*%wheel ALL=(ALL) ALL*

```
# exit
```


## Install desktop environment

Login with new user account

Check if the system has any updates

```
$ sudo pacman -Syu
```

Installing bash-completion is helpful:

```
$ sudo pacman -S bash-completion
```

Install Xserver (and Intel driver):

```
sudo pacman -S xorg-server xorg-xinit xorg-twm xterm
sudo pacman -S xf86-video-intel
```

Install sound software:

```
sudo pacman -S pulseaudio pulseaudio-alsa
sudo pacman -S alsa-utils alsa-plugins alsa-lib
```

Install NetworkManager and enable it:

```
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager.service
```

We will download the script for an easy and quick installation.

```
$ sudo pacman -S git
$ git clone https://github.com/jefx07/archi3
$ cd archi3
```

