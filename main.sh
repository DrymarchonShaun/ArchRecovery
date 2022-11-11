#!/usr/bin/fish

set BOOT_PARTITION (mount | grep /boot | awk -F" " '{ print $1 }') 
curl https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso --output /$BOOT_PARTITION/recovery/archlinux-x86_64.iso
mount /$BOOT_PARTITION/recovery/archlinux-x86_64.iso /tmp/iso
cp -r /tmp/iso/arch/boot/x86_64/* /boot/recovery/
umount /tmp/iso
curl https://raw.githubusercontent.com/DrymarchonShaun/ArchRecovery/master/recovery/loader/entries/archrecovery.conf > sed s/BOOT_PARTITION/($BOOT_PARTITION)/g | touch /boot/loader/entries/archrecovery.conf