#!/bin/bash

if [[ $- != *i* ]] ; then
        return
fi

# fish as an interactive shell
if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]] ; then
	exec fish
fi
