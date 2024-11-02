#!/bin/bash

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# default programs
export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='kitty'

# home directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export CALCHISTFILE="$XDG_STATE_HOME/calc_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export GOPATH="$XDG_DATA_HOME/go"

# bin directories
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"
export PATH="$PATH:$GOPATH"

# aliases
alias grep='grep --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME'
alias ls='lsd'
alias la='lsd -A'
alias ll='lsd -Al'
alias ka='killall'
alias rm='rm -r'
alias s='sudo'
alias c='clear'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias gcl='git clone'
alias ga='git add'
alias gbr='git branch'
alias gpl='git pull'
alias gph='git push'
alias gcm='git commit -m'
alias gco='git checkout'
alias gdf='git diff'
alias glg='git log'
alias gs='git status'
alias pn='pnpm'

# prompt
function parse_git_dirty {
	[[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}

function parse_git_branch {
	git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\[\033[34m\]\w\[\033[33m\]\$(parse_git_branch) \[\033[31m\] \[\033[00m\]"

# enable case-insensitive tab completion
bind 'set completion-ignore-case on'

# enable menu-style autocompletion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# change directories without typing cd
shopt -s autocd

# pywal shell variables ($color0 - $color15)
. ~/.cache/wal/colors.sh

# pywal colors in TTY
. ~/.cache/wal/colors-tty.sh

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# fnm
eval "$(fnm env --use-on-cd)"

# history
HISTSIZE=-1
HISTFILESIZE=-1
