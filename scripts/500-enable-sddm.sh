#!/bin/bash
sudo systemctl enable sddm.service

# enable numlock
[[ -d "/etc/sddm.conf.d/" ]] || sudo mkdir /etc/sddm.conf.d/
configText=$'[General]\nNumlock=on'
echo "$configText" | sudo tee "/etc/sddm.conf.d/numlock.conf" > /dev/null
