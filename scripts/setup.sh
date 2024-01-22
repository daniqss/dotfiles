#!/bin/bash

eDP=`xrandr | grep ' connected' | grep 'eDP' | awk '{print $1}'`
hdmi=`xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}'`

if [ "$hdmi" = "HDMI-A-0" ]; then
  	xrandr --output $hdmi --primary --mode 1920x1080 --pos 0x0 --rotate normal &
	setxkbmap -layout us &
else
  	xrandr --output $eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal &
	setxkbmap -layout es &
fi

feh --bg-scale ~/Wallpapers/RoW01.jpg & disown