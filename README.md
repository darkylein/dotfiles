# dotfiles

## Install

- Clone repo into home directory
- Run install script

## Start

Simply run the startsway.sh script.

## Packages

Packages files are located under /packages.
Packages in pacman.base.txt and yay.base.txt will be installed first. Packages in pacman.txt and yay.txt after.

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
