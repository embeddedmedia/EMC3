#! /bin/bash
rm ./boot/*
rm ./firmware/*
rm ./petalinux/*
rm ./software/baremetal/*
rm ./software/baremetal_classic/*
rm ./software/linux/*
mkdir -p ./boot
mkdir -p ./firmware
mkdir -p ./petalinux
mkdir -p ./software/baremetal
mkdir -p ./software/baremetal_classic
mkdir -p ./software/linux
cp ../boot/BOOT.bin ./boot
cp ../firmware/*.runs/impl_1/*.bit ./firmware
cp ../firmware/*.xsa ./firmware
cp ../petalinux/images/linux/*.elf ./petalinux
cp ../petalinux/images/linux/boot.scr ./petalinux
cp ../petalinux/images/linux/*.bit ./petalinux
cp ../petalinux/images/linux/system.dtb ./petalinux
cp ../petalinux/images/linux/image.ub ./petalinux
cp ../petalinux/images/linux/Image ./petalinux
cp ../petalinux/images/linux/rootfs.cpio.gz.u-boot ./petalinux
find ../software/baremetal -type f | grep -i ".*.elf$"  | xargs -I '{}' cp '{}' ./software/baremetal
find ../software/baremetal_classic -type f | grep -i ".*.elf$"  | xargs -I '{}' cp '{}' ./software/baremetal_classic
find ../software/linux -type f -executable  | xargs -I '{}' cp '{}' ./software/linux/
