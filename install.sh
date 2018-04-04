#!/usr/bin/env bash

echo Removing old Bash configuration...

rm $HOME/.bash_aliases $HOME/.bash_exports $HOME/.bash_logout $HOME/.bash_profile $HOME/.bashrc 2> /dev/null

echo Installing new Bash configuration...

ln -snf $HOME/.bash-config/bash_aliases $HOME/.bash_aliases
ln -snf $HOME/.bash-config/bash_exports $HOME/.bash_exports
ln -snf $HOME/.bash-config/bash_logout $HOME/.bash_logout
ln -snf $HOME/.bash-config/bash_profile $HOME/.bash_profile
ln -snf $HOME/.bash_profile $HOME/.bashrc

echo Sourcing...

source $HOME/.bashrc

echo Done
