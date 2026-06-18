export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR=nvim
export BROWSER=firefox
export TERMINAL=urxvt
export HISTSIZE=1000000
export SAVEHIST=1000000

HISTFILE="$XDG_DATA_HOME/zsh/history"

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias vim='nvim'
alias v='nvim'

bindkey -v
bindkey '^R' history-incremental-search-backward

setopt autocd
setopt share_history

autoload -U compinit
compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' rehash true

PROMPT='%F{cyan}%1~%f '

eval "$(fnm env --use-on-cd --shell zsh)"
