#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'
BLU='\033[1;34m'

printf "${RED}Setting time to IST\n${NC}"
sudo timedatectl set-timezone 'Asia/Kolkata'
printf "${RED}Entering installmaster folder\n${NC}"
cd /home/pi/installmaster
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
printf "${RED}Installing JQ tools for json phaser\n${NC}"
sudo dpkg -i jq_1.4-2.1+deb8u1_armhf.deb
printf "${RED}Installing inotify tools\n${NC}"
sudo dpkg -i inotify-tools_3.14-1+b1_armhf.deb
printf "${RED}Installing inotify supportings\n${NC}"
sudo dpkg -i libinotifytools0_3.14-1+b1_armhf.deb
sudo apt install python3-dbus inotify-tools -y
printf "${RED}Copying omxplayer-sync to bin folder\n${NC}"
sudo cp omxplayer-sync /usr/bin/omxplayer-sync
printf "${RED}Giving run permissions to omxplayer-sync\n${NC}"
sudo chmod 0755 /usr/bin/omxplayer-sync
printf "${RED}Copying copy script to pi home\n${NC}"
sudo cp copy.sh /home/pi/copy.sh
printf "${RED}Copying pm.sh script to pi home\n${NC}"
sudo cp pm.sh /home/pi/pm.sh
printf "${RED}Copying copylogs.sh script to pi home\n${NC}"
sudo cp copylogs.sh /home/pi/copylogs.sh
printf "${RED}Copying Playmaster.sh script to pi home\n${NC}"
sudo cp playmaster.sh /home/pi/playmaster.sh
printf "${RED}Gving run permission to copy.sh pm.sh, copylogs.sh, playmaster.sh\n${NC}"
sudo chmod +x /home/pi/copy.sh
sudo chmod +x /home/pi/pm.sh
sudo chmod +x /home/pi/copylogs.sh
sudo chmod +x /home/pi/playmaster.sh
printf "${RED}Deleting crontab of root\n${NC}"
sudo crontab -r
printf "${RED}Adding fresh entries to crontab of root\n${NC}"
( sudo crontab -l ; echo "* 4 * * *  /home/pi/copylogs.sh" ) | sudo crontab -
( sudo crontab -l ; echo "@reboot /home/pi/copylogs.sh" ) | sudo crontab -
( sudo crontab -l ; echo "@reboot /home/pi/copy.sh" ) | sudo crontab -
( sudo crontab -l ; echo "@reboot /home/pi/playmaster.sh" ) | sudo crontab -
printf "${RED}Crontab Entry for Root Done\n${NC}"
printf "${RED}Making directory for logs saving\n${NC}"
mkdir /home/pi/ADSPL_Logs
printf "${RED}Modifing cmdline file for no logo\n${NC}"
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
