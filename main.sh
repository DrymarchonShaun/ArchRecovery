#!/usr/bin/fish
mkdir /recovery
mount $RECOVERY_PARTITION /recovery
curl https://geo.mirror.pkgbuild.com/iso/latest/archlinux-x86_64.iso --output /$RECOVERY_PARTITION/archlinux-x86_64.iso
mount /$RECOVERY_PARTITION/archlinux-x86_64.iso /tmp/iso
cp -r /tmp/iso/arch/boot/x86_64/* /recovery/
umount /tmp/iso
git clone https://github.com/DrymarchonShaun/ArchRecovery /tmp/ArchRecovery/
cp /tmp/ArchRecovery/recovery/loader/``