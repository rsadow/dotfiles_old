"
" PLUGINS
"
call plug#begin('~/.config/nvim/plugged')
Plug 'tmux-plugins/vim-tmux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
"Plug 'szw/vim-ctrlspace'
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

"set encoding=utf-8
set t_Co=256
"
" KEY BINDINGS
"
"
"
" PLUGINS

let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
