#!/bin/bash
#  ____                        ___           _        _ _
# / ___|_      ____ _ _   _   |_ _|_ __  ___| |_ __ _| | |
# \___ \ \ /\ / / _' | | | |   | || '_ \/ __| __/ _' | | |
#  ___) \ V  V / (_| | |_| |   | || | | \__ \ || (_| | | |
# |____/ \_/\_/ \__,_|\__, |  |___|_| |_|___/\__\__,_|_|_|
#                     |___/
# by darkylein (2023)
# -----------------------------------------------------
# Install Script for common packages, Sway and its required packages
# ------------------------------------------------------

# ------------------------------------------------------
# Load Library
# ------------------------------------------------------
source "$(dirname "$0")/scripts/library.sh"
#clear
echo ""
echo "  ____                        ___           _        _ _"
echo " / ___|_      ____ _ _   _   |_ _|_ __  ___| |_ __ _| | |"
echo " \___ \ \ /\ / / _' | | | |   | || '_ \/ __| __/ _' | | |"
echo "  ___) \ V  V / (_| | |_| |   | || | | \__ \ || (_| | | |"
echo " |____/ \_/\_/ \__,_|\__, |  |___|_| |_|___/\__\__,_|_|_|"
echo "                     |___/"
echo "by darkylein (2023)"
echo "-------------------------------------"
echo ""

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay || exit
    makepkg -si
    cd ~/dotfiles/ || exit
#    clear
    echo ""
    echo "  ____                        ___           _        _ _"
    echo " / ___|_      ____ _ _   _   |_ _|_ __  ___| |_ __ _| | |"
    echo " \___ \ \ /\ / / _' | | | |   | || '_ \/ __| __/ _' | | |"
    echo "  ___) \ V  V / (_| | |_| |   | || | | \__ \ || (_| | | |"
    echo " |____/ \_/\_/ \__,_|\__, |  |___|_| |_|___/\__\__,_|_|_|"
    echo "                     |___/"
    echo "by darkylein (2023)"
    echo "-------------------------------------"
    echo ""
    echo "yay has been installed successfully."
    echo ""
fi

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
# Install required packages
# ------------------------------------------------------
echo ""
echo "-> Install main packages"

packagesPacman=(
    "alacritty"
    "blueman"
    "dosfstools"
    "fuzzel"
    "imv"
    "mako"
    "mpv"
    "networkmanager"
    "nano"
    "neovim"
    "polkit"
    "starship"
    "sway"
    "swaybg"
    "swayidle"
    "swaylock"
    "thunar" "gvfs" "thunar-volman" "thunar-archive-plugin" "xarchiver" "thumbler"
    "ttf-nerd-fonts-symbols"
    "vlc"
    "waybar"
    "xdg-user-dirs"
    "xorg-xwayland"
);

packagesYay=(
    "librewolf-bin"
);

_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
#clear
echo "DONE!"
echo "NEXT: Please continue with 2-dotfiles.sh"
