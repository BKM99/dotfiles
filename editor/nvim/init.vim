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
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/todo-comments.nvim'

" Colorschemes
Plug 'chriskempson/base16-vim'

" Files Management
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'

" Other
Plug 'lewis6991/impatient.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

lua require "impatient"
lua require "user.treesitter"
lua require "user.lualine"
lua require "user.autocommands"
lua require "user.indent"
lua require "user.cmp"
lua require "user.nvim-tree"
lua require "user.autopairs"
lua require "user.comment"
lua require "user.null-ls"
lua require "user.lsp"
lua require "user.lspsaga"
lua require "user.gitsigns"
lua require "user.todo-comments"
lua require "user.options"
lua require "user.colorscheme"
lua require "user.keymaps"
