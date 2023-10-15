#!/bin/bash

eDP=`xrandr | grep ' connected' | grep 'eDP' | awk '{print $1}'`
hdmi=`xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}'`



if [ "$hdmi" = "HDMI-A-0" ]; then
  xrandr --output $eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $hdmi --mode 1920x1080 --pos 1920x0 --rotate normal
else
  xrandr --output $eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $hdmi --off --output DP-1 --off &
fi