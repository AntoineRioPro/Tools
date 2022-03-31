# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d ~/afs/bin ] ; then
	export PATH=~/afs/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

export LANG=en_US.utf8
export NNTPSERVER="news.epita.fr"

export EDITOR=vim
#export EDITOR=emacs

# Color support for less
#export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
#export LESS_TERMCAP_me=$'\E[0m'           # end mode
#export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#ALIAS:
alias ls='ls --color=auto'
alias grep='grep --color -n'
alias submit='~/afs/.submission.sh'
alias gtree='git ls-tree -r master --name-only'
alias compile='gcc -Wextra -Wall -Werror -std=c99 -pedantic -g'
alias gtest='gcc -Wextra -Wall -Werror -std=c99 -pedantic -lcriterion'
alias mkd='~/afs/.mkd.sh'
alias createclang='~/afs/.create-clang.sh'
alias clion='nix-shell -p jetbrains.clion --run clion'
alias vscode='nix-shell -p vscode-fhs --run code'
PS1=">\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\\\[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\]]: \[$(tput sgr0)\]"

LS_COLORS=$LS_COLORS:'di=0;96'
LS_COLORS=$LS_COLORS:'*Makefile=0;33'
LS_COLORS=$LS_COLORS:'ln=0,96'
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"
