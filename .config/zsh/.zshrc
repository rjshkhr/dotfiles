# zsh aliases
if [ -e "$ZDOTDIR/aliases" ]; then
    source "$ZDOTDIR/aliases"
fi

# enable emacs keybinding
bindkey -e

# enable autocompletion
autoload -Uz compinit; compinit
_comp_options+=(globdots) # with hidden files
zstyle ':completion:*' menu select # with an arrow-key driven interface

# history won't save duplicates
setopt HIST_IGNORE_ALL_DUPS

# history won't show duplicates on search
setopt HIST_FIND_NO_DUPS

# zsh prompt
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL="➜ "
prompt pure

# keybindings
typeset -g -A key

# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# ctrl+left and ctrl+right mapping
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# exit shell on partial command line
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

autoload -Uz add-zsh-hook

function reset_broken_terminal () {
    printf '%b' '\e[0m\e(B\e)0\017\e[?5l\e7\e[0;0r\e8'
}

zstyle ':autocomplete:*' default-context history-incremental-search-backward

add-zsh-hook -Uz precmd reset_broken_terminal

# plugins
source "/usr/share/zsh/plugins/zsh-autopair/autopair.zsh"
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh/plugins/zsh-autoswitch-virtualenv/zsh-autoswitch-virtualenv.plugin.zsh"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/share/doc/pkgfile/command-not-found.zsh"
