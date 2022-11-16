#!/bin/bash

FILE="./personal/desktop-configs/1/.config/gtk-3.0/bookmarks"
[ -f "$FILE" ] || { echo "ERROR finding $FILE."; exit 1; }

PREFIX="file:///home/$USER/"
STRINGS=("Downloads" "Pictures")
for STRING in ${STRINGS[@]}; do
  if grep -qFx "${PREFIX}${STRING}" "$FILE";
  then
    echo "Already Created Bookmark";
  else
    echo "${PREFIX}${STRING}" >> $FILE
    echo "Created Boomark ${PREFIX}${STRING}";
  fi
done
