export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR=nvim
export BROWSER=brave
export TERMINAL=urxvt

export HISTSIZE=1000000
export SAVEHIST=1000000
HISTFILE="$XDG_DATA_HOME/zsh/history"
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space

export FZF_DEFAULT_OPTS="
  --height 40% --layout=reverse --border
  --color=bg:#1D2326,bg+:#242B2D,fg:#CED3DC,fg+:#E6E7E6
  --color=hl:#7E9AAB,hl+:#94B1C4,info:#839C98,border:#485457
  --color=prompt:#96B088,pointer:#BC8F7D,marker:#CCAC7D
  --color=spinner:#A68CAA,header:#839C98"

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias vim='nvim'
alias v='nvim'

bindkey -e
setopt autocd

autoload -U compinit
compinit -C
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' rehash true

PROMPT='%F{cyan}%1~%f '

eval "$(fnm env --use-on-cd --shell zsh)"

source <(fzf --zsh)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#485457'
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
