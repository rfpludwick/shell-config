#!/usr/bin/env bash

echo Removing old Bash configuration...

rm ~/.bash_aliases ~/.bash_exports ~/.bash_logout ~/.bash_profile ~/.bashrc ~/.vimrc 2> /dev/null

echo Installing new Bash configuration...

ln -snf ~/.bash-config/bash_aliases ~/.bash_aliases
ln -snf ~/.bash-config/bash_exports ~/.bash_exports
ln -snf ~/.bash-config/bash_logout ~/.bash_logout
ln -snf ~/.bash-config/bash_profile ~/.bash_profile
ln -snf ~/.bash-config/vimrc ~/.vimrc
ln -snf ~/.bash_profile ~/.bashrc

echo Sourcing...

source ~/.bashrc

echo Done
