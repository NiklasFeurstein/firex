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

[ -d "/personal" ] || mkdir -p "/personal"

echo "Adding personal looks to /personal"
sudo cp -rf ../Personal-Settings/* /personal

echo "################################################################"
echo "#########            folders created            ################"
echo "################################################################"
