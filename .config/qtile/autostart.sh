#!/bin/bash

# Restore wallpaper
./.fehbg &

# Start notification daemon
dunst &

# Start clipboard daemon
greenclip daemon &

# Start compositor
picom &

# Map capslock to escape
setxkbmap -option caps:escape

# Start polkit agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Screen blank - 5 min
xset s 300

# Lock on blank
xss-lock -- ~/.local/bin/lock &

# Suspend - 15 min
xidlehook --timer 900 'systemctl suspend' '' &
