set encoding=utf-8
scriptencoding utf-8

execute pathogen#infect()

call pathogen#helptags()

set number
set hlsearch
set laststatus=2
set noswapfile
set noshowmode
set list
set splitright
set tabpagemax=100

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set autoindent

" Yank to register
set clipboard=unnamedplus
set mouse=a

syntax enable
filetype plugin indent on
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'gitbranch': 'FugitiveHead',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_quiet_messages = { "type": "style" }

let g:gitgutter_max_signs = 600

" PHP Code Sniffer
let g:syntastic_php_checkers = ["php", "phpcs"]
let g:syntastic_php_phpcs_args = '--standard=PSR2 -p'

" Tell Syntastic to use eslint
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_eslint_exe = "$(npm bin)/eslint"
" Ensure jscs outputs all errors instead of stopping after a certain number
let g:syntastic_javascript_jscs_args = '--max-errors -1'
" Tell Syntastic to aggregate errors from both of the checkers
" let g:syntastic_aggregate_errors = 1

" Yaml Linting
let g:syntastic_yaml_checkers = ["yamllint"]

" Python Linting
let g:syntastic_python_checkers = ['pylint']

" Tagbar Configuration
let g:tagbar_usearrows = 1
noremap <C-l> : TagbarToggle<CR>

" VIM's Title string
autocmd BufEnter * let &titlestring = ' [' . expand("%:p") . '] '
set title

" Fuzzy Finder for VIM
set rtp+=~/.fzf

" Open ctags in tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>"

" vim_markdown_preview
let vim_markdown_preview_github=1

" ctrlP Configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux"

" Set indentation for specific filetype
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" NERDTree Config
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

set wildmenu         " Make the command-line completion better
set wildmode=list:longest " Make the command-line completion show a list
set ignorecase
set smartcase
