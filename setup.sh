#!/bin/bash

#PiStream Installer

#Updating sources for FFMPEG and H264 support
echo "deb http://www.deb-multimedia.org squeeze main non-free" >> /etc/apt/sources.

sudo apt-get update
sudo apt-get install deb-multimedia-keyring
sudo apt-get update


#prereq's
sudo echo "Getting the essentials! \n"

sudo apt-get install python-dev python-pip nodejs npm youtube-dl ffmpeg x264 git build-essential --assume-yes

sudo pip install streamlink

sudo npm install forever -g
sudo npm install forever-monitor -g

cd ~
mkdir S2Pi
cd S2Pi

wget https://raw.githubusercontent.com/AR-Calder/S2Pi/master/S2Pi.js


cd ~/etc/init.d/

wget https://raw.githubusercontent.com/AR-Calder/S2Pi/master/S2PiServer

sudo chown root:root S2PiServer
chmod +x ~/etc/init.d/S2PiServer
sudo update-rc.d S2PiServer defaults

echo "starting S2Pi server..."
~/etc/init.d/S2PiServer start
	
