#!/bin/sh

# default programs
export EDITOR="nvim"
export BROWSER="firefox"
export FMANAGER="ranger"
export READER="zathura"

if command -v st &> /dev/null
then
        export TERMINAL="st"
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
export PATH=$PATH:$HOME/.local/bin

# clean home
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE=-
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$HOME/.config/X11/xauthority"

# run bashrc
if [[ -f ~/.bashrc ]] ; then
        . ~/.bashrc
fi
