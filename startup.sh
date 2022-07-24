#!/bin/bash
/home/steam/steamcmd/serverstart.sh &
term_handler(){
   echo "***Stopping"
   pkill --signal 2 --echo TheIsle
   wait
   exit $?
}
trap 'term_handler' SIGTERM
while true
do
   tail -f /dev/null & wait ${!}
done