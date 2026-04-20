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
    "florence"
    "adwaita-icon-theme"
    "papirus-icon-theme"
    "code-is-code-oss"
    "pulseaudio"
    "audacious"
    "ristretto"
    "xclip"
    "xwayland"
    "mousepad"
    "geany"
    "synaptic"
    "galculator"
    "gtk-update-icon-cache"
    "scdaemon"
    "mesa-dev"
    "plank-reloaded"
    "gimp"
)

command apt install -y "${require[@]}"

command mkdir -pv "${HOME}/.config/gtk-3.0"
echo -e \
    '[Settings]\ngtk-application-prefer-dark-theme=1' \
    > "${HOME}/.config/gtk-3.0/settings.ini"

command mkdir -pv "${HOME}/.local/share/fonts"
cd "${HOME}/.local/share/fonts"
command curl -fLO \
    'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip'
command unzip 'SourceCodePro.zip'
command rm -fv SourceCodePro.zip
command fc-cache -fv
cd

command mkdir -pv "${HOME}/.icons"
command git clone --depth 1 \
    'https://github.com/vinceliuice/WhiteSur-icon-theme.git' \
    "${HOME}/.icons/WhiteSur-icon-theme"
cd "${HOME}/.icons/WhiteSur-icon-theme"
command chmod +x install.sh
./install.sh
cd

command git clone --depth 1 \
    'https://github.com/Zeronetsec/Muxly.git'
cd Muxly
command chmod +x install.sh
./install.sh
cd

command muxly --volume-keys volume
command muxly --chfont source_code_pro
command muxly --reset-theme
command muxly --chcursor underline
command muxly --chcursor-blink-rate 500
command muxly --shortcut-create-session 'ctrl + `'
command muxly --shortcut-next-session 'ctrl + >'
command muxly --shortcut-previous-session 'ctrl + <'
command muxly --shortcut-rename-session 'ctrl + :'
command muxly --install-rootfs kali_rolling

if [[ ! -d "${HOME}/storage" ]] && ! command ls '/sdcard/' >/dev/null 2>&1; then
    command termux-setup-storage
fi