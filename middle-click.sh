#!/bin/bash
# set XKB layout
setxkbmap -layout us
# turn on mousekeys
xkbset m
# stop mousekeys expiring after a timeout
xkbset exp =m
# map keysym to other keysym
xmodmap -e "keycode 108 = Pointer_Button2"
