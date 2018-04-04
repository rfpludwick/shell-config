set nocompatible

set number
set backspace=indent,eol,start
set history=1000
set showmode

syntax on

if (!empty(glob("~/.vimrc_local")))
	source ~/.vimrc_local
endif
