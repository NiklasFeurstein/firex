#!/bin/sh

################################################################
#  Extracts the Japanese audio from a .mkv or .mp4 video file  #
#   Options: -s for segmentation and -l to specify length      #
################################################################

# Initialize vars
segments=false
segmentLength=180

# Check flags
while getopts "sl:" option
do
    case "${option}" in
        s)
            segments=true
        ;;
        l)
            segmentLength=${OPTARG}
            segments=true
        ;;
    esac
done


# create the vars to be inserted in the command
prependCMD=""
appendCMD=""
if [ "$segments" = true ]
then
    prependCMD="-f segment -segment_time ${segmentLength} "
    appendCMD="%03d"
fi

# Create directory and create counter var
mkdir "extractedAudio"
audioFilesExtracted=0

# enable nullglob (in case of empty for loop)
shopt -s nullglob

for i in *.mkv *.mp4
do
    ffmpeg -i "${i}" -map 0:a:m:language:jpn -acodec copy -f matroska pipe: | ffmpeg -i pipe: -map 0:0 ${prependCMD}-c:a libmp3lame "extractedAudio/${i%.*}${appendCMD}.mp3"
    audioFilesExtracted=$((++audioFilesExtracted))
done

# reset glob
shopt -s nullglob

# Error handling and output
if [ "$audioFilesExtracted" -eq 0 ]
then
    echo "ERROR: Couldn't find a .mkv or .mp4 file!" 1>&2
    rmdir "extractedAudio"
    exit 128
else
    echo "Extracted audio of ${audioFilesExtracted} files"
fi