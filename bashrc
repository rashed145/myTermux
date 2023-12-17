[[ $- = *i* ]] ||return
case $TERM in
        xterm*|rxvt*) PROMPT_COMMAND='printf "\e]2;${PWD//$HOME/\~}\a"' ;;
        *) ;;
esac

alias o=xdg-open
alias n=nano
alias c=clear
alias md='mkdir -pv'
alias cp='cp -urv'
alias rm='rm -rv'
alias mv='mv -v'
alias l=ls
alias ll='ls --time-style="+%m/%d|%H:%M" -lGghL --si'
alias la='l -A'
alias lla='ll -A'
alias g='grep --color=auto'
alias f=find
alias -- -='cd -'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias h=history
alias rh='history -c; history -w'
alias hs='h|g'
alias pst='pstree -TalhpCage'
alias upp='apt update'
alias upd='upp && yes|apt dist-upgrade'
alias ins='apt install'
alias del='apt autopurge'
alias ec="n '$BASH_SOURCE'; . $BASH_SOURCE"

shopt -s autocd xpg_echo

mdd() { [ $# -ne 0 ] && md "$@" && cd "$_"; }
calc() { awk "BEGIN { print $@ }"; }
t() (
	f="${1:-.}"
	[ -d "$f" ] && f=`realpath -L "$f"`||exit 1
	cd "${f%/*}"
	find "${f##*/}"|sed "s@[^-][^\/]*\/@| @g; s@| \([^|]\)@|-\1@"
)
updb() (
	cd ${PREFIX}/..
	find -L "$PWD" -name Android -prune -o -name '.thumb*' -prune -o -name .cache -prune -o -type d -printf '%p\n' > ~/.cddb
)

PROMPT_COMMAND="${PROMPT_COMMAND}${PROMPT_COMMAND:+;}history -a; history -n"
HISTTIMEFORMAT="(%d/%m/%y|%R) "
CDPATH=".:$PREFIX:$EXTERNAL_STORAGE"
PTMFMT=""

bind "set bell-style visible"
bind "set colored-completion-prefix on"
bind "set colored-stats on"
bind "set history-preserve-point on"
bind "set mark-symlinked-directories on"
bind "set menu-complete-display-prefix on"
bind "set page-completions off"
bind "set revert-all-at-newline on"
bind "set show-all-if-ambiguous on"
bind "set skip-completed-text on"
bind '"\t": menu-complete'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

fcd() {
	[ -s ~/.cddb ]||updb
	cd "/data/data/com.termux/files$(sed 's@^.*/com.termux/files@@g; /^\s*$/d' ~/.cddb|pick)" &>/dev/null||updb
}

bind '"\eq": "\C-ex\C-u fcd\C-m\C-y\C-b\C-d"'
bind '"\ea":"\C-acd \C-j"'

[ -r ~/.config/bash/themes/polus.bash-theme ] && . ~/.config/bash/themes/polus.bash-theme
