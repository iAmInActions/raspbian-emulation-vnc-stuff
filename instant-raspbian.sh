#!/bin/bash
apt install git
git clone https://github.com/nachoparker/qemu-raspbian-network.git
cd qemu-raspbian-network
wget https://downloads.raspberrypi.org/raspbian_full/images/raspbian_full-2019-04-09/2019-04-08-raspbian-stretch-full.zip
unzip 2019-04-08-raspbian-stretch-full.zip
sudo ./qemu-pi.sh 2019-04-08-raspbian-stretch-full.img
