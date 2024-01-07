# dotfiles

## Install

- Clone repo into home directory
- Run install script

# Start

Simply run the startsway.sh script.

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

### Environment
Environment variables are set in /bin/environment.sh. Feel free to add some more.
The environment variables are only set if sway was started with swaystart.sh.

### Neovim
- run kickstarter script from https://github.com/nvim-lua/kickstart.nvim

### TeamSpeak3
Theme/Icon-Pack source: https://github.com/randomhost/teamspeak-dark
- Copy gfx and styles into ~/.ts3client direcory
- Theme and Icon pack must be activated manually in client settings

## Arch installation preferences

Use the archinstall script.

## TODO

- Add mako config for more beautiful notifications
- Add archinstall config
- Try out freerdp and add the package
- Integrate QT5/6 themes
- Configure ranger
- Make Neovim optionally more IDE like to replace pycharm
- Add archinstall config
