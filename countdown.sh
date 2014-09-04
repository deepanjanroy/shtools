#!/bin/bash

alarm_path="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"
now=$(date +%s)
[[ -n $1 ]] || { echo "Usage: countdown <number of seconds>"; exit 127
		}

end=$(( $now + $1 )) 
message=${@:2}
tasks=()

while true; do
	now=$(date +%s)
	if [[ $end < $now ]]; then
		notify-send "Times up!" "$message"
		echo -e "\nTimes up!"
		[[ -n ${tasks[0]} ]] && echo "You may want to tend to these now:"
		for i in ${!tasks[@]}; do
			printf "%d. %s\n" $(($i + 1)) "${tasks[$i]}" 
		done
		paplay $alarm_path
		exit 0
	fi
	echo "Press t to add a task!"
 	printf "\rTime remaining: %5d seconds " $(( $end - $now )) 
	read -n 1 -t 1 k
	if [[ $k == t ]]; then
		echo
		printf "Enter post-countdown task: "
		read task
		[[ -n task ]] && tasks+=($task)
	fi
done
