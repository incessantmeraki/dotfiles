set shell=/bin/bash

" ====================
" PLUGINS
" ====================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-commentary'               
Plug 'tpope/vim-surround'                
Plug 'tpope/vim-fugitive'                
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ekalinin/Dockerfile.vim'

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


" ====================
" GUI Settings
" ====================
set laststatus=2


map <C-p> :Files<CR>
" Ale Plugin
" ==========
"let g:ale_fixers = { 'javascript': ['prettier-standard'] }
"let g:ale_fix_on_save =  1
"
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

"Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
inoremap <left> <nop>
