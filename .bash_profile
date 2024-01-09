#!/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

# autostart X at login
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec startx
fi
