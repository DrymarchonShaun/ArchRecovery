#!/usr/bin/bash

BOOT_PARTITION=$(mount | grep /boot | awk -F" " '{ print $1 }') 
mkdir /boot/recovery/
curl https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso --output /boot/recovery/archlinux-x86_64.iso
mkdir /tmp/iso
mount /boot/recovery/archlinux-x86_64.iso /tmp/iso
cp -r /tmp/iso/arch/boot/x86_64/* /boot/recovery/
umount /tmp/iso
curl https://raw.githubusercontent.com/DrymarchonShaun/ArchRecovery/master/loader/entries/archrecovery.conf --output /boot/loader/entries/archrecovery.conf
sed -i "s#BOOT_PARTITION#$BOOT_PARTITION#g" /boot/loader/entries/archrecovery.conf
