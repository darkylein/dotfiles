#!/bin/bash
#      _       _    __ _ _              ___           _        _ _
#   __| | ___ | |_ / _(_) | ___  ___   |_ _|_ __  ___| |_ __ _| | |
#  / _' |/ _ \| __| |_| | |/ _ \/ __|   | || '_ \/ __| __/ _' | | |
# | (_| | (_) | |_|  _| | |  __/\__ \   | || | | \__ \ || (_| | | |
#  \__,_|\___/ \__|_| |_|_|\___||___/  |___|_| |_|___/\__\__,_|_|_|
#
# by darkylein (2023)
# ------------------------------------------------------
# Install Script for dotfiles and configuration
# yay must be installed
# ------------------------------------------------------

# ------------------------------------------------------
# Load Library
# ------------------------------------------------------
source "$(dirname "$0")"/scripts/library.sh
#clear
echo ""
echo "      _       _    __ _ _              ___           _        _ _"
echo "   __| | ___ | |_ / _(_) | ___  ___   |_ _|_ __  ___| |_ __ _| | |"
echo "  / _' |/ _ \| __| |_| | |/ _ \/ __|   | || '_ \/ __| __/ _' | | |"
echo " | (_| | (_) | |_|  _| | |  __/\__ \   | || | | \__ \ || (_| | | |"
echo "  \__,_|\___/ \__|_| |_|_|\___||___/  |___|_| |_|___/\__\__,_|_|_|"
echo ""
echo "by darkylein (2023)"
echo "-------------------------------------"
echo ""
echo "The script will ask for permission to remove existing directories and files from ~/.config/"
echo "Symbolic links will then be created from ~/dotfiles into your ~/.config/ directory."
echo "But you can decide to keep your personal versions by answering with No (Nn)."
echo ""

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
while true; do
    read -r -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* )
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ------------------------------------------------------
# Create .config folder
# ------------------------------------------------------
echo ""
echo "-> Check if .config folder exists"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
# name symlink source target

echo ""
echo "-------------------------------------"
echo "-> Install general dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink .bashrc ~/.bashrc ~/dotfiles/bash/.bashrc ~/.bashrc
_installSymLink alacritty ~/.config/alacritty ~/dotfiles/alacritty/ ~/.config
_installSymLink btop ~/.config/btop ~/dotfiles/btop/ ~/.config
_installSymLink fuzzel ~/.config/fuzzel ~/dotfiles/fuzzel/ ~/.config
_installSymLink pacman ~/.config/pacman ~/dotfiles/pacman/ ~/.config
_installSymLink spotify-player ~/config/spotify-player ~/dotfiles/spotify-player ~/.config
_installSymLink starship ~/.config/starship ~/dotfiles/starship ~/.config
_installSymLink wob ~/.config/wob ~/dotfiles/wob/ ~/.config

echo "-------------------------------------"
echo "-> Install GTK dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink .gtkrc-2.0 ~/.gtkrc-2.0 ~/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/dotfiles/gtk/gtk-3.0/ ~/.config/
_installSymLink gtk-4.0 ~/.config/gtk-4.0 ~/dotfiles/gtk/gtk-4.0/ ~/.config/

echo "-------------------------------------"
echo "-> Install Sway dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink sway ~/.config/sway ~/dotfiles/sway/ ~/.config
_installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
_installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE!"
echo "NEXT: Please continue with 3-tweaks.sh"
