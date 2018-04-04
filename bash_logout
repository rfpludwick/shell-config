if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

if [ -f ~/.bash_logout_local ]; then
    . ~/.bash_logout_local
fi
