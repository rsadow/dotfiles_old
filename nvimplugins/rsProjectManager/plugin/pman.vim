if(exists('g:loaded_pman') && g:loaded_pman)
    finish
endif


" autocmd VimEnter * command! PRSetup call pman#init()
command! PRSetup call pman#init()
