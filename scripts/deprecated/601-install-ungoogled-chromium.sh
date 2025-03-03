#!/bin/bash
echo "Installing ungoogled chromium now"

pacconf=/etc/pacman.conf

curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a - > /dev/null 2>&1

if grep -Fxq '[home_ungoogled_chromium_Arch]' "$pacconf"; then
  echo "Ungoogled chromium is already installed."
  exit 0;
fi

echo '
[home_ungoogled_chromium_Arch]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append "$pacconf" > /dev/null
sudo pacman --noconfirm --needed -Sy ungoogled-chromium > /dev/null 2>> log.txt
