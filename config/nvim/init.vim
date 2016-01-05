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
Plug 'dbakker/vim-projectroot'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'cocopon/iceberg.vim'
Plug 'jdkanani/vim-material-theme'
"Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'altercation/vim-colors-solarized'
Plug 'juneedahamed/vc.vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-vim'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
" Plug 'bbchung/clighter'
" Plug 'bbchung/Clamp'
" Plug 'mhinz/vim-signify'
call plug#end()

" FUNCTIONS = {:{
" let g:python3_host_prog = '/opt/python/x86_64/3.4.1/bin/python3'
function! GetProjectFolderRoot()
    return split(getcwd(), '/')[-1]
endfunction

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
au BufRead,BufNewFile *.ttcn3 setf ttcn

" }}

" GENERALS = {{
"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set hidden
syntax on
set shiftwidth=4
set shiftround
set autoindent
set smartindent
set number
set t_Co=256
set background=dark
colorscheme gruvbox
set fillchars+=vert:\ 
"" }}

"" COLORS = {{

" hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
" hi NonText ctermfg=0

" }}


" KEY BINDINGS = {{

let mapleader="\<Space>"
nnoremap ; :
nnoremap <Leader>wv <c-w>v
nnoremap <Leader>wh <c-w>h
nnoremap <Leader>ww <c-w>ww
nnoremap <Leader>wo <c-w>o
nnoremap <Leader>wq <c-w>q
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
" }}
"

" PLUGINS = {{

"" Plugin: Airline = {
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
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#branch#use_vcscommand=1
let g:airline_section_y = '' 
let g:airline_section_c = "%{expand('%:t')}%m [%{GetProjectFolderRoot()}]" 
"" }

"" Plugin: Unite = {

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
"" Plugin: CTRLP {

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
      \ --ignore *.so*
      \ --ignore *.java
      \ -g "" '

hi CtrlPLinePre guifg=#282828 ctermbg=10
" hi CtrlPNoEntries ctermbg=NONE

"" }
"" Plugin: Ag = {
let g:ag_prg='ag --vimgrep 
    \ --ignore-dir CMakeFiles'
nnoremap <Leader>/ :Ag <cword><CR>
let g:ag_highlight=1
"" }
"" Plugin: Gruvbox {

let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italicize_strings=1
let g:cpp_class_scope_highlight=1
let g:gruvbox_italicize_comments=1 
"" }

"" Plugin: vim-reload {

let g:reload_on_write=0
"" }

"" Plugin:: ProjectRoot {
function! <SID>AutoProjectRootCD()
    try
	if &ft != 'help'
	    ProjectRootCD
	endif
    catch
    endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()
"" }

"" Plugin: deoplete {
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
"" }

"" Plugin: delimitMate {
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
"" }

"" Plugin: startify {
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    echon $columns
    return centered_lines
endfunction
let g:startify_change_to_dir = 0
let g:startify_list_order = [['   Recent files'],'files']
let g:startify_custom_header = s:filter_header([
\' _    __    _             ',
\'| |  / /   (_)   ____ ___ ',
\'| | / /   / /   / __ `__ \',
\'| |/ /   / /   / / / / / /',
\'|___/   /_/   /_/ /_/ /_/ ',
\'',
\'',
\])                          
"" }

" }}
