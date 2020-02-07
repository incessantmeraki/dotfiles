set shell=/bin/bash
let mapleader = "\<Space>"

" ====================
" PLUGINS
" ====================
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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

" Indentation and display
filetype plugin on
filetype indent on
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

"Always set status bar
set laststatus=2

"Grepping inside vim
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

"Enable autocomplete
let g:deoplete#enable_at_startup = 1

" Clipboard
" =========
set clipboard^=unnamed,unnamedplus
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" Language Server
" ==========
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
let g:LanguageClient_serverCommands = {
\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
\ 'javascript': ['javascript-typescript-stdio'],
\ 'typescript': ['javascript-typescript-stdio'],
\ 'typescript.tsx': ['javascript-typescript-stdio']
\ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
let g:LanguageClient_loggingLevel = 'DEBUG'


" ale Configs
" ==========
let g:ale_completion_enabled = 1         " Enable completion where enabled.
let g:ale_set_balloons = 1               " Highlight information on the fly.
let g:ale_set_highlights = 1             " Highlight code in file.
let g:ale_set_loclist = 0                " Don't use loclist.
let g:ale_lint_on_save = 1               " lint js.
let g:ale_fix_on_save = 1                " Auto fix js.
let g:ale_list_window_size = 5           " Shrink the suggestion window
let g:ale_completion_max_numbers = 20    " Max suggestions.
let g:airline#extensions#ale#enabled = 1
highlight ALEStyleWarning ctermfg=Black
highlight ALEStyleWarning ctermbg=Yellow
highlight ALEWarning ctermfg=Black
highlight ALEWarning ctermbg=Yellow
highlight ALEStyleError ctermfg=Black
highlight ALEStyleError ctermbg=Red
highlight ALEError ctermfg=Black
highlight ALEError ctermbg=Red
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"
let g:ale_linters = {
\   'typescript': ['tsserver', 'eslint'],
\   'javascript': ['standard'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'yaml': ['prettier'],
\   'html': ['prettier'],
\   'json': ['prettier'],
\   'typescript': ['prettier', 'eslint'],
\   'javascript': ['prettier-standard'],
\}
