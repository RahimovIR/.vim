set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"for python
Bundle 'davidhalter/jedi-vim'
"colors
Bundle 'rainux/vim-desert-warm-256'
Bundle 'vim-scripts/candycode.vim'
Bundle 'jonathanfilip/vim-lucius'
"syntax
Bundle 'hdima/python-syntax'
""
Bundle 'tpope/vim-surround'

filetype plugin indent on 

let mapleader=","

syntax enable
set t_Co=256
set background=dark
"set background=light
colorscheme lucius

let python_highlight_all = 1

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position

" Search as you type.
set incsearch

" Ignore case when searching.
set ignorecase

" Show editing mode
set showmode

" Enable CursorLine
set cursorline
