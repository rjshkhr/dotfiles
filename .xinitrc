#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
setxkbmap -option caps:escape
xsetroot -cursor_name left_ptr &
xset b off
xset r rate 300 50
[ -f ~/.fehbg ] && ~/.fehbg &
dunst &
picom &
clipmenud &
xss-lock -- ~/.local/bin/lock &

# Fix xdg-desktop-portal environment
export DISPLAY="$DISPLAY"
export DBUS_SESSION_BUS_ADDRESS="$DBUS_SESSION_BUS_ADDRESS"
systemctl --user import-environment DISPLAY DBUS_SESSION_BUS_ADDRESS
systemctl --user restart xdg-desktop-portal
systemctl --user restart xdg-desktop-portal-gtk

exec bspwm
