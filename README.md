# dotfiles

## Common Packages

- Bluetooth Manager: blueman
- Browser: LibreWolf
- Editor: nano, neovim
- Filemanager: Thunar
- Image Viewer: imv
- Media Player: VLC Media Player
- Menu: Fuzzel
- Music Player: mpv
- Network Manager: NetworkManager (nmcli/nmtui)
- Wayland Notification Daemon: mako
- Pacman Wrapper: yay
- Prompt: Starship
- Spotify Wrapper: psst
- Terminal: Alacritty
- XDG user directories (Tool to create default directories in /home)

## Sway

Packages which are strictly required for this sway setup.

- Wayland Background Manager: swaybg
- Icons: Nerd Fonts Symbols
- Wayland Idle Manager: swayidle
- Wayland Lock Manager: swaylock
- Status Bar: waybar
- polkit (Required on Arch, to grant sway access to your seat)
- Wayland X Server: Xwayland

## Additional Packages (Not installed automatically)

These packages are not essential for the functionality of this custom sway setup and, therefore, are not installed by default.

- Image/PDF Converter: ImageMagick
- ghostscript (Required by ImageMagick to handle PDF files)
- 2D Editor: Krita
- Vector Graphic Editor: InkScape
- Office Suite: LibreOffice (fresh)
- Password Manager: KepassXC
- Telegram

### Pacman

```bash
pacman -S '\
figlet \
imagemagick ghostscript \
krita \
inkscape \
libreoffice-fresh \
keepassxc \
telegram-desktop'
```

### Yay

```bash
yay 
```

### Steam

- Choose vulkan-radeon and than lib32-vulkan-radeon in installation
```bash
pacman -S steam
```

### Extended Controller Support (xpadneo)

- Make sure, that the controller has current firmware (Update over Xbox Accessories app from Microsoft-Store)
- Run installation script from https://github.com/atar-axis/xpadneo

## Tweaks

Tweaks which are currently NOT integrated into the install-script.

- Acivate and set parallel downloads for pacman to value 10
```bash
sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
```

- Disable comprehension of AUR packages after install
```bash
echo -e "PKGEXT='.pkg.tar'\nSRCEXT='.src.tar'" >> ~/.makepkg.conf
```
- 
- Disable system beep sound (Only on lenovo laptop)
```bash
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf
```


## Arch Installation

Tweaks which are specific to the arch linux installation.

- Use the archinstall script for the installation

## ENV Variables

ENV variables which are set before sway starts
- MOZ_ENABLE_WAYLAND=1 (Start LibreWolf in wayland mode)

## TODO

- Get inspired by Stephan Raabe's dotfiles (https://gitlab.coßm/stephan-raabe/dotfiles/-/tree/main)
- Add install script
- Integrate notifications daemon mako to sway (https://github.com/emersion/mako)
- Revamp fuzzel config
- Revamp waybar and integrate color schemes (https://github.com/catppuccin/catppuccin)
- Add soft background to modules in waybar
- Setup starship prompt with alacritty
- Integrate autostart sway with login (https://wiki.archlinux.org/title/Sway)
- Extend arch Installation Tweaks AND save the archinstall script config in this project
- Set ENV vars before sway start or in /etc/environment (https://wiki.archlinux.org/title/Environment_variables)
- Add full QT- and GTK-Theme support
- Add setup of default applications
- Add screenshots with grim & slurp & swappy to sway/waybar and maybe screen recording
- Add file extensions to config files, wäre it is possible (.cfg, jsonc, etc.)
- Give XDG Desktop Portal a try
- Give freerdp a try
- Give swww (Animated background)
