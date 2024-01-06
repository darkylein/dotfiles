# dotfiles

## Install

- Clone repo into home directory
- Run install script

# Start

- Run startsway.sh script from anywhere

## Common Packages

- Audio Control: pulsemixer
- Bluetooth Manager: blueman
- Browser: LibreWolf
- Console Font: JetBrainsMono Nerd Font
- Editor: nano, neovim
- File Manager: PCManFM
- GTK Theme: Nordic Darker
- GTK Icon Theme: Sevi Grey Dark
- Image Viewer: imv
- Media Player: VLC Media Player
- Menu: Fuzzel
- Mouse Settings Tool: Piper
- Music Player: mpv
- Network Manager: NetworkManager (nmcli/nmtui)
- Wayland Notification Daemon: mako
- Pacman Wrapper: yay
- Password Manager: KepassXC
- Prompt: Starship
- Resource Monitor: btop
- Spotify Wrapper: spotify-player (CLI)
- Terminal: Alacritty
- XDG user directories (Tool to create default directories in /home)

## Window Manager (Sway)

Packages which are strictly required for this sway setup.

- Clipboard Tool: wl-clipboard
- Font Waybar: GNU Free Fonts
- Icons: Nerd Fonts Symbols
- polkit (Required on Arch, to grant sway access to your seat)
- Wayland Overlay Bar: WOB 
- Status Bar: waybar
- Wayland Background Manager: swaybg
- Wayland Idle Manager: swayidle
- Wayland Lock Manager: swaylock
- Wayland Window Manager: sway
- Wayland X Server: Xwayland


### Neovim
- run kickstarter script from https://github.com/nvim-lua/kickstart.nvim

### TeamSpeak3
Theme/Icon-Pack source: https://github.com/randomhost/teamspeak-dark
- Copy gfx and styles into ~/.ts3client direcory
- Theme and Icon pack must be activated manually in client settings

## Arch installation preferences

Use the archinstall script.

## TODO

- Get inspired by Stephan Raabe's dotfiles (https://gitlab.com/stephan-raabe/dotfiles/-/tree/main)
- Integrate notifications daemon mako to sway (https://github.com/emersion/mako)
- Add soft background to modules in waybar
- Integrate autostart sway with login (https://wiki.archlinux.org/title/Sway)
- Extend arch Installation Tweaks AND save the archinstall script config in this project
- Set ENV vars before sway start or in /etc/environment (https://wiki.archlinux.org/title/Environment_variables)
- Add screenshots with grim & slurp & swappy to sway/waybar and maybe screen recording
- Add file extensions to config files, where it's possible (.cfg, jsonc, etc.)
- Give freerdp a try
- Integrate QT5/6 theme
- TODO: See max_render_time in sway(5)
- Setup nvim + ranger
- Add archinstall config
