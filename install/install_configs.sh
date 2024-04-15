#!/bin/bash

rm -rf ~/.scripts ~/.wallpapers > /dev/null
rm -rf ~/.config/hypr ~/.config/dunst ~/.config/waybar ~/.config/kitty ~/.config/zsh  .> /dev/null

cp -r .scripts ~/.scripts
cp -r .wallpapers ~/.wallpapers
cp -r .config/hypr ~/.config/hypr
cp -r .config/dunst ~/.config/dunst
cp -r .config/waybar ~/.config/waybar
cp -r .config/kitty ~/.config/kitty
cp -r .config/zsh ~/.config/zsh
