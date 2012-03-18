#!/bin/bash

# check vbios dump is there
if [ ! -f vbios.bin ]
then
    echo "vbios.bin is missing, read the guide first and don't forget to check PDISPLAY_VGA_ROM_WINDOW"
    exit
fi

# make sure the dedicated card is on
echo ON > /sys/kernel/debug/vgaswitcheroo/switch

# assumes nouveau is loaded
rmmod nouveau
modprobe nvidia-current

bumblebeed --driver nvidia --debug

rmmod nvidia

./fix_vbios.sh

modprobe nouveau

