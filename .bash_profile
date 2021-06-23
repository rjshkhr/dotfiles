#!/bin/sh

# default programs
export EDITOR="nvim"
export FMANAGER="ranger"
export READER="zathura"

if command -v alacritty &> /dev/null
then
        export TERMINAL="alacritty"
elif command -v urxvt &> /dev/null
then
        export TERMINAL="urxvt"
elif command -v xterm &> /dev/null
then
        export TERMINAL="xterm"
fi

# default home directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# bin directory
export PATH=$PATH:$HOME/.local/bin

# clean home

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# less history
export LESSHISTFILE=-

# gtk2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# X
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$HOME/.config/X11/xauthority"

# nodejs
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# npm
export npm_config_prefix="$HOME/.local"

# startx at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx ~/.config/X11/xinitrc; fi

# run bashrc
if [[ -f ~/.bashrc ]] ; then
        . ~/.bashrc
fi
