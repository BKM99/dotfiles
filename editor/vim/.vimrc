let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'chriskempson/base16-vim'
call plug#end()

set relativenumber
set number
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent
set incsearch
set ignorecase
set smartcase
set gdefault
set backspace=indent,eol,start
set noswapfile
set encoding=UTF-8
set number
set mouse=a
set nowrap
set noshowmode
set scrolloff=6
set hidden
set lazyredraw
set timeoutlen=300
set laststatus=2
set clipboard=unnamed
set showmode
set completeopt=menu,menuone,noinsert,noselect
set updatetime=300
set background=dark
syntax on
set termguicolors
set signcolumn=yes
set nobackup
set nowritebackup

let mapleader = "\<Space>"

nnoremap <leader>w :w<CR>

nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap j gj
nnoremap k gk

nnoremap <leader><leader> <c-^>

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
