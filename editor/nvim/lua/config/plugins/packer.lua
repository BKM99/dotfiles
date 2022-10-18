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
	-- Plugin manager
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
	use("folke/trouble.nvim")

	-- Language specific
	use("ray-x/go.nvim")
	use("mfussenegger/nvim-jdtls")
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
	use("vim-test/vim-test")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- Git
	use("TimUntersberger/neogit")
	use("lewis6991/gitsigns.nvim")
	use("sindrets/diffview.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-dap.nvim")

	-- Database
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	-- Better UI
	use("folke/todo-comments.nvim")
	use("stevearc/dressing.nvim")
	use("akinsho/bufferline.nvim")
	use("mbbill/undotree")
	use("lukas-reineke/indent-blankline.nvim")
	use("NvChad/nvim-colorizer.lua")
	use({ "kyazdani42/nvim-tree.lua", tag = "nightly" })
	use("nvim-lualine/lualine.nvim")
	use("p00f/nvim-ts-rainbow")

	-- Editing Support
	use("tpope/vim-repeat")
	use({ "danymat/neogen", tag = "*" })
	use("gbprod/substitute.nvim")
	use({ "kylechui/nvim-surround", tag = "*" })
	use("wellle/targets.vim")
	use("windwp/nvim-autopairs")
	use("junegunn/vim-easy-align")
	use("andymass/vim-matchup")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	use("nacro90/numb.nvim")
	use("monaqa/dial.nvim")
	use({
		"tpope/vim-sleuth",
		setup = function()
			vim.g.sleuth_automatic = 0
		end,
	})
	use("abecodes/tabout.nvim")

	-- Note taking (Markdown)
	use("jghauser/follow-md-links.nvim")
	use("mickael-menu/zk-nvim")
	use("AckslD/nvim-FeMaco.lua")
	use("dhruvasagar/vim-table-mode")
	use("mzlogin/vim-markdown-toc")
	use("dkarter/bullets.vim")
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

	-- Better Performance
	use("lewis6991/impatient.nvim")

	-- Other Plugins
	use("airblade/vim-rooter")
    use("AckslD/nvim-neoclip.lua")
	use("editorconfig/editorconfig-vim")
	use("karb94/neoscroll.nvim")

	-- Colorschemes
	-- use("RRethy/nvim-base16")
	use("folke/tokyonight.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		print("Installing plugins, restart neovim after.")
		require("packer").sync()
	end
end)
