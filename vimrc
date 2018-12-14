" Basic Configuration
" ====================
set nocompatible
syntax on
set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set scrolloff=999
set encoding=utf-8
set ruler
set incsearch
set ignorecase
set showmatch
set laststatus=2
set statusline+=%F

" Plugins
" ==========
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'               " Add comments in blocks
Plug 'tpope/vim-surround'                 " Enable inserting brackets around words
""Plug 'w0rp/ale'                           " Asynchronous linting engine
call plug#end()
