" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim/'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync
            \| endif

call plug#begin('~/.config/nvim/autoload/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'onsails/lspkind-nvim'
Plug 'mfussenegger/nvim-jdtls'

" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippets (need snippets for cmp to work)
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" Better Coding Experience
Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-fugitive'

" Make Stuff Pretty
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'McAuleyPenney/tidy.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'

" Colorschemes
Plug 'chriskempson/base16-vim'

" Files Management
Plug 'airblade/vim-rooter'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'

" Other
Plug 'lewis6991/impatient.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

lua require "impatient"
lua require "user.keymaps"
lua require "user.treesitter"
lua require "user.lualine"
lua require "user.autocommands"
lua require "user.indent"
lua require "user.cmp"
lua require "user.nvim-tree"
lua require "user.autopairs"
lua require "user.comment"
lua require "user.lsp"

" Colors
set termguicolors
colorscheme base16-gruvbox-dark-hard
syntax on
set background=dark
highlight Comment guifg=#7f7f7f " make comments more visible

" Settings
filetype plugin indent on
set incsearch
set ignorecase
set smartcase
set gdefault
set backspace=indent,eol,start
set noswapfile
set encoding=utf-8
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
set cursorline
set clipboard=unnamedplus
set signcolumn=yes
set nobackup
set nowritebackup
set shortmess+=c
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent
