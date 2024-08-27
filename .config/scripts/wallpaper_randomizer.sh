#!/bin/bash

# Path to the directory containing wallpapers
WALLPAPER_DIR="$HOME/dotfiles/.config/wallpapers"

# Make sure the directory exists
if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "ERROR: Directory $WALLPAPER_DIR does not exist!"
    exit 1
fi

# Make sure only one instance of this script runs at a time
PIDFILE=~/.local/state/swww-randomize-pidfile.txt
if [ -e "${PIDFILE}" ]; then
    OLD_PID="$(<${PIDFILE})"
    if [ "X" != "X${OLD_PID}" ] && [ -e "/proc/${OLD_PID}" ]; then
        OLD_NAME="$(</proc/${OLD_PID}/comm)"
        THIS_NAME="$(</proc/${BASHPID}/comm)"
        if [ "${OLD_NAME}" = "${THIS_NAME}" ]; then
            echo "Old randomize process ${OLD_PID} is still running"
            exit 1
        else
            echo "Process with same ID as old randomize is running: \"${OLD_NAME}\"@${OLD_PID}"
            echo "Replacing old process ID"
        fi
    fi
fi
echo "${BASHPID}" > "${PIDFILE}"

# Set transition settings
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=2

# Interval between wallpaper changes (in seconds)
INTERVAL=900  # 15 minutes

# Resize type options: no, crop, fit
RESIZE_TYPE="fit"

# Get the list of displays
DISPLAY_LIST=$(swww query | grep -Po "^[^:]+")

# Function to set random wallpaper
set_random_wallpaper() {
    # Find a random image from the specified directory
    img=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

    if [[ -z "$img" ]]; then
        echo "No images found in $WALLPAPER_DIR!"
        exit 1
    fi

    # Set the random wallpaper for each display
    for disp in $DISPLAY_LIST; do
        swww img --outputs "$disp" "$img"
    done
}

# Initial wallpaper change
set_random_wallpaper

# Schedule the script to run every 15 minutes using 'at'
while true; do
    set_random_wallpaper
    sleep $INTERVAL
done
