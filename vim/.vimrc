set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let s:bootstrap = 0
try
        call vundle#begin()
catch /E117:/
        let s:bootstrap = 1
        silent !mkdir -p ~/.vim/bundle
        silent !unset GIT_DIR && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        redraw!
        call vundle#begin()
endtry
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ... other plugins
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
if s:bootstrap
        silent PluginInstall
        quit
end
filetype plugin indent on    " required

" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on               " enable syntax processing
colorscheme dracula
set t_Co=256
set background=dark
set number              " show line numbers
set mouse+=a            " A necessary evil, mouse support
set linebreak           " Have lines wrap instead of continue off-screen
set noshowmode
set laststatus=2
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
set noswapfile

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered

" Key Binds"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "       " leader is space
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>Q :q!<CR>
