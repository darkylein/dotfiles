#!/bin/bash

# Create .config directory if necessary
echo "=> Create .config directory if necessary"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi


# Create symbolic links for dotfiles
echo "=> Create symbolic links for dotfiles..."

# GTK
_createSymLink ~/.gtkrc-2.0 ~/dotfiles/config/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_createSymLink ~/.config/gtk-3.0 ~/dotfiles/config/gtk/gtk-3.0/ ~/.config/
_createSymLink ~/.config/gtk-4.0 ~/dotfiles/config/gtk/gtk-4.0/ ~/.config/
# Sway
_createSymLink ~/.config/sway ~/dotfiles/config/sway/ ~/.config
_createSymLink ~/.config/swaylock ~/dotfiles/config/swaylock/ ~/.config
_createSymLink ~/.config/waybar ~/dotfiles/config/waybar/ ~/.config
# Misc
_createSymLink ~/.bashrc ~/dotfiles/config/bash/.bashrc ~/.bashrc
_createSymLink ~/.config/alacritty ~/dotfiles/config/alacritty/ ~/.config
_createSymLink ~/.config/btop ~/dotfiles/config/btop/ ~/.config
_createSymLink ~/.config/fuzzel ~/dotfiles/config/fuzzel/ ~/.config
_createSymLink ~/.config/pacman ~/dotfiles/config/pacman/ ~/.config
_createSymLink ~/.config/spotify-player ~/dotfiles/config/spotify-player ~/.config
_createSymLink ~/.config/starship ~/dotfiles/config/starship ~/.config
_createSymLink ~/.config/wob ~/dotfiles/config/wob/ ~/.config