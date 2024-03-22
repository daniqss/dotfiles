#!/bin/bash

current_window=$(hyprctl activewindow -j | jq -r '.address')
hyprctl dispatch movetoworkspacesilent special:magic,address:"$current_window"