#!/bin/bash

# TODO: check nouveau refcount == 0 (proc/modules?)
# TODO: automatically find right vtcon

echo 0 > /sys/class/vtconsole/vtcon1/bind && \
rmmod nouveau && \
modprobe nvidia_current && \
start lightdm
