[[ "$-" = *i* ]] ||return
case "$TERM" in
        xterm*|rxvt*) PROMPT_COMMAND='printf "\e]2;${PWD//$HOME/\~}\007"' ;;
        *) ;;
esac

f() {
        find ${@:2} -mindepth 1 -name "*$1*"
}

cd() {
        builtin cd $@ && exa --icons -x 2>/dev/null
}

alias n='nano -Seiqx -T4'
alias c=clear
alias md='mkdir -p'
alias cp='cp -r'
alias rm='rm -r'
alias l='exa --icons -x'
alias ll='l -lh'
alias la='l -a'
alias lla='ll -a'
alias grep='grep --color=auto'
alias g='grep'
alias -- -='cd - 2>/dev/null'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias h='history'
alias rh='history -c; history -w'
alias hs='h|g'
alias t='l -T'

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
