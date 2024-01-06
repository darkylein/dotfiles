#!/bin/bash

# Load library
source "$(dirname "$0")/scripts/library.sh"

echo ""
echo "==========================================="
echo "Please backup your config files beforehand!"
echo "==========================================="
echo ""

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


# Activate parallel download for pacman
echo ""
echo "==========================================="
echo "=> Activate parallel download for pacman..."

sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf


# Disable system beeper
echo ""
echo "==========================================="
echo "=> Disable system beeper..."

echo -e 'blacklist pcspkr\nblacklist snd_pcsp' | sudo tee /etc/modprobe.d/nobeep.conf


# Add polkit rule to allow mounting of internal drives by user if in group wheel.
# This might be overriden by polkit update. Just rerun instal script should fix that.
echo ""
echo "==========================================="
echo "=> Add polkit rule to allow mounting of internal drives by user if in group wheel ..."

polkit_mount_rule='polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.udisks2.filesystem-mount-system" && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});'

sudo -i touch /etc/polkit-1/rules.d/10-udisks.rules
echo "$polkit_mount_rule" | sudo tee /etc/polkit-1/rules.d/10-udisks.rules


# Copy binaries into /usr/local/bin/dotfiles
echo ""
echo "==========================================="
echo "=> Copy binaries into /usr/local/bin/dotfiles ..."

sudo mkdir /usr/local/bin/dotfiles; sudo cp -v -p "$(dirname "$0")/bin"/*.sh "/usr/local/bin/dotfiles"


# Copy startsway script into /usr/local/bin to make it available in PATH
echo ""
echo "==========================================="
echo "=> Copy startsway script into /usr/local/bin ..."

sudo sudo cp -v -p "$(dirname "$0")"/scripts/startsway.sh "/usr/local/bin"


# Install yay
echo ""
echo "==========================================="
echo "=> Install yay..."

if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay.git /tmp/yay_install/
    (cd /tmp/yay_install/ makepkg -si || exit)
fi


# Install packages
echo ""
echo "==========================================="
echo "=> Install packages..."

source "$(dirname "$0")/scripts/install_packages.sh"


# Disable unused daemons
echo ""
echo "==========================================="
echo "=> Manage daemons..."

daemons_to_disable=(
    "systemd-networkd.service"
    "systemd-networkd.socket"
    )
_disableDaemons "${daemons_to_disable[@]}";


# Activate daemons
daemons_to_enable=(
    "bluetooth.service"
    "cups.socket"
    "NetworkManager.service"
)
_enableDaemons "${daemons_to_enable[@]}";


# Create .config directory if necessary
echo ""
echo "==========================================="
echo "=> Create .config directory if necessary"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi


# Create symbolic links for dotfiles
echo ""
echo "==========================================="
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