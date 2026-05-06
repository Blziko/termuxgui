#!/usr/bin/env bash

command apt install x11-repo -y

require=(
    "git"
    "unzip"
    "curl"
    "fontconfig-utils"
    "termux-x11-nightly"
    "proot-distro"
    "xfce4"
    "xfce4-terminal"
    "xfce4-settings"
    "xfce4-goodies"
    "xfce4-pulseaudio-plugin"
    "xfce4-taskmanager"
    "xfce4-screenshooter"
    "virglrenderer-android"
    "chromium"
    "pulseaudio"
    "audacious"
    "ristretto"
    "xclip"
    "xwayland"
    "mousepad"
    "kate"
    "galculator"
    "gtk-update-icon-cache"
    "scdaemon"
    "mesa-dev"
    "plank-reloaded"
    "konsole"
    "wmctrl"
)

command apt install -y "${require[@]}"

command mkdir -pv "${HOME}/.config/gtk-3.0"
echo -e \
    '[Settings]\ngtk-application-prefer-dark-theme=1' \
    > "${HOME}/.config/gtk-3.0/settings.ini"

command mkdir -pv "${HOME}/.wallpaper"
command mkdir -pv "${HOME}/.icons"
command mkdir -pv "${HOME}/.themes"
command mkdir -pv "${HOME}/.config"
command mkdir -pv "${HOME}/.local/share/fonts"
command mkdir -pv "${HOME}/.config/audacious"
command mkdir -pv "${HOME}/.config/fontconfig"

if [[ ! -d "${HOME}/storage" ]] && ! command ls '/sdcard/' >/dev/null 2>&1; then
    command termux-setup-storage
fi