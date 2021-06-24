#!/bin/bash

if [[ $- != *i* ]] ; then
        return
fi

if [ -e ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

export HISTSIZE=50000

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

export PS1="\[\e[34m\]\[\e[m\]\[\e[44m\] \[\e[m\]\[\e[01;44m\]\u\[\e[m\]\[\e[44m\] \[\e[m\]\[\e[34;40m\]\[\e[m\]\[\e[37;40m\] \[\e[m\]\[\e[01;40m\]\w\[\e[m\]\[\e[40m\] \[\e[m\]\[\e[30m\]\[\e[m\] "

if [ -e /usr/share/fzf/key-bindings.bash ]; then
source /usr/share/fzf/key-bindings.bash
fi

export FZF_DEFAULT_OPTS='
--color fg:-1,bg:-1,hl:4,fg+:15,bg+:8,hl+:12
--color pointer:1,info:8,spinner:8,header:8,prompt:2,marker:3
'
