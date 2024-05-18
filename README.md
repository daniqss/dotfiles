# dotfiles
My current ArchLinux setup. Using [Hyprland](https://hyprland.org) and *eventually* [ags](https://github.com/Aylur/ags)
> [!WARNING]  
> For my qtile configurations search in the [qtile](https://github.com/daniqss/dotfiles/tree/qtile) branch

## Installation
To install the dotfiles, you need to clone the repository and run [`the installation script`](./install/install.sh).
All the packages are listed in the [install_packages](./install/install_packages.sh). You can modify it to your needs.

```bash
git clone --depth 1 --branch main https://github.com/daniqss/dotfiles.git
cd dotfiles
./install/install_packages.sh
./install/install_configs.sh
```
> [!WARNING]  
> The script will install remove all the config folders that may conflict with the dotfiles.
> Make sure to backup your files before running the script.


## Keybindings

| **Bind**             | **Action**                 |
| -------------------- | -------------------------- |
| `mod+Enter`          | Launch terminal            |
| `mod+space`          | Switch keyboard layout     |
| `mod+n`              | Launch hyprlock            |
| `mod+q`              | Toggle floating mode       |
| `mod+w`              | Kill focused window        |
| `mod+m`              | Kill hyprland              |
| `mod+f`              | Toggle fullscreen          |
| `mod+Tab`            | Launch wofi                |
| `alt+Tab`            | Hycov Overview             |
| `mod+alt+Tab`        | Power Menu                 |
| `mod+e`              | Rofi emoji                 |
| `mod+p`              | Open workspace default app |
| `mod+b`              | hide waybar                |
| `Print`              | Screenshot                 |
| `mod + g`            | Gaming mode                |
| `Print`              | Hyprshot                   |
| `mod+Shift+[hjkl]`   | Move window                |
| `mod+Control+[hjkl]` | Resize window              |
| `mod+[hjkl]`         | Focus window               |

