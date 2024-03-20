#!/bin/bash
current_layout=$(hyprctl devices | grep "active keymap: Spanish" | awk '{print $3}' | awk '!seen[$0]++')

if [ "$current_layout" = "Spanish" ]; then
    echo "hyprctl keyword input:kb_layout us"
    hyprctl keyword input:kb_layout us
else
    echo "hyprctl keyword input:kb_layout es"
    hyprctl keyword input:kb_layout es
fi
