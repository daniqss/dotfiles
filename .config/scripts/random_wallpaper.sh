#!/bin/bash

# Set the path to the wallpapers directory
wallpapersDir="${1:-$HOME/.wallpapers}"
delay="${2:-2m}"

# Function to filter out empty elements from the array
filter_array() {
    local arr=("$@")
    local filtered=()
    for elem in "${arr[@]}"; do
        if [[ -n "$elem" ]]; then
            filtered+=("$elem")
        fi
    done
    echo "${filtered[@]}"
}

# Get a list of all image files in the wallpapers directory
wallpapers=("$wallpapersDir"/*)

# Start an infinite loop
while true; do
    # Check if the wallpapers array is empty
    if [ ${#wallpapers[@]} -eq 0 ]; then
        echo "No wallpapers found in directory. Refilling the array."
        # If the array is empty, refill it with the image files
        wallpapers=("$wallpapersDir"/*)
    fi

    # Filter out empty elements from the array
    wallpapers=($(filter_array "${wallpapers[@]}"))

    # Select a random wallpaper from the array
    wallpaperIndex=$(( RANDOM % ${#wallpapers[@]} ))
    selectedWallpaper="${wallpapers[$wallpaperIndex]}"

    # Print the selected wallpaper for debugging
    echo "Selected wallpaper: $selectedWallpaper"

    # Check if the selected wallpaper exists
    if [ ! -f "$selectedWallpaper" ]; then
        echo "Error: File $selectedWallpaper does not exist."
        # Remove the non-existent file from the array and continue
        unset "wallpapers[$wallpaperIndex]"
        continue
    fi

    # Update the wallpaper using the swww img command
    swww img --transition-type outer --transition-pos 0.854,0.977 --transition-step 120 "$selectedWallpaper"

    # Remove the selected wallpaper from the array
    unset "wallpapers[$wallpaperIndex]"

    # Delay before selecting the next wallpaper
    sleep "$delay"
done
