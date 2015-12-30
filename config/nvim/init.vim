"
" PLUGINS
"
call plug#begin('~/.config/nvim/plugged')
Plug 'tmux-plugins/vim-tmux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'lyuts/vim-rtags'
Plug 'gustafj/vim-ttcn'
Plug 'scrooloose/nerdcommenter'
Plug 'dbakker/vim-projectroot'
call plug#end()

"
" GENERALS
"
"
set hidden
syntax on
set shiftwidth=4
set shiftround
set autoindent
set smartindent

set t_Co=256
hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
"
" KEY BINDINGS
"

let mapleader="\<Space>"

nnoremap <silent> <Leader>fe :so $MYVIMRC<CR> 
nnoremap ; :
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
"
" PLUGINS
"

"" Airline
nnoremap <Leader>p :Unite -start-insert file_rec<CR>
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='distinguished'

"" Unite
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"call unite#filters#sorter_default#useter_length'])
call unite#custom#profile('default', 'context', {
    \   'start_insert': 1,
    \   'winheight': 10,
    \   'direction': 'botright',
    \   'prompt': '→ ',
    \   'prompt_direction': 'top',
   \    'no_resize': 1,
    \ })

function! Unite_projectroot()
    execute ':Unite -start-insert file_rec/async:'.ProjectRootGuess().'/'
endfunction

let g:unite_source_rec_async_command = 
    \ ['ag', '--follow', '--nocolor', '--nogroup',
    \ '--hidden', '--ignore-dir', 'bin', '-g', '']

"nnoremap <Leader>pf :call Unite_projectroot()<CR>
"nnoremap <Leader>pb :Unite -start-insert buffer<CR>
highlight NonText ctermfg=0

"
" CTRLP
"
"
nnoremap <Leader>bo :CtrlP<CR>
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>br :CtrlPMRUFiles<CR>
let g:ctrlp_lazy_update = 250
let g:ctrlp_max_files = 60000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.?(git|svn|bin)$',
    \ 'file': '\v\.(o|zip|so|a|gz|java|py)$'
    \}

hi CtrlPLinePre ctermfg=8
hi CtrlPNoEntries ctermbg=NONE
hi CtrlPMatch ctermfg=2
