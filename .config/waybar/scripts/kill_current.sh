#!/bin/bash

current_window=hyprctl activewindow -j | jq -r '.address'
hyprctl killwindow $current_window
 
