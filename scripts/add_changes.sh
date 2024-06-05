rm -r ~/dotfiles/.config/*
cp -r ~/.config/hypr ~/dotfiles/.config/
cp -r ~/.config/waybar ~/dotfiles/.config/
cp -r ~/.config/alacritty ~/dotfiles/.config/
cp -r ~/.config/rofi ~/dotfiles/.config/
cp -r ~/.config/zsh ~/dotfiles/.config/
cp -r ~/.config/dunst ~/dotfiles/.config/
cp -r ~/.config/kitty ~/dotfiles/.config/
cp ~/.config/starship.toml ~/dotfiles/.config/

git add ~/dotfiles/.config
