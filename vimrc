set nocompatible

set number
set backspace=indent,eol,start
set history=1000
set showmode

syntax on

if (!empty(glob("$HOME/.vimrc_local")))
	source $HOME/.vimrc_local
endif
