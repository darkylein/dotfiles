#!/bin/bash
#  _____                    _
# |_   _|_      _____  __ _| | _____
#  | | \ \ /\ / / _ \/ _' | |/ / __|
#  | |  \ V  V /  __/ (_| |   <\__ \
#  |_|   \_/\_/ \___|\__,_|_|\_\___/
#
# by darkylein (2023)
# -----------------------------------------------------
# Some tweaks which may increase your experience
# ------------------------------------------------------

# ------------------------------------------------------
# Load Library
# ------------------------------------------------------
source "$(dirname "$0")/library.sh"
#clear
echo " _____                    _"
echo "|_   _|_      _____  __ _| | _____"
echo "  | | \ \ /\ / / _ \/ _' | |/ / __|"
echo "  | |  \ V  V /  __/ (_| |   <\__ \ "
echo "  |_|   \_/\_/ \___|\__,_|_|\_\___/"
echo ""
echo "by darkylein (2023)"
echo "-------------------------------------"
echo ""

# ------------------------------------------------------
# Run Tweaks
# ------------------------------------------------------

# Activate parallel download for pacman
_execCommand "Activate parallel download for pacman" "sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf"

# Disable system beeper
_execCommand "Disable system beeper" "echo -e 'blacklist pcspkr\nblacklist snd_pcsp' | sudo tee /etc/modprobe.d/nobeep.conf"

# Copy binaries into /usr/local/bin
_execCommand "Copy binaries into /usr/local/bin" "sudo cp -v -p "$(dirname "$0")/../bin"/* "/usr/local/bin""

# Enable daemons

daemons=(
    "bluetooth.service"
    "cups.socket"
    "NetworkManager.service"
)
_enableDaemons "${daemons[@]}";

# Disable daemons

daemons_disable=(
    "systemd-networkd.service"
    "systemd-networkd.socket"
    )
_disableDaemons "${daemons_disable[@]}";

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE!"
echo "NEXT: Please logout and reboot your system!"
