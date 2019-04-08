set shell=/bin/bash
let mapleader = "\<Space>"

" ====================
" PLUGINS
" ====================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'               
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ekalinin/Dockerfile.vim'
Plug 'w0rp/ale'

call plug#end()

" ====================
" EDITOR Settings
" ====================
set nocompatible
set encoding=utf-8
set scrolloff=999
set modifiable
set number
set relativenumber

" Color scheme
let base16colorspace=256
set background=dark
hi Normal ctermbg=NONE
colorscheme base16-atelier-dune

"Enable syntax highlighting
syntax on

" Matching bracket highlight
set showmatch

" Use 2 spaces 
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

"display row and column
set ruler

"Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Ctrl+c and Ctrl+j as Esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

" Permanent undo
set undodir=~/.vimdid
set undofile

" Jump to start and end of line using the home row keys
map H ^
map L $

"Fuzzy searching for files
map <C-p> :Files<CR>

"Hot keys
nmap <leader>; :Buffers<CR>
nmap <leader>w :w<CR>
nnoremap <leader><leader> <c-^>
noremap <leader>s :Rg


"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>

" ====================
" GUI Settings
" ====================
set laststatus=2


if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" Ale Plugin
" ==========
"let g:ale_fixers = { 'javascript': ['prettier-standard'] }
"let g:ale_fix_on_save =  1
"

