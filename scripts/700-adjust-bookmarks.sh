#!/bin/bash

FILE="./personal/desktop-configs/1/.config/gtk-3.0/bookmarks"
[ -f "$FILE" ] || { echo "ERROR finding $FILE."; exit 1; }
STRING="file:///home/$USER/Downloads"
if grep -q -F -x "$STRING" "$FILE";
then
  echo "Already Created Bookmark";
else
  echo "$STRING" >> $FILE
  echo "Created Boomark $STRING";
fi
