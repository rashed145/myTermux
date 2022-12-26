f() {
        find ${@:2} -mindepth 1 -name "*$1*"
}

cf() {
        [ -d "${1:-$PWD}" ] || { echo No such Dir.; return 1; }
        total_f=$(find $1 -mindepth 1 -type f -printf '.' | wc -c)
        total_d=$(find $1 -mindepth 1 -type d -printf '.' | wc -c)
        total_l=$(find $1 -mindepth 1 -type l -printf '.' | wc -c)
        echo -e "\e[1m${1:-$PWD}\e[0m\nFILES: $total_f\nDIRS: $total_d\nLINKS: $total_l"
}

cd() {
        builtin cd $@ && ls 2>/dev/null
}

alias n='nano -Seiqx -T4'
alias c=clear
alias md='mkdir -p'
alias cp='cp -r'
alias rm='rm -r'
alias l='ls --color=auto'
alias ll='l -l'
alias la='l -A'
alias lla='la -l'
alias grep='grep --color=auto'
alias g='grep'
alias -- -='cd - 2>/dev/null'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias h='history'
alias rh='history -c; history -w'
alias hs='h|g'
alias t=tree

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

source ~/.bash_themes/polus.bash_theme
