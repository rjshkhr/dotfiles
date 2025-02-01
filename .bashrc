# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default programs
export EDITOR='nvim'

# Aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias mkdir='mkdir -p'
alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -alF --color=auto'
alias ka='killall'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -ri'
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

# Home directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Bin directories
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

parse_git_status() {
    local status=$(git status --porcelain 2> /dev/null)
    if [[ -n $status ]]; then
        echo "*"
    fi
}

BLUE="\[\033[34m\]"
MAGENTA="\[\033[35m\]"
GREEN="\[\033[32m\]"
YELLOW="\[\033[33m\]"
RED="\[\033[31m\]"
RESET="\[\033[00m\]"

DIRECTORY="$MAGENTA\w"
GIT_BRANCH='$(parse_git_branch)'
GIT_STATUS='$(parse_git_status)'

# Prompt
PS1="${DIRECTORY}${YELLOW}${GIT_BRANCH}${RED}${GIT_STATUS}${RESET} ${BLUE}${RESET} "

# Case-insensitive tab completion
bind 'set completion-ignore-case on'

# Change directories without typing cd
shopt -s autocd

# Show options on first tab
bind "set show-all-if-ambiguous on"

# Fnm
eval "$(fnm env --use-on-cd)"

# Infinte history
HISTSIZE=-1
HISTFILESIZE=-1

# Don't save duplicate commands or commands starting with space
HISTCONTROL=ignoreboth

# Create and cd into directory
mkcd() { mkdir -p "$1" && cd "$1"; }

# Color stats in completion
bind "set colored-stats on"

export QT_QPA_PLATFORMTHEME=gtk2
