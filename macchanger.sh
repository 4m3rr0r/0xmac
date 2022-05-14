#!/bin/bash
macchanger -l > list.txt
ouimac=$(shuf -n 1 list.txt | awk '{print$3}')
uaamac=$(printf '%02x:%02x:%02x'  $[RAMDOM%256] $[RAMDOM%256] $[RAMDOM%256])
sudo ifconfig eth0 down
macchanger -m  "$ouimac:$uaamac" eth0 
sudo ifconfig eth0 up
