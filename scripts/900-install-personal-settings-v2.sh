#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Erik Dubois
# Website : https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "Creating private folders we use later"

[ -d $HOME"/.bin" ] || mkdir -p $HOME"/.bin"
[ -d $HOME"/.backgrounds" ] || mkdir -p $HOME"/.backgrounds"
[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"
[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/.local/share/icons" ] || mkdir -p $HOME"/.local/share/icons"
[ -d $HOME"/.local/share/themes" ] || mkdir -p $HOME"/.local/share/themes"
# Purge folder before create in case of removed files
[ -d "/personal" ] && sudo rm -rf "/personal/*" || sudo mkdir -p "/personal"
[ -d "/personal/settings" ] || sudo mkdir -p "/personal/settings"
# Mount Folders
[ -d "/mnt" ] || sudo mkdir -p "/mnt"
[ -d "/mnt/hdd4tb" ] || sudo mkdir -p "/mnt/hdd4tb"
[ -d "/mnt/usb" ] || sudo mkdir -p "/mnt/usb"
[ -d "/mnt/phone" ] || sudo mkdir -p "/mnt/phone"

echo "Changing permissions for /mnt folders"
sudo chown "$USER" "/mnt/hdd4tb" "/mnt/usb" "/mnt/phone"
sudo chgrp users "/mnt/hdd4tb" "/mnt/usb" "/mnt/phone"


echo "Adding personal looks to /personal"
sudo cp -rf ../personal/desktop-configs/* /personal

echo "Adding settings to personal" # .[^.] is for hidden files
sudo cp -rf ../personal/settings/.[^.]* /personal/settings

echo "################################################################"
echo "#########            folders created            ################"
echo "################################################################"
