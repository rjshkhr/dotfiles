#!/bin/bash

if xrandr -q | grep "HDMI-1 connected"; then # check if external monitor exists
	xrandr --output LVDS-1 --mode 1366x768 --rotate normal --output HDMI-1 --primary --mode 1920x1080 --rotate normal --left-of LVDS-1 &
fi

wal -R &           # wallpaper
nm-applet &        # network manager applet
picom &            # compositor
dunst &            # notification
greenclip daemon & # clipboard
