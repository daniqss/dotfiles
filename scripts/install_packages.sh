#!/bin/bash

main() {
    echo "This script installs most of the packages I'm currently using"
    echo "It's meant to be run on Arch-based systems after a minimal installation in a tty session"
    echo "Please make sure you have git and yay installed before running this script"

    read -p "Do you want to continue? (y/n): " continue
    continue="${continue,,}"
    if [[ ! "$continue" =~ ^(yes|y)$ ]]; then
        exit 0
    fi

    echo "Updating system..."
    sudo pacman -Syu --noconfirm

    # Install packages
    install_pacman_packages
    install_yay_packages
    install_cargo_packages

    echo "All packages installed successfully!"
}

# Function to install packages using pacman
install_pacman_packages() {
    echo "Installing pacman packages..."
    sudo pacman -S --noconfirm "${pacman_packages[@]}"
}

# Function to install packages using yay
install_yay_packages() {
    echo "Installing yay packages..."
    yay -S --noconfirm "${yay_packages[@]}"
}

install_cargo_packages() {
    echo "Installing cargo packages..."
    cargo install "${cargo_packages[@]}"
}

# Define pacman packages
pacman_packages=(
    # Hyprland
    hyprland
    xdg-desktop-portal-hyprland
    hyprpaper
    hyprcursor
    
    # Terminal
    alacritty
    zsh
    starship
    neovim
    micro
    fastfetch
    htop
    bottom
    exa
    bat
    cava
    
    # Settings
    pavucontrol
    pipewire
    gst-plugin-pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack
    pipewire-pulse
    wireplumber
    networkmanager
    nm-connection-editor
    bluez
    bluez-utils
    blueberry
    nwg-look
    wl-clipboard
    cliphist
    
    # Apps
    rofi-wayland
    rofimoji
    rofi-bluetooth
    mako
    waybar
    wlogout
    obsidian
    nautilus
    eog
    steam
    discord
    spotify-launcher
    
    # Development
    nodejs
    npm
    bun
    python
    python-pip
    python-pipx
    rust

    # miscelaneous
    brigthnessctl
    playerctl
    jq


    #sddm theme
    sddm
    qt6-5compat
    qt6-declarative
    qt6-svg
)

# Define yay packages
yay_packages=(
    hyprpicker
    hyprlock
    hypridle
    hyprshade
	swww

    # Apps
    xpadneo-dkms

    # Fonts
    ttf-bitstream-vera
    ttf-cascadia-code
    ttf-dejavu
    ttf-cascadia-code-nerd
    ttf-firacode-nerd
    ttf-jetbrains-mono
    ttf-liberation
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    ttf-opensans
    ttf-roboto
    noto-fonts-emoji
    ttf-ubuntu-nerd

    # themes
    bibata-cursor-theme
    orchis-theme-git
    orchis-kde-theme-curve-git
    tela-circle-icon-theme-all
)

cargo_packages=(
    hyprqtile
    pokeget
    lizzy
)

main
