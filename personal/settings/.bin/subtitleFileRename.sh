#!/bin/sh

###############################################################
# Renames the subtitle files in this or a direct subdirectory #
#      starting with "sub" to the name of the video file      #
###############################################################

shopt -s nullglob dotglob
foundVideoFiles=({*.mp4,*.mkv})
numberOfVideoFiles=${#foundVideoFiles[@]}

if [[ numberOfVideoFiles -eq 0 ]]
then
    echo "ERROR: No video files found!" 1>&2
    exit 128
fi

foundSubtitleFiles=({*.ass,*.srt,sub**/*.ass,sub**/*.srt})    # Same directory and direct subdirectory starting with "sub"
numberOfSubtitleFiles=${#foundSubtitleFiles[@]}
if [[ numberOfSubtitleFiles -eq 0 ]]
then
    echo "ERROR: No subtitle files found!" 1>&2
    exit 129
fi

if [[ numberOfVideoFiles -ne numberOfSubtitleFiles ]]
then

    echo $"----Number of video files (${numberOfVideoFiles}) and subtitle files (${numberOfSubtitleFiles}) differ!----"
    read -rep $'--------Continue regardless? [Yy]--------\n' -n 1
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "ERROR: Number of video and subtitle files differ!" 1>&2
        exit 130
    fi
fi

if [[ numberOfVideoFiles -ge numberOfSubtitleFiles ]]
then
    minOfVideosAndSubtitles=$numberOfSubtitleFiles
else
    minOfVideosAndSubtitles=$numberOfVideoFiles
fi

for counter in $(seq 0 $[minOfVideosAndSubtitles-1])
do
    fullNameOfVideo="$(basename "${foundVideoFiles[$counter]}")"
    fileNameOfVideo="${fullNameOfVideo%.*}"
    
    directoryOfSubs="$(dirname "${foundSubtitleFiles[$counter]}")"
    fullNameOfSubtitle="$(basename "${foundSubtitleFiles[$counter]}")"
    subtitleFileExtension="${fullNameOfSubtitle##*.}"

    newNameOfSubtitle="${directoryOfSubs}/${fileNameOfVideo}.ja.${subtitleFileExtension}"

    mv "${foundSubtitleFiles[$counter]}" "${newNameOfSubtitle}"
done

echo "Successfully renamed ${minOfVideosAndSubtitles} subtitle files."
