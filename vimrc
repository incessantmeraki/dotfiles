set shell=/bin/bash

" ====================
" PLUGINS
" ====================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'               
Plug 'tpope/vim-surround'                
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
""Plug 'w0rp/ale'                       
call plug#end()

" ====================
" EDITOR Settings
" ====================
set nocompatible
set encoding=utf-8
set scrolloff=999
set modifiable
"
" Color scheme
set background=dark
colorscheme base16-atelier-dune
hi Normal ctermbg=NONE

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

" ====================
" GUI Settings
" ====================
set laststatus=2
"set statusline+=%F
"

" Ale Plugin
" ==========
"let g:ale_fixers = { 'javascript': ['prettier-standard'] }
"let g:ale_fix_on_save =  1

