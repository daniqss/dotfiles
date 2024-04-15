#!/bin/bash

main() {
    echo "This script install most of the packeges I'm currently using"
    echo "It's meant to be run on Arch-based systems after a minimal installation in a tty session"
    echo "Please make sure you have git and yay installed before running this script"

    read -p "Do you want to continue? (y/n): " continue
    continue="${continue,,}"
    if [[ ! "$continue" =~ ^(yes|y)$ ]]; then
        exit 0
    fi

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
    sudo pacman -Syu --noconfirm ${pacman_packages[@]}
}

# Function to install packages using yay
install_yay_packages() {
    echo "Installing yay packages..."
    yay -Syu --noconfirm ${yay_packages[@]}
}

install_nvidia_packages() {
    echo "Installing Nvidia packages..."
    sudo pacman -Syu --noconfirm ${nvidia_packages[@]}
}

# Define pacman packages
pacman_packages=(
    # Essentials
    "base-devel"
    "linux-headers"
    "linux-firmware"
    "pacman-contrib"
    "meson"
    "ninja"
    "cmake"
    
    # Hyprland
    "hyprland"
    "xdg-desktop-portal-hyprland"
    "hyprpaper"
    "hyprpicker"
    "hyprcursor"
    "hyprshot"
    "hyprlock"
    "hypridle"
    
    # Terminal
    "kitty"
    "zsh"
    "starship"
    "neovim"
    "micro"
    "neofetch"
    "htop"
    "bottom"
    "exa"
    "bat"
    
    # Audio
    "pavucontrol"
    "pipewire"
    "gst-plugin-pipewire"
    "pipewire"
    "pipewire-alsa"
    "pipewire-audio"
    "pipewire-jack"
    "pipewire-pulse"
    "wireplumber"
    
    # Network
    "networkmanager"
    "network-manager"
    "nm-connection-editor"
    "bluez"
    "bluez-utils"
    "blueberry"
    
    # Apps
    "wofi"
    "dunst"
    "waybar"
    "firefox"
    "obsidian"
    "thunar"
    "steam"
    "discord"
    
    # Development
    "nodejs"
    "npm"
    "bun"
    "python"
    "python-pip"
    "python-pipx"
)

# Define yay packages
yay_packages=(
    # Apps
    "visual-studio-code-bin"
    "brave-bin"
    "spotify"
    "google-chrome-stable"

    # Fonts
    "ttf-cascadia-code"
    "ttf-cascadia-code-nerd"
    "ttf-firacode-nerd"
    "ttf-jetbrains-mono"
    "ttf-liberation"
    "ttf-nerd-fonts-symbols"
    "ttf-opensans"
    "ttf-roboto"
    "noto-fonts-emoji",
    "ttf-ubuntu-nerd"
    "ttf-nerd-fonts-symbols-common"
)

# Define Nvidia packages
nvidia_packages=(
    "lib32-nvidia-utils"
    "nvidia"
    "nvidia-hook"
    "nvidia-inst"
    "nvidia-settings"
    "nvidia-utils"
    "opencl-nvidia"
)

main()