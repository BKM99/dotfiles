local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Install your plugins here
return packer.startup(function(use)

    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim"
    use "mfussenegger/nvim-jdtls"
    use "simrat39/rust-tools.nvim"
    use "simrat39/symbols-outline.nvim"
    use "RRethy/vim-illuminate"
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- Autocomplete
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- DAP
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "ravenxrz/DAPInstall.nvim"

    -- Snippets needed for cmp
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets" -- a bunch of useful snippets

    -- Git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- Treesitter
    use "windwp/nvim-ts-autotag"
    use "p00f/nvim-ts-rainbow"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "andymass/vim-matchup"
    use "lukas-reineke/indent-blankline.nvim"
    use "windwp/nvim-autopairs"
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Other Plugins
    use "lewis6991/impatient.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "numToStr/Comment.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "nvim-lua/popup.nvim"
    use {
        "antoinemadec/FixCursorHold.nvim",
        run = function()
            vim.g.curshold_updatime = 100
        end,
    }
    use {

        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- Colorschemes
    use "chriskempson/base16-vim"
    -- use "rose-pine/neovim"
    -- use "LunarVim/Colorschemes"
    -- use "folke/tokyonight.nvim"
    -- use "catppuccin/nvim"
    -- use "EdenEast/nightfox.nvim"
    -- use "rebelot/kanagawa.nvim"
    -- use "flazz/vim-colorschemes"


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
