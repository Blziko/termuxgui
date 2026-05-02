#!/usr/bin/env bash

killall -9 \
    termux-x11 \
    Xwayland \
    virgl_test_server_android \
    xfce4-session \
    pulseaudio \
    2>/dev/null

rm -rf "${PREFIX}/tmp/.X11-unix"
rm -rf "${PREFIX}/tmp/.X1-lock"

pulseaudio --start --exit-idle-time=-1
pacmd \
    load-module \
    module-native-protocol-tcp \
    auth-ip-acl=127.0.0.1 \
    auth-anonymous=1

termux-x11 :1 &
virgl_test_server_android &
sleep 1

am start -n \
    com.termux.x11/com.termux.x11.MainActivity
sleep 1

export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
export GALLIUM_DRIVER=virpipe

dbus-launch --exit-with-session xfce4-session