#!/bin/bash
# Insert dialog stuff here.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Release selection"
TITLE="Rasbian QEMU VNC"
MENU="Choose Raspbian Image: (Small option does NOT have a GUI.)"

OPTIONS=(1 "Small"
         2 "Medium"
         3 "Full")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "Donwloading and runing small image (CLI only)"
            wget https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip
            unzip 2019-04-08-raspbian-stretch-lite.zip
            sudo ./qemu-pi.sh 2019-04-08-raspbian-stretch-lite.zip
            ;;
        2)
            echo "Donwloading and runing medium image (Desktop + System Tools)"
            wget https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05/2017-07-05-raspbian-jessie.zip
            unzip 2017-07-05-raspbian-jessie.zip
            sudo ./qemu-pi.sh 2017-07-05-raspbian-jessie.img
            ;;
        3)
            echo "Donwloading and runing large image (Desktop + Many Apps)"
            wget https://downloads.raspberrypi.org/raspbian_full/images/raspbian_full-2018-11-15/2018-11-13-raspbian-stretch-full.zip
            unzip 2018-11-13-raspbian-stretch-full.zip
            sudo ./qemu-pi.sh 2018-11-13-raspbian-stretch-full.img
            ;;
esac
