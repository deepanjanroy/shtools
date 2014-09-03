#!/bin/bash

bright=t

while true; do
	if [[ $bright == t ]]; then
		bright=f
		xbacklight -steps 1 -set 0
	else
		bright=t
		xbacklight -steps 1 -set 100
	fi
	sleep 0.05
done
