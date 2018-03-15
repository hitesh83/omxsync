#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'
BLU='\033[1;34m'
printf "${RED}INSTALLING SLAVE PLAYER\n${NC}"
printf "${RED}Setting time to IST\n${NC}"
sudo timedatectl set-timezone 'Asia/Kolkata'
printf "${RED}Entering omxsync install folder\n${NC}"
cd /home/pi/omxsync
printf "${RED}Removing old OMX-Player\n${NC}"
sudo apt-get remove omxplayer -y
printf "${RED}Removing all directories and files related to OLD OMX-Player\n${NC}"
sudo rm -rf /usr/bin/omxplayer /usr/bin/omxplayer.bin /usr/lib/omxplayer
printf "${RED}Installing updated OMX - Player GitHub Version\n${NC}"
sudo dpkg -i omxplayer_0.3.7~git20170130~62fb580_armhf.deb
printf "${RED}Installing Py3 aalib supportings\n${NC}"
sudo dpkg -i python3-aalib_0.3-1_all.deb
printf "${RED}Installing py3-dbus tools\n${NC}"
sudo dpkg -i python3-dbus_1.2.0-2+b3_armhf.deb
sudo apt install python3-dbus
printf "${RED}Copying omxplayer-sync to System folder\n${NC}"
sudo cp omxplayer-sync /usr/bin/omxplayer-sync
printf "${RED}Giving run permissions to omxplayer-sync\n${NC}"
sudo chmod 0755 /usr/bin/omxplayer-sync
printf "${RED}Copying play.sh script to pi home\n${NC}"
sudo cp play.txt /home/pi/play.sh
printf "${RED}Giving run permission to play.sh script\n${NC}"
sudo chmod +x /home/pi/play.sh
printf "${RED}Removing all old crontab values\n${NC}"
sudo crontab -r
( sudo crontab -l ; echo "@reboot /home/pi/play.sh" ) | sudo crontab -
printf "${RED}Modifing boot screen\n${NC}"
sudo cp cmdline.txt /boot/cmdline.txt
printf "${RED}Rebooting system in 10sec\n${NC}"
n=${1:-10}

while [ $n -gt 0 ]; do
  printf "${BLU} \r%s " $n
  sleep 1
  n=$((n-1))
done
printf "\r \r" 
printf "${RED}Rebooting Now\n${NC}"
sudo reboot
