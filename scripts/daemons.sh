#!/bin/bash

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