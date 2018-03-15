# installmaster.
1-	This script will install omxplyer-sync as master along with omxplayer.deb and sync.
2-	copy script will watch media folder for any changes, if changes are there, 
3-	JQ will pharse __Playlist.json and save all video file names to /home/pi/playlist.txt 
4-	All files will be taken from /home/pi/playlist.txt
5-	each file played will be logged in /home/pi/playlogs.txt
6-	setup script added

Mp4 files are pushed from server to all players using Pisignage https://github.com/colloqi/pisignage-server
Playlist is used from pisignage-server

It also uses edited version of omxplayer-sync - https://github.com/hitesh83/omxplayer-sync

