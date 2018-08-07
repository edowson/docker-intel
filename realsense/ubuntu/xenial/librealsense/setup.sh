#!/bin/sh

# setup keys for intel's repository server
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
sudo bash -c 'echo "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo $(lsb_release -cs) main" > /etc/apt/sources.list.d/realsense-public.list'
sudo apt-get update

# install linux-kernel-headers on host
sudo apt-get install linux-headers-$(uname -r)

# install librealsense2
sudo apt-get install librealsense2
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils
sudo apt-get install realsense-uvcvideo

# add current user to video group
sudo usermod -a -G video $USER
getent group video
