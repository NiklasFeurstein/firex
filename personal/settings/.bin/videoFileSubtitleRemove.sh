#!/bin/sh

###############################################################
#  Removes all embedded subtitles in all .mp4 and .mkv files  #
#                  in the current directory                   #
###############################################################

# create temp dir for storage of the newly created files and counter var
mkdir temp
videoFilesSubtitleRemoved=0

# enable nullglob (in case of empty for loop)
shopt -s nullglob

for videoFile in *.mkv *.mp4
do
    # Create the video without subs and save in temp dir
    ffmpeg -i "${videoFile}" -map 0 -vcodec copy -acodec copy -sn -y "temp/${videoFile}"

    # Delete the source video and increment counter
    rm "${videoFile}"
    videoFilesSubtitleRemoved=$((++videoFilesSubtitleRemoved))
done

# reset glob
shopt -u nullglob

# Move all new video files to current folder
mv temp/*.mkv temp/*.mp4 . > /dev/null 2>&1

# Clear temp dir
rmdir temp

# Error handling and output
if [ "$videoFilesSubtitleRemoved" -eq 0 ]
then
    echo "ERROR: Couldn't find a .mkv or .mp4 file!" 1>&2
    exit 128
else
    echo "Successfully removed subtitles from ${videoFilesSubtitleRemoved} video files."
fi
