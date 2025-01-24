# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Default programs
export EDITOR='nvim'
export VISUAL='nvim'
export TERMINAL='kitty'

# Home directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export HISTFILE="$XDG_STATE_HOME/bash/history"

# Bin directories
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/npm/bin"

# Use bat as a pager for man
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# Aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
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

# TTY colors
if [ "$TERM" = "linux" ]; then
	/bin/echo -e "
	\e]P0191724
	\e]P1eb6f92
	\e]P29ccfd8
	\e]P3f6c177
	\e]P431748f
	\e]P5c4a7e7
	\e]P6ebbcba
	\e]P7e0def4
	\e]P826233a
	\e]P9eb6f92
	\e]PA9ccfd8
	\e]PBf6c177
	\e]PC31748f
	\e]PDc4a7e7
	\e]PEebbcba
	\e]PFe0def4
	"
	# Get rid of artifacts
	clear
fi

# Prompt

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

parse_git_status() {
    local status=$(git status --porcelain 2> /dev/null)
    if [[ -n $status ]]; then
        echo "!"
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

PS1="${DIRECTORY}${YELLOW}${GIT_BRANCH}${RED}${GIT_STATUS}${RESET} ${BLUE}󰁕${RESET} "

# Git branch in prompt
PS1="\[\e]0;\w\a\]$PS1"

# Enable case-insensitive tab completion
bind 'set completion-ignore-case on'

# Enable menu-style autocompletion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Change directories without typing cd
shopt -s autocd

# Fnm
eval "$(fnm env --use-on-cd)"

# History
HISTSIZE=-1
HISTFILESIZE=-1
