#!/bin/sh

###############################################################
#     Resyncs the subtitle files in the subs* subdirectory    #
#          according to the subtitles of a .mkv file          #
###############################################################

if [[ -z "$(pip list | grep -F ffsubsync)" ]]
then
    pip install ffsubsync==0.4.22
fi

for reference in *.mkv; do
    # globbing and replace to get file name
    # expected structure e.g. ./subs.jp/filename.ja.srt
    to_retime=./subs*/$(basename "${reference/.mkv/.ja.srt}")

    # convert to array to extract the matched directory
    fileAsArray=( $to_retime ) 
    globbedFileName=${fileAsArray[0]}

    if ! [[ -f $globbedFileName ]]
    then
        echo "ERROR: No match for $to_retime" 1>&2
        continue
    fi

    # % delete the shortest match from end  |  # delete the shortest match from start
    basenameOfFile=$(basename $to_retime)
    retimed=${globbedFileName%.*.*}_retimed.${basenameOfFile#*.}

    # sync subs. $to_retime without " for filename expansion
    ffsubsync "$reference" -i $to_retime -o "$retimed"
done