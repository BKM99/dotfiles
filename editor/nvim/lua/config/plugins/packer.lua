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
	use({ "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } })

	-- A Bunch of Plugins use these
	use("kyazdani42/nvim-web-devicons")
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
		requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim")

	-- Language specific
	use({ "ray-x/go.nvim", ft = "go" })
	use({ "mfussenegger/nvim-jdtls", ft = "java" })
	use("b0o/SchemaStore.nvim")

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

	-- Debugging and Testing
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},
	})
	use({ "vim-test/vim-test", cmd = { "TestFile", "TestLast", "TestClass", "TestSuite", "TestVisit", "TestNearest" } })

	-- Snippets
	use({ "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets" } })

	-- Git
	use("TimUntersberger/neogit")
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Quickfix list
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	-- FZF
	use("junegunn/fzf.vim")
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-dap.nvim")

	-- Database
	use({
		"tpope/vim-dadbod",
		requires = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
	})

	-- Better UI
	use("stevearc/dressing.nvim")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")
	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/todo-comments.nvim")
	use("mbbill/undotree")
	use("NvChad/nvim-colorizer.lua")
	use("p00f/nvim-ts-rainbow")

	-- Editing Support
	use("tpope/vim-repeat")
	use({ "danymat/neogen", tag = "*", cmd = { "Neogen" } })
	use("gbprod/substitute.nvim")
	use({ "kylechui/nvim-surround", tag = "*" })
	use("wellle/targets.vim")
	use("chaoren/vim-wordmotion")
	use("windwp/nvim-autopairs")
	use("junegunn/vim-easy-align")
	use("andymass/vim-matchup")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	use("nacro90/numb.nvim")
	use("monaqa/dial.nvim")
	use("abecodes/tabout.nvim")
	use("linty-org/readline.nvim")

	-- Note taking (Markdown)
	use({ "jghauser/follow-md-links.nvim", ft = "markdown" })
	use({ "mickael-menu/zk-nvim", ft = "markdown" })
	use({ "AckslD/nvim-FeMaco.lua", cmd = { "FeMaco" } })
	use({ "dhruvasagar/vim-table-mode", ft = "markdown" })
	use({ "mzlogin/vim-markdown-toc", ft = "markdown" })
	use({ "dkarter/bullets.vim", ft = "markdown" })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Faster movements
	use("ggandor/leap.nvim")
	use({ "phaazon/hop.nvim", branch = "v2" })
	use("ThePrimeagen/harpoon")

	-- Other Plugins
	use("airblade/vim-rooter")
	use("AckslD/nvim-neoclip.lua")
	use("editorconfig/editorconfig-vim")

	-- Colorschemes
	use("RRethy/nvim-base16")
	-- use("folke/tokyonight.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
