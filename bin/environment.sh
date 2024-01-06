# make default editor Neovim
export EDITOR=nvim

# Most pure GTK3 apps use wayland by default, but some,
# like Firefox, need the backend to be explicitely selected.
export MOZ_ENABLE_WAYLAND=1
export GTK_CSD=0

# qt wayland
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

# set ozone platform to wayland
export ELECTRON_OZONE_PLATFORM_HINT=wayland