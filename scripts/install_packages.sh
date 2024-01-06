#!/bin/bash

# Install yay
echo "=> Install yay..."

if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    _installPackagesPacman "base-devel"
    git clone https://aur.archlinux.org/yay.git /tmp/yay_install/
    (cd /tmp/yay_install/ makepkg -si || exit)
fi


echo "=> Install base packages..."

packagesPacmanBase=($(_read_lines_from_file "$(dirname "$0")/packages/packman_base.txt"))
packagesYayBase=($(_read_lines_from_file "$(dirname "$0")/packages/yay_base.txt"))

_installPackagesPacman "${packagesPacmanBase[@]}";
_installPackagesYay "${packagesYayBase[@]}";


echo "=> Install additional packages..."

packagesPacman=($(_read_lines_from_file "$(dirname "$0")/packages/packman_base.txt"))
packagesYay=($(_read_lines_from_file "$(dirname "$0")/packages/yay.txt"))

_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";
