#!/bin/bash
if [ ! -e "/home/steam/CONTAINER_ALREADY_STARTED_PLACEHOLDER" ]; then
    echo "***Downloading The Isle Server"
	/home/steam/steamcmd/steamcmd.sh +force_install_dir "/home/steam/Steam/steamapps/common/The Isle Dedicated Server" +login anonymous +app_update 412680 -beta $steambranch +quit
    if [ "$updateonstart" = false ]; then
    	touch "/home/steam/CONTAINER_ALREADY_STARTED_PLACEHOLDER"
     fi
fi

echo "***Starting The Isle Server"
"/home/steam/Steam/steamapps/common/The Isle Dedicated Server/TheIsleServer.sh" $additionalcommands -log -LOCALLOGTIMES -ini:Engine:[EpicOnlineServices]:DedicatedServerClientId=xyza7891gk5PRo3J7G9puCJGFJjmEguW -ini:Engine:[EpicOnlineServices]:DedicatedServerClientSecret=pKWl6t5i9NJK8gTpVlAxzENZ65P8hYzodV8Dqe5Rlc8 &

term_handler(){
	echo "***Stopping"
	pkill --signal 2 --echo TheIsle
	while pgrep TheIsle; do
		sleep 2
	done
	exit 0
}
trap 'term_handler' SIGTERM
	while true
do
	tail -f /dev/null & wait ${!}
done
exit