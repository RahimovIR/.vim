"{{{
if !exists('s:loaded_my_vimrc') " don't reset twice on reloading 

    set nocompatible " enable vim features

    set backupdir=$HOME/.cache/vim/backup " where to put backup file
    set backup " make backup file and leave it around

    set directory=/tmp " where to put swap file
    let g:SESSION_DIR = $HOME.'/.cache/vim/sessions'

    if has('persistent_undo')
        set undodir=$HOME/.cache/vim/undo " where to put undo files
        set undofile " enable persistent undo
    endif

    " Create system vim dirs
    if finddir(&backupdir) == ''
        silent call mkdir(&backupdir, "p")
    endif

    if finddir(g:SESSION_DIR) == ''
        silent call mkdir(g:SESSION_DIR, "p")
    endif

    if finddir(&undodir) == ''
        silent call mkdir(&undodir, "p")
    endif

    " Vundle

    filetype off " required!

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

    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'vim-scripts/python_match.vim'
    Bundle 'tmhedberg/matchit'
    Bundle 'tmhedberg/SimpylFold'
    Bundle 'SirVer/ultisnips'
    Bundle 'tpope/vim-commentary'
    Bundle 'scrooloose/syntastic'

    filetype plugin indent on 
    syntax on
endif 
" }}}


let mapleader=","
set number

set t_Co=256
set background=dark
"set background=light
colorscheme lucius
"hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
hi MatchParen cterm=NONE ctermbg=234 ctermfg=NONE 

let python_highlight_all = 1

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:UltiSnipsEditSplit='vertical'

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

" Search options
set hlsearch " Highlight search results
set ignorecase " Ignore case in search patterns
set smartcase " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch " While typing a search command, show where the pattern

" Matching characters
set showmatch " Show matching brackets
set matchpairs+=<:> " Make < and > match as well

" Show editing mode
set showmode

" Enable CursorLine
set cursorline

if has("autocmd")

    augroup vimrc
    au!

        au! BufNewFile /etc/fw.start silent! 0r ~/.vim/template/fw.start

        " Autosave last session
        if has('mksession')
            au VimLeavePre * exe "mks! " g:SESSION_DIR.'/last.session'
        endif

        " Save current open file when window focus is lost
        au FocusLost * if &modifiable && &modified | write | endif


        au BufNewFile,BufRead *.json setf javascript
        au BufNewFile,BufRead *.py setl colorcolumn=80

        autocmd FileType vim setlocal foldmethod=marker

    augroup END

endif

noremap <space> za
let g:SimpylFold_docstring_preview = 1

let s:loaded_my_vimrc = 1
