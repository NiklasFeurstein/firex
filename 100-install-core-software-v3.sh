#!/bin/bash
#set -e
##################################################################################################################
# Author : Erik Dubois
# Website: https://www.erikdubois.be
# Website: https://www.arcolinux.info
# Website: https://www.arcolinux.com
# Website: https://www.arcolinuxd.com
# Website: https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

#software from Arch Linux repositories

sudo pacman -S --noconfirm --needed discord
sudo pacman -S --noconfirm --needed spotify
sudo pacman -S --noconfirm --needed telegram-desktop

sudo pacman -S --noconfirm --needed brave
sudo pacman -S --noconfirm --needed vlc

sudo pacman -S --noconfirm --needed sublime-text-4

sudo pacman -S --noconfirm --needed meld

sudo pacman -S --noconfirm --needed gitahead-bin

sudo pacman -S --noconfirm --needed the_platinum_searcher-bin

sudo pacman -S --noconfirm --needed wps-office
sudo pacman -S --noconfirm --needed ttf-wps-fonts
sudo pacman -S --noconfirm --needed wps-office-mime

sudo pacman -S --noconfirm --needed arcolinux-candy-beauty-git
sudo pacman -S --noconfirm --needed ayu-theme
sudo pacman -S --noconfirm --needed arc-darkest-theme-git

###############################################################################################

echo "################################################################"
echo "################### core software installed"
echo "################################################################"