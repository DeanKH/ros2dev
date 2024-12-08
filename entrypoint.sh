#!/bin/bash
echo "entry point loading..."

if [ ! -d /home/$USER ]; then
    echo "create directory /home/$USER"
    mkdir /home/$USER
fi 

source /ros_entrypoint.sh

sleep infinity &
wait