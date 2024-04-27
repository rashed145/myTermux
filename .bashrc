[[ $- = *i* ]] ||return
case $TERM in
        xterm*|rxvt*) PROMPT_COMMAND='printf "\e]2;${PWD//$HOME/\~}\a"' ;;
        *) ;;
esac

shopt -s autocd xpg_echo
[ -r ~/.aliases ] && . ~/.aliases

mdd() { [ $# -ne 0 ] && md "$@" && cd "$_"; }
calc() { awk "BEGIN { print $@ }"; }
t() ( f="${1:-.}";[ -d "$f" ] && f=`realpath -L "$f"`||exit 1;cd "${f%/*}";find "${f##*/}"|sed "s@[^-][^\/]*\/@| @g; s@| \([^|]\)@|-\1@"; )
updb() ( cd ${PREFIX}/..;find -L "$PWD" -name Android -prune -o -name '.thumb*' -prune -o -name .cache -prune -o -type d -printf '%p\n' > ~/.cddb; )
fcd() { [ -s ~/.cddb ]||updb;cd "/data/data/com.termux/files$(sed 's@^.*/com.termux/files@@g; /^\s*$/d' ~/.cddb|pick)" &>/dev/null||updb; }
clr() { for i in {0..255}; do printf "\e[48;5;%dm  \e[m\e[38;5;%dm%03d\e[m " $i $i $i; (((i-15)%6==0)) && echo; done; }

bind '"\eq": "\C-ex\C-u fcd\C-m\C-y\C-b\C-d"'
bind '"\ea":"\C-acd \C-j"'

PROMPT_COMMAND="${PROMPT_COMMAND}${PROMPT_COMMAND:+;}history -a; history -n"
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
bind "set show-all-if-unmodified on"
bind "set skip-completed-text on"
bind '"\t": menu-complete'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

ulimit -u 250

[ -r ~/.config/bash/themes/theme.sh ] && . ~/.config/bash/themes/theme.sh
