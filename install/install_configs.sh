#!/bin/bash

rm -rf ~/.scripts ~/.wallpapers > /dev/null
rm -rf ~/.config/hypr ~/.config/dunst ~/.config/waybar ~/.config/kitty ~/.config/zsh  > /dev/null

cp -r ~/dotfiles/.scripts ~/.scripts
cp -r ~/dotfiles/.wallpapers ~/.wallpapers
cp -r ~/dotfiles/.config/hypr ~/.config/hypr
cp -r ~/dotfiles/.config/dunst ~/.config/dunst
cp -r ~/dotfiles/.config/waybar ~/.config/waybar
cp -r ~/dotfiles/.config/kitty ~/.config/kitty
cp -r ~/dotfiles/.config/zsh ~/.config/zsh
