sudo rm -r ~/dotfiles/.config/*
cp -r ~/.config/hypr ~/dotfiles/.config/
cp -r ~/.config/waybar ~/dotfiles/.config/
cp -r ~/.config/alacritty ~/dotfiles/.config/
cp -r ~/.config/rofi ~/dotfiles/.config/
cp -r ~/.config/dunst ~/dotfiles/.config/
cp -r ~/.config/kitty ~/dotfiles/.config/
cp ~/.config/starship.toml ~/dotfiles/.config/

cp -r ~/.config/zsh ~/dotfiles/.config/
sudo rm -r ~/dotfiles/.config/zsh/zsh-autosuggestions
sudo rm -r ~/dotfiles/.config/zsh/zsh-syntax-highlighting
sudo rm -r ~/dotfiles/.config/zsh/sudo.plugin.zsh

git add ~/dotfiles/
current_date=$(date)
git commit -m "dotfiles at $current_date"
