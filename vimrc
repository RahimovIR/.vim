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
    " Bundle 'davidhalter/jedi-vim'
    Bundle 'klen/python-mode'
    "colors
    Bundle 'rainux/vim-desert-warm-256'
    Bundle 'vim-scripts/candycode.vim'
    Bundle 'jonathanfilip/vim-lucius'
    "syntax
    Bundle 'hdima/python-syntax'

    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-repeat'
    Bundle 'tmhedberg/matchit'
    Bundle 'tmhedberg/SimpylFold'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'tpope/vim-commentary'
    Bundle 'scrooloose/syntastic'
    Bundle 'sandeepcr529/Buffet.vim'
    Bundle 'godlygeek/csapprox'
    Bundle 'scrooloose/nerdtree'
    Bundle 'kien/ctrlp.vim'
    Bundle 'yegappan/mru'
    Bundle 'tpope/vim-fugitive'

    filetype plugin indent on 
    syntax on
endif 

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


let mapleader=","
set number

set t_Co=256
set background=dark
" set background=light
silent! colorscheme lucius
"hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
hi MatchParen cterm=NONE ctermbg=234 ctermfg=NONE 

let python_highlight_all = 1

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<tab>"

let NERDTreeIgnore = ['\.pyc$']

map <F2> :Bufferlist<CR>
map <F3> :NERDTreeToggle<CR>

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$
    \ |migrations', 
    \ 'file': '\v\.(pyc|zip)$'
    \ }

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

noremap <space> za
let g:SimpylFold_docstring_preview = 1


"
hi MBENormal               ctermfg=251  ctermbg=fg  guifg=#808080   guibg=fg
hi MBEChanged              ctermfg=32   ctermbg=fg  guifg=#CD5907   guibg=fg
hi MBEVisibleNormal        ctermfg=132  ctermbg=fg  guifg=#5DC2D6   guibg=fg
hi MBEVisibleChanged       ctermfg=232  ctermbg=fg  guifg=#F1266F   guibg=fg
hi MBEVisibleActiveNormal  ctermfg=70   ctermbg=fg  guifg=#A6DB29   guibg=fg
hi MBEVisibleActiveChanged ctermfg=230  ctermbg=fg  guifg=#F1266F   guibg=fg

set noautowrite

if has("autocmd")

    augroup vimrc
    au!

        au! BufNewFile /etc/fw.start silent! 0r ~/.vim/template/fw.start

        au BufNewFile,BufRead *.json setf javascript
        au BufNewFile,BufRead *.py setl colorcolumn=80

        autocmd FileType vim setlocal foldmethod=marker

    augroup END

endif

let s:loaded_my_vimrc = 1

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
