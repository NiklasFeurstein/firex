#!/bin/sh

###############################################################
#     Resyncs the subtitle files in the subs* subdirectory    #
#          according to the subtitles of a .mkv file          #
###############################################################

if [[ -z "$(pip list | grep -F ffsubsync)" ]]
then
    pip install ffsubsync==0.4.22
fi

# enable nullglob (in case of empty for loop)
shopt -s nullglob

for reference in *.mkv *.mp4; do
    shopt -u nullglob

    # expected structure e.g. ./subs*/filename.ja.(srt|ass)
    subtitleFileName="${reference/%.???/.ja.srt}"

    # get the subs directory
    readarray -d '' directoryName < <(find . -maxdepth 1 -type d -name "subs*" -print0)
    directoryName=${directoryName[0]}

    # assemble complete path
    subtitleFilePath=$directoryName/$subtitleFileName

    # check if srt is correct format otherwise change to ass
    if ! [[ -f $subtitleFilePath ]]
    then
        subtitleFileName="${subtitleFileName/.ja.srt/.ja.ass}"
        subtitleFilePath=$directoryName/$subtitleFileName
    elif ! [[ -f $subtitleFilePath ]]
    then
        echo "ERROR: No match for $subtitleFilePath" 1>&2
        continue
    fi

    # % delete the shortest match from end  |  # delete the shortest match from start
    retimed=${subtitleFilePath%.*.*}_retimed.${subtitleFileName#*.}

    ffsubsync "$reference" -i "$subtitleFilePath" -o "$retimed"

    shopt -s nullglob
done