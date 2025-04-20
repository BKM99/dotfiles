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
nnoremap <leader>f :find *

" Better up/down movement with wrapped lines
nnoremap <silent> <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <silent> <expr> j v:count == 0 ? 'gj' : 'j'

" Faster window navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" Quickfix navigation
nnoremap <silent> [q :cprevious<CR>zz
nnoremap <silent> ]q :cnext<CR>zz

" Buffer navigation
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>

" Resize windows with Alt + arrows
nnoremap <A-Up>    :resize +2<CR>
nnoremap <A-Down>  :resize -2<CR>
nnoremap <A-Left>  :vertical resize -2<CR>
nnoremap <A-Right> :vertical resize +2<CR>

" Switch between last two buffers
nnoremap <silent> <space><space> <C-^>

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Delete to black hole register
xnoremap p "_dP
xnoremap P "_dP
nnoremap x "_x

" Center cursor after movements
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Clear search highlight
nnoremap <Esc> :nohlsearch<CR>
