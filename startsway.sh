#!/bin/bash

env_script_path="/usr/local/bin/dotfiles/environment.sh"

if [ -e "$env_script_path" ]; then
    # File exists, so source it
    echo "Environment sourced successfully."
else
    # File doesn't exist, echo a message and exit
    echo "Error: Environment script not found at $env_script_path. Exiting."
    exit 1
fi

source /usr/local/bin/dotfiles/environment.sh

sway
