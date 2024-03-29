set nocompatible
set number
set relativenumber

syntax enable
filetype plugin indent on
set hidden
set noswapfile
set mouse="a"
set clipboard=unnamed
set splitbelow
set splitright
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set nowrap
set wildmenu
set wildignorecase
set path+=**
set incsearch
set hlsearch
set laststatus=2

let mapleader = " "
" move faster between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-u> <C-u>zz
nnoremap <leader>f :find *
