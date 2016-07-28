if (exists('autoloaded_pman') && autoloaded_pman)
    "finish
endif

if !has('python')
    finish
endif

let autoloaded_pman = 1

function! s:lash()
    return '/'
endfunction

function! pman#init()
    let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    echom s:path
    " pyfile parser.py
endfunction

" function! pman#init()
"     let uHome = $HOME . s:lash()
"     let cHome = exists('$XDG_CAHE_HOME') ? $XDG_CAHE_HOME : uHome . '.cache'
"     
"     let pmanCache = cHome . s:lash() . 'pman'
"     return pmanCache    
" endfunction

