#!/bin/bash

# get the active workspace ID
workspace_id=$(hyprctl -j activeworkspace | jq -r '.id')

# default apps
case $workspace_id in
    1) code & disown ;;
    2) firefox & disown ;;
    3) alacritty & disown ;;
    4) obsidian & disown ;;
    5) thunar & disown ;;
    6) ~/.config/scripts/wofi.sh & disown ;;
    7) steam & disown ;;
    8) spotify-launcher & disown ;;
    9) google-chrome-stable & disown ;;
    *) ;;
esac
