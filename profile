export LESSHISTFILE=-
export GREP_COLORS="mt=1;38;5;16;48;5;49:fn=38;5;197"
export LESS=-R
export EDITOR="nano"
export LESS_TERMCAP_mb=$'\E[1;35m'
export LESS_TERMCAP_md=$'\E[1;38;5;47;100m'
export LESS_TERMCAP_me=$'\E[m'
export LESS_TERMCAP_se=$'\E[m'
export LESS_TERMCAP_ue=$'\E[m'
export LESS_TERMCAP_so=$'\E[1;7;33m'
export LESS_TERMCAP_us=$'\E[3;96m'

[ -d ~/bin ] && PATH=/data/data/com.termux/files/usr/bin:~/bin

eval "$(dircolors -b)"
