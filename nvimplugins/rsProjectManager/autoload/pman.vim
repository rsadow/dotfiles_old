if (exists('autoloaded_pman') && autoloaded_pman)
    "finish
endif

let autoloaded_pman = 1

function! s:lash()
    return '/'
endfunction

function! pman#init()
    let uHome = $HOME . s:lash()
    let cHome = exists('$XDG_CAHE_HOME') ? $XDG_CAHE_HOME : uHome . '.cache'
    
    let pmanCache = cHome . s:lash() . 'pman'
    return pmanCache    
endfunction

function! pman#write_cache()
    
endfunction

