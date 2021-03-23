#!/bin/bash

if [[ $- != *i* ]] ; then
        return
fi

if [ -e ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

source /usr/share/fzf/key-bindings.bash
