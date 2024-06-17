#!/bin/bash

layout=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $layout in
"master")
  hyprctl keyword general:layout dwindle
  # notify-send "Dwindle"
  ;;
"dwindle")
  hyprctl keyword general:layout master
  # notify-send "Master"
  ;;
*) ;;

esac