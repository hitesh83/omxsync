#!/bin/sh
while
 inotifywait -e create -e delete "/home/pi/media/"
do
 sudo jq -r '.assets[].filename' /home/pi/media/__Playlist.json > /home/pi/playlist.txt
 pkill python3
 pkill pm.sh
 pkill omxplayer-sync
done
