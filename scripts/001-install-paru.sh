#!/bin/bash
	if pacman -Qi paru &> /dev/null; then echo "Paru already installed"; exit 0; fi
	echo "Installing Paru"
	git clone https://aur.archlinux.org/paru.git ./temp
	cd temp
	makepkg -sic --noconfirm
	cd ..
	rm -rf ./temp
