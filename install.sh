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


# Run tweaks
echo ""
echo "==========================================="
echo "=> Run tweaks..."

source "$(dirname "$0")/scripts/tweaks.sh"


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

# Manage packages
echo ""
echo "==========================================="
echo "=> Manage packages..."

source "$(dirname "$0")/scripts/install_packages.sh"


# Disable unused daemons
echo ""
echo "==========================================="
echo "=> Manage daemons..."

source "$(dirname "$0")/scripts/daemons.sh"


# Create .config directory if necessary
echo ""
echo "==========================================="
echo "=> Manage configs..."

source "$(dirname "$0")/scripts/config.sh"