#!/bin/bash
echo "Installing ffsubsync now"

sudo pacman -S --needed ffmpeg > /dev/null 2>> log.txt
pip3 install --upgrade ffsubsync > /dev/null 2>> log.txt
