if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls -alhF --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
elif [ $(uname) = 'Darwin' ]; then
	alias ls='ls -alhFG'
else
	alias ls='ls -alhF'
fi

alias rebash='source ~/.bashrc; clear'
alias base='clear; cd ~'

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
