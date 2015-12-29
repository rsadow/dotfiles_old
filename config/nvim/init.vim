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
Plug 'lyuts/vim-rtags'
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
"let g:airline_powerline_fonts=1
"let g:airline_left_sep=''
"let g:airline_right_sep=''


"" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_length'])
call unite#custom#profile('default', 'context', {
    \   'start_insert': 1,
    \   'winheight': 20,
    \   'direction': 'botright',
    \   'prompt': '❯ ',
    \   'prompt_direction': 'top',
    \ })
nnoremap <Leader>p :Unite -start-insert file_rec/neovim<CR>
nnoremap <Leader>b :Unite -start-insert buffer<CR>
highlight NonText ctermfg=4
