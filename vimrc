" Setup {{{
" ======

    if !exists('s:loaded_my_vimrc')                " don't reset twice on reloading

        set nocompatible                           " enable vim features

        set backupdir=$HOME/.cache/vim/backup      " where to put backup file 
        set backup                                 " make backup file and leave it around 
        set backupskip+=svn-commit.tmp,svn-commit.[0-9]*.tmp

        set directory=/tmp                         " where to put swap file
        let g:SESSION_DIR   = $HOME.'/.cache/vim/sessions'

        " Create system vim dirs
        if finddir(&backupdir) == ''
            silent call mkdir(&backupdir, "p")
        endif

        if finddir(g:SESSION_DIR) == ''
            silent call mkdir(g:SESSION_DIR, "p")
        endif

        " Pathogen load
        filetype off

        call pathogen#infect()
        call pathogen#helptags()

        filetype plugin indent on
        syntax on

    endif

" }}}

let mapleader = ","
source ~/.vim/fun.vim
set t_Co=256
colorscheme delek


" Options {{{
" =======

    " Buffer options
    set hidden                  " hide buffers when they are abandoned
    set autoread                " auto reload changed files
    set autowrite               " automatically save before commands like :next and :make

    " Display options
    set title                   " show file name in window title
    set visualbell              " mute error bell
    set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,eol:$,nbsp:~
    set linebreak               " break lines by words
    set winminheight=0          " minimal window height
    set winminwidth=0           " minimal window width
    set scrolloff=4             " min 4 symbols bellow cursor
    set sidescroll=4
    set sidescrolloff=10
    set showcmd                 " Show commands
    set whichwrap=b,s,<,>,[,],l,h
    set completeopt=menu,preview
    set infercase
    set nojoinspaces
    set laststatus=2            " Always show a statusline

    " Tab options
    set autoindent              " copy indent from previous line
    set smartindent             " enable nice indent
    set expandtab               " tab with spaces
    set smarttab                " indent using shiftwidth"
    set shiftwidth=4            " number of spaces to use for each step of indent
    set softtabstop=4           " tab like 4 spaces
    set shiftround              " drop unused spaces

    " Backup and swap files
    set history=400             " history length
    set viminfo+=h              " save history
    set ssop-=blank             " dont save blank vindow
    set ssop-=options           " dont save options

    " Search options
    set hlsearch                " Highlight search results
    set ignorecase              " Ignore case in search patterns
    set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
    set incsearch               " While typing a search command, show where the pattern

    " Matching characters
    set showmatch               " Show matching brackets
    set matchpairs+=<:>         " Make < and > match as well

    " Localization
    set langmenu=none            " Always use english menu
    set keymap=russian-jcukenwin " Alternative keymap
    set iminsert=0               " English by default
    set imsearch=-1              " Search keymap from insert mode
    set spelllang=en,ru          " Languages
    set encoding=utf-8           " Default encoding
    set fileencodings=utf-8,cp1251,koi8-r,cp866
    set termencoding=utf-8

    " Tab completion in command line mode
    set wildmenu                " use wildmenu ...
    set wildmode=full
    set wildcharm=<TAB>
    set wildignore=*.pyc,*.pdf  " ignore file pattern

    " Undo
    if has('persistent_undo')
        set undofile            " enable persistent undo
        set undodir=/tmp/       " store undofiles in a tmp dir
    endif

    " Folding
    if has('folding')
        set foldmethod=marker   " Fold on marker
        set foldlevel=999       " High default so folds are shown to start
    endif

    " Edit
    set backspace=indent,eol,start " Allow backspace to remove indents, newlines and old tex"
    set virtualedit=all         " on virtualedit for all mode
    set nrformats=              " dont use octal and hex in number operations

    set confirm
    set numberwidth=1              " Keep line numbers small if it's shown

    set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" }}}

" Autocommands {{{
" =============

    if has("autocmd")

        augroup vimrc
        au!

            " Highlight insert mode
            au InsertEnter * set cursorline
            au InsertLeave * set nocursorline

            " New file templates
            au BufNewFile * silent! call fun#load_template()

            " Autosave last session
            if has('mksession')
                au VimLeavePre * exe "mks! " g:SESSION_DIR.'/last.session'
            endif

            " Save current open file when window focus is lost
            au FocusLost * if &modifiable && &modified | write | endif

            " Filetypes {{{
            " ---------

                au BufNewFile,BufRead *.json setf javascript
                au BufNewFile,BufRead *.py setl colorcolumn=80

            " }}}

            " Auto close preview window
            autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
            autocmd InsertLeave * if pumvisible() == 0|pclose|endif


        augroup END

    endif

