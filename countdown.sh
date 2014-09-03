#!/bin/bash

alarm_path="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"
now=$(date +%s)
[[ -n $1 ]] || { echo "Usage: countdown <number of seconds>"; exit 127
		}

end=$(( $now + $1 )) 
message=${@:2}

while true; do
	now=$(date +%s)
	if [[ $end < $now ]]; then
		notify-send "Times up!" "$message"
		echo -e "\nTimes up!"
		paplay $alarm_path
		exit 0
	fi
	printf "\rTime remaining: %5d seconds " $(( $end - $now )) 
	sleep 1
	
done
