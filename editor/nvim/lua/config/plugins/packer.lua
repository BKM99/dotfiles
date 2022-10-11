local fn = vim.fn

local ensure_packer = function()
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd(
	{ "BufWritePost" },
	{ pattern = "packer.lua", command = "source <afile> | PackerSync", group = packer_grp }
)

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
	max_jobs = 15,
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- A Bunch of Plugins use these
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "mfussenegger/nvim-jdtls", ft = "java" })
	use("b0o/SchemaStore.nvim")
	use("folke/trouble.nvim")

	-- Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
	})

	-- DAP
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},
	})

	-- Testing
	use({
		"vim-test/vim-test",
		setup = function()
			vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })
			vim.cmd([[let test#strategy = "neovim"]])
		end,
	})

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-dap.nvim")

	-- UI Stuff
	use("akinsho/bufferline.nvim")
	use({
		"mbbill/undotree",
		setup = function()
			vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { noremap = true, silent = true })
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
	use("nvim-lualine/lualine.nvim")

	-- Editing Support
	use("gbprod/substitute.nvim")
	use("windwp/nvim-autopairs")
	use("andymass/vim-matchup")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	use("monaqa/dial.nvim")
	use({
		"nmac427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	})

	-- Note taking (Markdown)
	use({
		"jghauser/follow-md-links.nvim",
		setup = function()
			vim.keymap.set("n", "<bs>", ":edit #<cr>", { noremap = true, silent = true })
		end,
		ft = { "markdown" },
	})
	use({ "mickael-menu/zk-nvim", ft = { "markdown" } })
	use({
		"AckslD/nvim-FeMaco.lua",
		config = function()
			require("femaco").setup()
		end,
		cmd = "FeMaco",
	})
	use({ "dhruvasagar/vim-table-mode", ft = { "markdown" } })
	use({ "mzlogin/vim-markdown-toc", ft = { "markdown" } })
	use({ "dkarter/bullets.vim", ft = { "markdown" } })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Faster movements
	use("ggandor/leap.nvim") -- I like using this for the "sneak" functionality
	use({ "phaazon/hop.nvim", branch = "v2" }) -- I like using this to remap f,F,t,T
	use("ThePrimeagen/harpoon")

	-- Better Performance
	use("lewis6991/impatient.nvim")

	-- Other Plugins
	use({
		"airblade/vim-rooter",
		config = function()
			vim.g.rooter_silent_chdir = 1
		end,
	})
	use("tversteeg/registers.nvim")
	use("editorconfig/editorconfig-vim")
	use({
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
		ft = "go",
	})

	-- Colorschemes
	-- use("RRethy/nvim-base16")
	use("folke/tokyonight.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		print("Installing plugins, restart neovim after.")
		require("packer").sync()
	end
end)
