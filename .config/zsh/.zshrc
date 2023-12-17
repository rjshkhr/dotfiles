# aliases
if [ -e "$ZDOTDIR/aliasrc" ]; then
    source "$ZDOTDIR/aliasrc"
fi

# prompt
PROMPT="%B%F{black}%f%K{black} %F{cyan}  %1~%f %k%F{black}%f %F{red}󰁕%f%b  "
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst # enable substitution in prompt
RPROMPT='${vcs_info_msg_0_}'
zstyle ":vcs_info:*" check-for-changes true
zstyle ":vcs_info:*" unstagedstr " *"
zstyle ":vcs_info:*" stagedstr " 󱇬"
zstyle ":vcs_info:git:*" formats "%B%F{black}%f%K{black} %F{yellow} %b%F{magenta}%u%f%F{green}%c%f %k%F{black}%f"

# keybindings
bindkey -e # emacs keybinding
bindkey "${terminfo[kLFT5]}"  backward-word # control + left arrow
bindkey "${terminfo[kRIT5]}" forward-word # control + right arrow
bindkey '^[[A' up-line-or-search # up arrow
bindkey '^[[B' down-line-or-search # down arrow

# options
setopt autocd
setopt correctall # try to correct the spelling of all arguments in a line.
setopt nobeep # don't beep on an ambiguous completion
setopt nocaseglob # case insensitive globbing (filename generation)
setopt histignorealldups # history won't save duplicates
setopt histfindnodups # history won't show duplicates on search
setopt incappendhistory # immediately save commands to history, rather than waiting for shell to exit
setopt sharehistory # share history between all sessions
setopt histreduceblanks # removes blank lines from history

# tab completion
autoload -Uz compinit; compinit # initialize completion system
zstyle ":completion:*" menu select # with an arrow-key driven interface
_comp_options+=(globdots) # show hidden files in completion

# case insensitive path completion
zstyle ":completion:*" matcher-list "m:{[:lower:][:upper:]}={[:upper:][:lower:]}" "m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*" "m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*" "m:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*"

# plugins
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
