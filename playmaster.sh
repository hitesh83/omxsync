#!/bin/sh
while true;
do
 pgrep -f pm.sh || nohup /home/pi/pm.sh  >> playmaster.out
done &
