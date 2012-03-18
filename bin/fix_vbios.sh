#!/bin/bash

# check vbios dump is there
if [ ! -f vbios.bin ]
then
    echo "vbios.bin is missing, read the guide first and don't forget to check PDISPLAY_VGA_ROM_WINDOW"
    exit
fi

# TODO: check value first before restoring it
echo "restoring VBIOS, old value:"
nvapeek 614f04
nvapoke 614f04 0xffe09
echo "new value:"
nvapeek 614f04
nvafakebios vbios.bin
