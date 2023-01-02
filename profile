#!/usr/bin/bash

export LESSHISTFILE=-
export GREP_COLORS="mt=1;38;5;16;48;5;49:fn=38;5;197"
export LESS=-R
export EDITOR="nano"

[ -d ~/bin ] && PATH=/data/data/com.termux/files/usr/bin:~/bin

ulimit -u 2500
eval "$(dircolors -b)"
