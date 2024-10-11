#!/bin/bash

# get the active workspace ID
workspace_id=$(hyprctl -j activeworkspace | jq -r '.id')

# default apps
case $workspace_id in
    1) code & disown ;;
    2) chromium & disown ;;
    3) alacritty & disown ;;
    4) obsidian --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland & disown ;;
    5) nautilus & disown ;;
    6) vesktop & disown ;;
    7) steam & disown ;;
    8) spotify-launcher & disown ;;
    9) google-chrome-stable & disown ;;
    *) ;;
esac
