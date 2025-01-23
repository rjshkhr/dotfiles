#!/bin/bash

# Source ~/.xinitrc if it exists
if [ -f "$HOME/.config/x11/xinitrc" ]; then
    source "$HOME/.config/x11/xinitrc"
fi
