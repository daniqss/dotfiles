#!/bin/bash

# Update Hyprland from newer release

# Obtein the latest release tag 
latest_release_url=$(curl -s -L https://api.github.com/repos/vaxerski/Hyprland/releases/latest | jq -r '.url')
latest_release_tag=$(curl -s -L $latest_release_url | jq -r '.tag_name')

# Download and extract the latest release
cd /tmp
curl -L -o $latest_release_tag.tar.gz https://github.com/hyprwm/Hyprland/releases/download/$latest_release_tag/$latest_release_tag.tar.gz
tar -xvf $latest_release_tag.tar.gz
cd hyprland

# Copy the binaries new releases
# Copiar los binarios a /usr/bin/
sudo cp hyprctl /usr/bin/
sudo cp Hyprland /usr/bin/

# Copiar libwlroots.so a /usr/lib/
sudo cp libwlroots.so.* /usr/lib/

# Copiar el archivo de configuración
sudo cp example/hyprland.desktop /usr/share/wayland-sessions/
sudo cp example/hyprland.conf /usr/share/wayland-sessions/

# Limpiar
cd
sudo rm -rf /tmp/hyprland_latest.tar.gz
sudo rm -rf /tmp/hyprland

echo "Hyprland se ha instalado correctamente."