" }}}

" Plugins setup {{{
" ==============

    " Pymode
    let g:pymode_lint_hold = 0
    let g:pymode_lint_write = 0
    let g:pymode_syntax_builtin_objs = 0
    let g:pymode_syntax_builtin_funcs = 0
    let g:pymode_rope_goto_def_newwin = "new"
    let g:pymode_syntax_builtin_funcs = 1
    let g:pymode_syntax_print_as_function = 1
    let g:pymode_lint_mccabe_complexity = 10
    let g:pymode_lint_checker = "pylint,pep8,pyflakes,mccabe,pep257"
    let g:pymode_options_other = 1
    let g:pymode_run_key = 'R'
    let pymode_folding = 0
    let g:pymode_rope = 0

    " SimpylFold
    let g:SimpylFold_docstring_preview = 1

    " NERDCommenter
    let NERDRemoveExtraSpaces = 1
    let NERDSpaceDelims = 1

    " Airline
    let g:airline_detect_iminsert = 1
    let g:airline_exclude_preview = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_theme = 'wombat'

    " Startify
    let g:startify_bookmarks = [ '~/.vimrc', '/var/log/syslog', '/var/log/' ]

" }}}

" Hot keys {{{
" ==========

    " Normal mode {{{
    " ------------

        " Gundo mapping
        nnoremap <F5> :GundoToggle<CR>

        " Nice scrolling if line wrap
        noremap j gj
        noremap k gk

        " Switch folding in current line
        noremap <space> za

        " Toggle paste mode
        noremap <silent> ,p :set invpaste<CR>:set paste?<CR>

        " Not jump on star, only highlight
        nnoremap * *N

        " Drop hightlight search result
        noremap <leader><space> :nohls<CR>

        " Fast scrool
        nnoremap <C-e> 3<C-e>
        nnoremap <C-y> 3<C-y>

        " Select all
        map vA ggVG

        " Close cwindow
        nnoremap <silent> <leader>ll :ccl<CR>

        " Quickfix fast navigation
        nnoremap <silent> <leader>nn :cwindow<CR>:cn<CR>
        nnoremap <silent> <leader>pp :cwindow<CR>:cp<CR>

        " Window commands
        nnoremap <silent> <leader>h :wincmd h<CR>
        nnoremap <silent> <leader>j :wincmd j<CR>
        nnoremap <silent> <leader>k :wincmd k<CR>
        nnoremap <silent> <leader>l :wincmd l<CR>
        nnoremap <silent> <leader>+ :wincmd +<CR>
        nnoremap <silent> <leader>- :wincmd -<CR>
        nnoremap <silent> <leader>cj :wincmd j<CR>:close<CR>
        nnoremap <silent> <leader>ck :wincmd k<CR>:close<CR>
        nnoremap <silent> <leader>ch :wincmd h<CR>:close<CR>
        nnoremap <silent> <leader>cl :wincmd l<CR>:close<CR>
        nnoremap <silent> <leader>cw :close<CR>

        " Buffer commands
        noremap <silent> <leader>bp :bp<CR>
        noremap <silent> <leader>bn :bn<CR>
        noremap <silent> <leader>ww :w<CR>
        noremap <silent> <leader>bd :bd<CR>
        noremap <silent> <leader>ls :Bufferlist<CR>

        " Keymap switch <C-F>
        " cnoremap <silent> <C-F> <C-^>
        inoremap <silent> <C-F> <C-^>
        nnoremap <silent> <C-F> a<C-^><Esc>
        vnoremap <silent> <C-F> <Esc>a<C-^><Esc>gv

        " Session UI
        nnoremap <Leader>ss :SSave<CR>
        nnoremap <Leader>sr :SLoad<CR>
        nnoremap <Leader>sl :SLoad last.session<CR>

        " Show syntax highlighting groups for word under cursor
        nmap <C-S-P> :call <SID>SynStack()<CR>
        function! <SID>SynStack()
            if !exists("*synstack")
                return
            endif
            echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc

    " }}}
    
    " Command mode {{{
    " ------------

        " Allow command line editing like emacs
        cnoremap <C-A>      <Home>
        cnoremap <C-E>      <End>
        cnoremap <C-N>      <Down>
        cnoremap <C-P>      <Up>

        " Write as sudo
        command! W %!sudo tee > /dev/null %

    " }}}

    " Visual mode {{{
    " ------------

    vnoremap <space> zf

    " }}}

" }}}

