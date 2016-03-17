" PLUGINS {{{
"
let rsPlug = "~/.dotfiles/nvimplugins"

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tmux-plugins/vim-tmux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
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
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'altercation/vim-colors-solarized'
Plug 'juneedahamed/vc.vim'
Plug 'vim-scripts/vcscommand.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-reload'
" Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-vim'
Plug 'Raimondi/delimitMate'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'kana/vim-vspec'
Plug 'lfilho/cosco.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-visual-star-search'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug  '~/.dotfiles/nvimplugins/rsCppSyntax'
Plug  '~/.dotfiles/nvimplugins/rsProjectManager'
" Plug 'vim-scripts/Mark'
" Plug 'vim-scripts/Quich-Filter'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
" Plug 'bbchung/clighter'
" Plug 'bbchung/Clamp'
Plug 'mhinz/vim-signify'
call plug#end()
" }}}

" GENERALS

" FUNCTIONS {{{

map <F3> :echo "hi<" . 
    \ synIDattr(synID(line("."),col("."),1),"name") . 
    \'> trans<' . synIDattr(synID(line("."),col("."),0),"name") . 
    \"> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . 
    \">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

function! GetProjectFolderRoot()
    return split(getcwd(), '/')[-1]
endfunction

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
au BufRead,BufNewFile *.ttcn3 setf ttcn
au FileType ttcn set tabstop=4|set shiftwidth=4|set expandtab
au FileType vim setlocal foldmethod=marker
au BufEnter * sign define dummy
au BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
au FileType text setlocal spell spelllang=en_us

" }}}
"
" GENERALS {{{
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[2 q"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set clipboard=unnamedplus
set ttyfast
set hidden
set scrolloff=3
set shiftwidth=4
set tabstop=4
set expandtab
set shiftround
set autoindent
set smartindent
" set number
" set relativenumber
set cino=N-s,g0
set noswapfile
set completeopt=longest,menuone

set fillchars+=vert:\ 
set t_Co=256
set background=dark
syntax on
colorscheme gruvbox
"" }}}

" COLORS {{{

hi link cCustomFunc GruvboxBlue
hi link cCustomclass GruvboxBlueBold
hi link cppSTLfunction GruvboxBlue
hi link Typedef GruvboxPurple
hi link cCppString GruvboxAqua
hi link cString GruvboxAqua
hi link ttcnString GruvboxAqua
hi link shDoubleQuote GruvboxAqua
hi link shSingleQuote GruvboxAqua
hi link ttcnString GruvboxAqua
hi clear SignColumn
hi SignColumn guibg=#282828
hi VertSplit guibg=NONE
hi LineNr guifg=#504945 guibg=none
hi SpellBad guifg=#fb4934 gui=none
" hi CursorLine cterm=NONE ctermbg=234 ctermfg=NONE
" hi NonText ctermfg=0

" }}}

" KEY BINDINGS = {{{

let mapleader="\<Space>"
nnoremap ; :
nnoremap <Leader>; :call cosco#commaOrSemiColon()<CR> 

" inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR> 
nnoremap <Leader>wv <c-w>v
nnoremap <Leader>wh <c-w>s
nnoremap <Leader>ww <c-w>ww
nnoremap <Leader>wo <c-w>o
nnoremap <Leader>wq <c-w>q
nnoremap <Leader>wk <c-w>k
nnoremap <Leader>wj <c-w>j
nnoremap <Leader>wl <c-w>l
nnoremap <Leader>wh <c-w>h
nnoremap <silent> <Esc><Esc> :let @/=""<CR>
vnoremap <Leader>[ <gv
vnoremap <Leader>] >gv
nnoremap <Leader>[ <<
nnoremap <Leader>] >>
nnoremap <Leader>o o<ESC>k
nnoremap <Leader>O O<ESC>j
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <leader>r. SignifyToggle
nnoremap <leader>rh SignifyToggleHighlight
nnoremap <leader>rr SignifyRefresh
nnoremap <leader>rd SignifyDebug

" hunk jumping
nmap <leader>rj <plug>(signify-next-hunk)
nmap <leader>rk <plug>(signify-prev-hunk)
" }}}


"" PLUGINS

" Plugin: Airline = {{{
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
let g:airline#extensions#branch#use_vcscommand=0
let g:airline_section_y = '' 
let g:airline_section_c = "%{expand('%:t')}%m [%{GetProjectFolderRoot()}]"
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = '•'
" }}}

" Plugin: Unite = {{{

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

"" }}}

" Plugin: CTRLP {{{

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
      \ -g "" '
let g:ctrlp_line_prefix = ' '
" }}}

" Plugin: Ag = {{{
let g:ag_prg='ag --vimgrep'
nnoremap <Leader>/ :Ag <cword><CR>
let g:ag_highlight=1

" }}}

" Plugin: Gruvbox {{{
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_italicize_strings=1
let g:cpp_class_scope_highlight=1
let g:gruvbox_italicize_comments=1 
let g:gruvbox_sign_column='bg0'
set t_ZH=^[[3m
set t_ZR=^[[23m
" }}}

" Plugin: vim-reload {{{

let g:reload_on_write=0

" }}}

" Plugin: ProjectRoot {{{
function! <SID>AutoProjectRootCD()
    try
	if &ft != 'help'
	    ProjectRootCD
	endif
    catch
    endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()
" }}}

" Plugin: deoplete {{{
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#enable_at_startup = 1
"}}}

" Plugin: delimitMate {{{
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
" }}}

" Plugin: startify {{{
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
"" }}}

" Plugin:: NERDTree {{{
let g:NERDTreeWinSize=45
map <C-n> :NERDTreeToggle<CR>

" }}}

" Plugin: vim-signify {{{
let g:signify_disable_by_default = 1
let g:signify_vcs_list = ['svn']

" }}}
"


let g:ycm_error_symbol = '•'
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'ttcn': 1}
let g:ycm_open_loclist_on_ycm_diags = 0
let g:ycm_collect_identifiers_from_tags_files = 1
" highlight YcmErrorSection guibg=none guifg=none gui=none

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>



" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd VimEnter,ColorScheme * call s:update_fzf_colors()
augroup END
