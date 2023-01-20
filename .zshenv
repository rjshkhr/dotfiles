# default programs
export EDITOR="nvim"
export FMANAGER="ranger"
export READER="zathura"

if command -v alacritty &> /dev/null; then
    export TERMINAL="alacritty"
elif command -v urxvt &> /dev/null; then
    export TERMINAL="urxvt"
elif command -v xterm &> /dev/null; then
    export TERMINAL="xterm"
fi

# default home directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# bin directory
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"

# clean home

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=10000
export SAVEHIST=10000

# gnupg
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# less history
export LESSHISTFILE=-

# gtk2
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# x
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# nodejs
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# cargo
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# zoom
export SSB_HOME="$XDG_DATA_HOME/zoom"

# golang
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
