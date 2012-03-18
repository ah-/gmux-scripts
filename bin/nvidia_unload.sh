#!/bin/bash

# TODO: check nvidia refcount == 0 (proc/modules?)

while pgrep X; do
    echo "waiting for X to stop"
    sleep 1
done

rmmod nvidia && \
modprobe nouveau

