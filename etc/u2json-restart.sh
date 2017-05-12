#!/bin/bash

PID=$(pgrep idstools-u2json)
if [ -n "$PID" ]; then 
	kill $PID
fi
su - snort -c "idstools-u2json @/etc/snort/u2json.conf &" 
