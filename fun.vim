" Templates
fun! fun#load_template() "{{{
    let dir_tpl = $HOME . "/.vim/templates/"

    if exists("g:tpl_prefix")
        let dir_tpl = l:dir_tpl . g:tpl_prefix . "/"
    endif

    let template = ''

    let path = expand('%:p:~:gs?\\?/?')
    let path = strpart(l:path, len(fnamemodify(l:path, ':h:h:h')), len(l:path))
    let parts = split(l:path, '/')

    while len(l:parts) && !filereadable(l:template)
        let template = l:dir_tpl . join(l:parts, '/')
        let l:parts = l:parts[1:]
    endwhile

    if !filereadable(l:template)
        let l:template = l:dir_tpl . &ft
    endif

    if filereadable(l:template)
        exe "0r " . l:template
    endif
endfunction "}}}

