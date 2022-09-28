#!/bin/bash
echo "Installing/Updating mpvacious now"

git clone 'https://github.com/Ajatt-Tools/mpvacious.git' ~/.config/mpv/scripts/subs2srs > /dev/null 2>> log.txt
cd ~/.config/mpv/scripts/subs2srs 2>> "$(pwd)/log.txt" && git pull > /dev/null 2>> "$(pwd)/log.txt"