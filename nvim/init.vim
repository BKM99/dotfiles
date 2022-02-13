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
Plug 'abecodes/tabout.nvim'

" Make Stuff Pretty
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'McAuleyPenney/tidy.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'

" Colorschemes
Plug 'sainnhe/gruvbox-material'

" Files Management
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " This is to install fzf binary
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ibhagwan/fzf-lua'

" Other
Plug 'dstein64/vim-startuptime'
Plug 'lewis6991/impatient.nvim'

call plug#end()

lua require "impatient"
lua require "user.keymaps"
lua require "user.treesitter"
lua require "user.lualine"
lua require "user.autocommands"
lua require "user.indent"
lua require "user.fzf"
lua require "user.cmp"
lua require "user.nvim-tree"
lua require "user.lsp"
lua require "user.autopairs"
lua require "user.comment"
lua require "user.tabout"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" Colors
set background=dark
colorscheme gruvbox-material
syntax on

" Settings
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

" Spaces and Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent
