#!/bin/bash

if [ -e "$HOME/.wallpapers" ]; then
rm -rf "$HOME/.wallpapers" > /dev/null
fi
cp -r "$HOME/dotfiles/.wallpapers" "$HOME/.wallpapers"

DOTFILES_DIR="$HOME/dotfiles/.config"
DEST_DIR="$HOME/.config"

for item in "$DOTFILES_DIR"/*; do
  basename_item=$(basename "$item")
  dest_item="$DEST_DIR/$basename_item"

  if [ -e "$dest_item" ]; then
    rm -rf "$dest_item" > /dev/null
  fi
  cp -r "$item" "$DEST_DIR"
done