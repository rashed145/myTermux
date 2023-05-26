#!/usr/bin/bash

export LESSHISTFILE=-
export GREP_COLORS="mt=1;38;5;16;48;5;49:fn=38;5;197"
export LESS=-R
export EDITOR="nano"
export LESS_TERMCAP_mb=$'\e[1;34m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[m'
export LESS_TERMCAP_se=$'\e[m'
export LESS_TERMCAP_ue=$'\e[m'
export LESS_TERMCAP_so=$'\e[1;7;35m'
export LESS_TERMCAP_us=$'\e[1;40m'

[ -d ~/bin ] && PATH=/data/data/com.termux/files/usr/bin:~/bin

ulimit -u 2500
eval "$(dircolors -b)"
