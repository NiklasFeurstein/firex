#/bin/bash

savestring="$(xclip -o)"
outputfile="$HOME/.local/share/autotyper/autotyper.txt"

[[ ! -d "$(echo "$outputfile" | sed -E "s|[^\/]+$||g")" ]] && mkdir -p "$(echo "$outputfile" | sed -E "s|[^\/]+$||g")"
[[ ! -e "$outputfile" ]] && touch "$outputfile"

if (grep -q "^$savestring " "$outputfile"); then
    notify-send "Error" "String already saved"
else
    notify-send "Text saved" "$savestring was saved successfully"
    echo $savestring >> $outputfile
fi