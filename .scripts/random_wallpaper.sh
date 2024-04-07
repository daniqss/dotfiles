#!/bin/bash

wallpaper_dir="/home/ranicocs/.wallpapers"

monitor=($(hyprctl monitors | grep Monitor | awk '{print $2}'))
cache=""

while true; do
  wallpaper=$(find $wallpaper_dir -type f -name '*' | shuf -n 1)
  
  if [[ "$cache" != "$wallpaper" ]]; then
    cache="$wallpaper"
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$wallpaper"
    for m in "${monitor[@]}"; do
      hyprctl hyprpaper wallpaper "$m,$wallpaper"
    done
  fi
  
  sleep 900
done
