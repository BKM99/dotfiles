local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd([[
   augroup packer_user_config
   autocmd!
   autocmd BufWritePost packer.lua source <afile> | PackerSync
   augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	snapshot_path = fn.stdpath("config") .. "/snapshots",
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("glepnir/lspsaga.nvim")
	use("mfussenegger/nvim-jdtls")
	use("simrat39/rust-tools.nvim")
	use("RRethy/vim-illuminate")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Autocomplete
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")

	-- Snippets needed for cmp
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets") -- a bunch of useful snippets

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- Treesitter
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")
	use("nvim-treesitter/nvim-treesitter")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- UI Stuff
	use("akinsho/bufferline.nvim")
	use("NvChad/nvim-colorizer.lua")

	-- Note taking
	use({
		"nvim-neorg/neorg",
		requires = "nvim-lua/plenary.nvim",
	})
	use({
		run = "cd app && npm install",
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
	})

	-- Other Plugins
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
		},
	})
	use("abecodes/tabout.nvim")
	use("ThePrimeagen/harpoon")
	use("lewis6991/impatient.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("numToStr/Comment.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use({
		"antoinemadec/FixCursorHold.nvim",
		run = function()
			vim.g.curshold_updatime = 100
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	-- Colorschemes
	--[[ use "RRethy/nvim-base16" ]]
	--[[ use "sainnhe/everforest" ]]
	--[[ use "ishan9299/nvim-solarized-lua" ]]
	--[[ use "chriskempson/base16-vim" ]]
	--[[ use "rose-pine/neovim" ]]
	--[[ use "LunarVim/Colorschemes" ]]
	--[[ use "folke/tokyonight.nvim" ]]
	--[[ use "catppuccin/nvim" ]]
	--[[ use "EdenEast/nightfox.nvim" ]]
	use("rebelot/kanagawa.nvim")
	--[[ use "flazz/vim-colorschemes" ]]
	--[[ use "navarasu/onedark.nvim" ]]
	--[[ use "olimorris/onedarkpro.nvim" ]]
	--[[ use "w0ng/vim-hybrid" ]]
	--[[ use "NLKNguyen/papercolor-theme" ]]
	--[[ use ("NTBBloodbath/doom-one.nvim") ]]
	--[[ use ("shaunsingh/nord.nvim") ]]

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
