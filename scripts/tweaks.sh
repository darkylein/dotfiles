#!/bin/bash

# Activate parallel download for pacman
echo "=> Activate parallel download for pacman..."

sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf


# Disable system beeper
echo "=> Disable system beeper..."

echo -e 'blacklist pcspkr\nblacklist snd_pcsp' | sudo tee /etc/modprobe.d/nobeep.conf


# Add polkit rule to allow mounting of internal drives by user if in group wheel.
# This might be overriden by polkit update. Just rerun instal script should fix that.
echo "=> Add polkit rule to allow mounting of internal drives by user if in group wheel ..."

polkit_mount_rule='polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.udisks2.filesystem-mount-system" && subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});'

sudo -i touch /etc/polkit-1/rules.d/10-udisks.rules
echo "$polkit_mount_rule" | sudo tee /etc/polkit-1/rules.d/10-udisks.rules