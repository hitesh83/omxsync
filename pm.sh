#!/bin/bash
cd /home/pi/media/
PLAYER="omxplayer-sync"
PLAYLIST="/home/pi/playlist.txt"
AREA="HWH3"

# Play the playlist if it exists
if [ -e "$PLAYLIST" ]
then
    IFS=$'\012'
    for file in $(cat "$PLAYLIST")
    do
        sudo echo "$AREA" , `date '+%d/%m/%Y %H:%M:%S'` , "$file" >> /home/pi/playlogs.txt
        $PLAYER "-mv" "/home/pi/media/$file"
    done
fi
