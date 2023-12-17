# default programs
export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=kitty

# default home directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# bin directories
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_STATE_HOME/zsh_history"
export SAVEHIST=1000000000 # number of commands in history file
export HISTSIZE=1000000000 # number of commands loaded into memory from history file

export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export CALCHISTFILE="$XDG_STATE_HOME/calc_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
