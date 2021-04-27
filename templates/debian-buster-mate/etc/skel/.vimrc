set nocompatible
syntax on
filetype off
filetype plugin indent on

set is
set ic
set smartcase
nnoremap / /\v
vnoremap / /\v
set hidden
set encoding=utf-8
set bg=dark
set scrolloff=3

autocmd InsertEnter * set cursorline cursorcolumn
autocmd InsertLeave * set nocursorline nocursorcolumn
highlight cursorline cterm=none ctermfg=7 ctermbg=4
highlight cursorcolumn cterm=none ctermfg=7 ctermbg=4
