#!/usr/bin/env bash

KEEP_ALIVE=${KEEP_ALIVE:-"0"}

if [ -n "$BRIDGE" ] && [ -n "$DESTINATION_IP" ]; then
	rc=$(ip route show | grep -w $DESTINATION_IP ; echo $?)
	if [ "$rc" -ne "0" ]; then
    	ip route add ${DESTINATION_IP}/32 dev ${BRIDGE} 2>/dev/null || true
    	echo `date` $ME - "Added route to ${DESTINATION_IP} by ${BRIDGE} ..."
    else 
    	echo `date` $ME - "Route already exist $(ip route show | grep -w $DESTINATION_IP)"
    fi
else
	echo `date` $ME - "ERROR: You need to define DESTINATION_IP by BRIDGE env variables...."
fi

if [ "x$KEEP_ALIVE" == "x1" ]; then
	trap "exit 0" SIGINT SIGTERM
	while :
	do
		echo `date` $ME - "I'm alive"
		sleep 600
	done
fi

exit 0
