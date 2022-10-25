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

	-- Better Performance
	use("lewis6991/impatient.nvim")

	-- A Bunch of Plugins use these
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- LSP
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- Language specific
	use({ "mfussenegger/nvim-jdtls", ft = "java" })
	use("b0o/SchemaStore.nvim")

	-- Autocomplete and Snippets
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
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},
	})

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Quickfix list
	use({
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf").setup({
				preview = {
					auto_preview = false,
				},
			})
		end,
	})
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- Project
	use({
		"notjedi/nvim-rooter.lua",
		config = function()
			require("nvim-rooter").setup()
		end,
	})

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Better UI
	use("stevearc/dressing.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "kyazdani42/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" }, tag = "nightly" })
	use("lukas-reineke/indent-blankline.nvim")
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
	use({
		"mbbill/undotree",
		setup = function()
			vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	})
	use("NvChad/nvim-colorizer.lua")

	-- Editing Support
	use("ggandor/leap.nvim")
	use("gbprod/substitute.nvim")
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
	use("wellle/targets.vim")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	use("abecodes/tabout.nvim")

	-- Note taking
	use({ "dhruvasagar/vim-table-mode", ft = "markdown" })
	use({ "dkarter/bullets.vim", ft = { "markdown", "text", "gitcommit" } })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = { "markdown" },
	})

	-- Colorschemes
	-- use("RRethy/nvim-base16")
	use("folke/tokyonight.nvim")
	-- use("ChristianChiarulli/nvcode-color-schemes.vim")
	-- use("projekt0n/github-nvim-theme")
	-- use("kvrohit/rasmus.nvim")
	-- use("yazeed1s/minimal.nvim")
	-- use("Mofiqul/adwaita.nvim")
	-- use("ishan9299/nvim-solarized-lua")

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
