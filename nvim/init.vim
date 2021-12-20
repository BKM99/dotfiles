" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim/'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'justinmk/vim-sneak'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'jiangmiao/auto-pairs'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

call plug#end()

lua require "impatient"
lua require "user.keymaps"
lua require "user.treesitter"
lua require "user.lualine" 
lua require "user.autocommands"
lua require "user.indent"
lua require "user.fzf"
lua require "user.cmp"
lua require "user.lsp"

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent

" Color/Theme setup
colorscheme tokyonight
let g:tokyonight_style = "storm"
set background=dark
syntax on
set termguicolors

" Proper search
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
set completeopt=menu,menuone,noinsert,noselect
set cmdheight=2
set updatetime=300
set undodir=~/.vimUndoDir
set undofile