#!/bin/sh

# --- settings (run-once, synchronous) ---
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
setxkbmap -option caps:escape
xset b off
xset r rate 300 50
xsetroot -cursor_name left_ptr &

# --- export session env to systemd + D-Bus ---
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# --- session daemons (background) ---
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
picom &
clipmenud &
[ -f ~/.fehbg ] && ~/.fehbg &
xss-lock -- ~/.local/bin/lock &

exec bspwm
