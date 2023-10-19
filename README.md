# dotfiles

## Common Packages
- Browser: LibreWolf
- Editor: nano, neovim
- Filemanager: Thunar
- Image Viewer: imv
- Menu: Fuzzel
- Pacman Wrapper: yay
- Terminal: Alacritty
- xdg-user-dirs (Tool to create default directories in /home)

## Sway
- Background Manager: swaybg
- Icons: Nerd Fonts Symbols
- Idle Manager: swayidle
- Lock Manager: swaylock
- Status Bar: waybar
- polkit (Required on Arch, to grant sway access to your seat)
- Network Manager: NetworkManager (nmcli/nmtui)
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

## Steam
- Choose vulkan-radeon and than lib32-vulkan-radeon in installation
```bash
pacman -S steam
```

## Extended Controller Support (xpadneo)
- Make sure, that the controller has current firmware (Update over Xbox Accessories app from Microsoft-Store)
- Run installation script from https://github.com/atar-axis/xpadneo

## Tweaks
Tweaks which are currently NOT integrated into the install-cript.

- Set parallel downloads for pacman to 10
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
- Get inspired by Stephan Raabe's dotfiles (https://gitlab.com/stephan-raabe/dotfiles/-/tree/main)
- Add install script
- Add notifications daemon Mike mako to sway (https://github.com/emersion/mako)
- Revamp fuzzel config
- Revamp waybar and integrate color schemes (https://github.com/catppuccin/catppuccin)
- Add soft background to modules in waybar
- Setup starship prompt with alacritty
- Integrate autostart sway with login (https://wiki.archlinux.org/title/Sway)
- Extend arch Installation Tweaks AND save the archinstall script config in this project
- Set ENV vars before sway start or in /etc/environment (https://wiki.archlinux.org/title/Environment_variables)
- Add full QT- and GTK-Theme support
- Add setup of default applications
- Add screenshots with grim & slurp to sway/waybar and maybe screen recording
- Add file extensions to config files, wäre it is possible (.cfg, jsonc, etc.)
