set shell=/bin/bash

" ====================
" PLUGINS
" ====================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'               
Plug 'tpope/vim-surround'                
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
""Plug 'w0rp/ale'                       
call plug#end()

" ====================
" EDITOR Settings
" ====================
set nocompatible
set encoding=utf-8
set scrolloff=999
set modifiable
set number

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

" ====================
" GUI Settings
" ====================
set laststatus=2


" Ale Plugin
" ==========
"let g:ale_fixers = { 'javascript': ['prettier-standard'] }
"let g:ale_fix_on_save =  1
