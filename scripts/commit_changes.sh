sudo rm -r ~/dotfiles/.config/*
rm -r ~/dotfiles/.wallpapers/*
cp -r ~/.config/hypr ~/dotfiles/.config/
cp -r ~/.config/waybar ~/dotfiles/.config/
cp -r ~/.config/alacritty ~/dotfiles/.config/
cp -r ~/.config/wofi ~/dotfiles/.config/
cp -r ~/.config/dunst ~/dotfiles/.config/
cp -r ~/.config/kitty ~/dotfiles/.config/
cp -r ~/.config/gtk-4.0 ~/dotfiles.config/
cp -r ~/.config/gtk-3.0 ~/dotfiles/.config/
cp -r ~/.config/Thunar ~/dotfiles/.config/
cp -r ~/.config/scripts ~/dotfiles/.config/
cp ~/.config/starship.toml ~/dotfiles/.config/
cp ~/.wallpapers/* ~/dotfiles/.wallpapers/

cp -r ~/.config/zsh ~/dotfiles/.config/
sudo rm -r ~/dotfiles/.config/zsh/zsh-autosuggestions
sudo rm -r ~/dotfiles/.config/zsh/zsh-syntax-highlighting
sudo rm -r ~/dotfiles/.config/zsh/sudo.plugin.zsh

git add ~/dotfiles/
current_date=$(date)
git commit -m "dotfiles at $current_date"
