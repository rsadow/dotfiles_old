"
" PLUGINS
"
call plug#begin('~/.config/nvim/plugged')
Plug 'tmux-plugins/vim-tmux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'lyuts/vim-rtags'
Plug 'gustafj/vim-ttcn'
"Plug 'scrooloose/nerdcommenter'
Plug 'dbakker/vim-projectroot'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cocopon/iceberg.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'altercation/vim-colors-solarized'
Plug 'freeo/vim-kalisi'
" Plug 'bbchung/clighter'
Plug 'bbchung/Clamp'
" Plug 'mhinz/vim-signify'
call plug#end()

" FUNCTIONS = {{

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
au BufRead,BufNewFile *.ttcn3 setf ttcn

" }}

" GENERALS = {{
"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set hidden
syntax on
set shiftwidth=4
set shiftround
set autoindent
set smartindent
set t_Co=256
set background=dark
colorscheme gruvbox
"" }}

"" COLORS = {{

hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
" hi NonText ctermfg=0

" }}


" KEY BINDINGS = {{

let mapleader="\<Space>"
nnoremap ; :
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
" }}
"

" PLUGINS = {{

"" Airline = {
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
let g:airline_theme='gruvbox'

"" }

"" Unite = {

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
let g:unite_redraw_hold_candidates = 20000
call unite#custom#source('file_rec/neovim', 'matchers',
    \ ['converter_relative_word', 'matcher_fuzyy'])
let g:unite_source_rec_async_command = 
    \ ['ag', '--follow', '--nocolor', '--nogroup',
    \ '--hidden', '--ignore-dir', 'bin', '-g', '']

"" }


" CTRLP = {

nnoremap <Leader>pf :CtrlP<CR>
nnoremap <Leader>pb :CtrlPBuffer<CR>
nnoremap <Leader>pr :CtrlPMRUFiles<CR>
"let g:ctrlp_lazy_update = 250
let g:ctrlp_max_files = 60000
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.?(git|svn|bin)$',
    \ 'file': '\v\.(o|zip|so|a|gz|java|py)$'
    \}

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore bin
      \ --ignore "**/*.java"
      \ -g "" '

hi CtrlPLinePre ctermfg=8
hi CtrlPNoEntries ctermbg=NONE

"" }

"" Ag = {
let g:ag_working_path_mode="r"

""}

let g:gruvbox_contrast_dark="medium"

" }}
"
"
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:gruvbox_italicize_strings=1
let g:cpp_class_scope_highlight=1
let g:gruvbox_italicize_comments=1
highlight Comment cterm=italic
