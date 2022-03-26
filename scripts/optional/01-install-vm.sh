#!/bin/bash

sudo pacman -Sy --needed virt-manager qemu qemu-arch-extra ovmf vde2 ebtables dnsmasq bridge-utils openbsd-netcat

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

usermod -a -G libvirt "$USER"
