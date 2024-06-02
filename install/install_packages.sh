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

    read -p "Do you want to install Nvidia packages? (y/n): " nvidia
    nvidia="${nvidia,,}"
    if [[ "$nvidia" =~ ^(yes|y)$ ]]; then
        install_nvidia_packages
    fi

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

# Function to install Nvidia packages
install_nvidia_packages() {
    echo "Installing Nvidia packages..."
    sudo pacman -S --noconfirm "${nvidia_packages[@]}"
}

# Define pacman packages
pacman_packages=(
    # Essentials
    base-devel
    linux-headers
    linux-firmware
    pacman-contrib
    meson
    ninja
    cmake
    
    # Hyprland
    hyprland
    xdg-desktop-portal-hyprland
    hyprpaper
    hyprpicker
    hyprcursor
    hyprshot
    hyprlock
    hypridle
    
    # Terminal
    kitty
    zsh
    starship
    neovim
    micro
    fastfetch
    htop
    bottom
    exa
    bat
    
    # Audio
    pavucontrol
    pipewire
    gst-plugin-pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack
    pipewire-pulse
    wireplumber
    
    # Network
    networkmanager
    nm-connection-editor
    bluez
    bluez-utils
    blueberry
    
    # Apps
    chromium
    wofi
    dunst
    waybar
    obsidian
    thunar
    steam
    discord
    
    # Development
    nodejs
    npm
    bun
    python
    python-pip
    python-pipx
    rust
)

# Define yay packages
yay_packages=(
    # Apps
    spotify
    xpadneo

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
)

# Define Nvidia packages
nvidia_packages=(
    nvidia
    nvidia-utils
    nvidia-dkms
    egl-wayland
    lib32-nvidia-utils
    nvidia-settings
    opencl-nvidia
)

main
