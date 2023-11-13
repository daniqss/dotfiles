#!/bin/sh

# Screens
screens &

# Wallpaper
feh --bg-scale Wallpapers/RoW01.jpg & disown

# Composer
picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Lock Screen Randomizer
betterlockscreen -u $HOME/Wallpapers --fx blur & disown

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown # start polkit agent from GNOME
