#!/bin/bash
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    echo "Downloading The Isle Server"
        ./steamcmd.sh +force_install_dir /home/steam/theisle-dedicated/ +login anonymous +app_update 412680 -beta evrima +quit
        touch /home/steam/steamcmd/$CONTAINER_ALREADY_STARTED
else
    echo "Starting The Isle Server"
    /home/steam/theisle-dedicated/TheIsleServer.sh $additionalcommands -log
fi
exit
