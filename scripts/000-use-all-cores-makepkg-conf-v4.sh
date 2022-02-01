#!/bin/bash
sudo pacman -S --needed base-devel > /dev/null 2>&1
echo "You have $(nproc) cores."
echo "Changing the makeflags for $(nproc) cores."
sudo sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$(nproc)"/g' /etc/makepkg.conf
echo "Changing the compression settings for $(nproc) cores."
sudo sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z --threads=0 -)/g' /etc/makepkg.conf
