[[ "$-" = *i* ]] ||return
case "$TERM" in
        xterm*|rxvt*) PROMPT_COMMAND='printf "\e]2;${PWD//$HOME/\~}\007"' ;;
        *) ;;
esac

f() {
        find ${@:2} -mindepth 1 -name "*$1*"
}

fcat() {
        [ -d ${1:-.} ] && find -L $1 -mindepth 1 -name Android -prune -o -name '.thumb*' -prune -o -name .git -prune -o -type f -print|fzf -0|xargs -d '\n' -L1 -r cat
}

cd() {
        builtin cd $@ && ls 2>/dev/null
}

fcd() {
        [ -d ${1:-.} ] && local d="$(find -L $1 -mindepth 1 -name Android -prune -o -name '.thumb*' -prune -o -name .git -prune -o -type d -print|fzf -0)"||return 1
        test -d "$d" && cd ${@:2} "$d"||return 0
}

alias n='nano'
alias c=clear
alias md='mkdir -p'
alias cp='cp -r'
alias rm='rm -r'
alias l='ls'
alias ll='ls --time-style="+%m/%d|%H:%M" -lGghL --si'
alias la='l -A'
alias lla='ll -A'
alias grep='grep --color=auto'
alias g='grep'
alias -- -='cd - 2>/dev/null'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias h='history'
alias rh='history -c; history -w'
alias hs='h|g'
alias t='tree'

shopt -s autocd xpg_echo

PROMPT_COMMAND="${PROMPT_COMMAND}${PROMPT_COMMAND:+;}history -a; history -n"
HISTTIMEFORMAT="(%d/%m/%y|%R)=>"

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

[ -r ~/.bash_themes/polus.bash_theme ] && . ~/.bash_themes/polus.bash_theme
