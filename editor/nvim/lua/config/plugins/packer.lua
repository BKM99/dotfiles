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
	max_jobs = 10,
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
	use("glepnir/lspsaga.nvim")
	use({ "mfussenegger/nvim-jdtls", ft = { "java" } })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })
	use("simrat39/symbols-outline.nvim")
	use("b0o/SchemaStore.nvim")

	-- Autocomplete
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("mfussenegger/nvim-dap-python")
	use("leoluz/nvim-dap-go")
	use("jbyuki/one-small-step-for-vimkind")

	-- Testing
	use({
		"vim-test/vim-test",
		setup = function()
			vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })
			vim.cmd([[
                let test#strategy = "neovim"
            ]])
		end,
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-neotest/neotest-python",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-vim-test",
			"rouge8/neotest-rust",
		},
	})

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("TimUntersberger/neogit")
	use("sindrets/diffview.nvim")
	use({
		"f-person/git-blame.nvim",
		setup = function()
			vim.g.gitblame_enabled = false
		end,
		cmd = "GitBlameToggle",
	})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-dap.nvim")

	-- UI Stuff
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
	use({ "mbbill/undotree", cmd = "UndotreeToggle" })
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Editing Support
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")
	use("nacro90/numb.nvim")
	use("chaoren/vim-wordmotion")
	use("wellle/targets.vim")

	-- Note taking (Markdown)
	use({ "jakewvincent/mkdnflow.nvim", ft = { "markdown" } })
	use({ "mickael-menu/zk-nvim", ft = { "markdown" } })
	use({ "AckslD/nvim-FeMaco.lua", commit = "a51b4fc94ee5a8714170272d256ec0abaa5bf32c", cmd = "FeMaco" })
	use({ "preservim/vim-markdown", ft = { "markdown" } })
	use({ "dhruvasagar/vim-table-mode", ft = { "markdown" } })
	use({ "mzlogin/vim-markdown-toc", ft = { "markdown" } })
	use({ "dkarter/bullets.vim", ft = { "markdown" } })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		cmd = "MarkdownPreview",
	})

	-- Better Performance
	use("lewis6991/impatient.nvim")
	use({
		"antoinemadec/FixCursorHold.nvim",
		run = function()
			vim.g.curshold_updatime = 100
		end,
	})

	-- Other Plugins
	use({ "phaazon/hop.nvim", branch = "v2" })
	use("ThePrimeagen/harpoon")
	use({
		"tversteeg/registers.nvim",
		setup = function()
			vim.g.registers_window_border = "rounded"
		end,
	})

	-- Colorschemes
	use("RRethy/nvim-base16")
	-- use("Mofiqul/vscode.nvim")
	-- use("yazeed1s/minimal.nvim")
	-- use "sainnhe/everforest"
	-- use "ishan9299/nvim-solarized-lua"
	-- use "rose-pine/neovim"
	-- use "LunarVim/Colorschemes"
	-- use("folke/tokyonight.nvim")
	-- use "catppuccin/nvim"
	-- use("EdenEast/nightfox.nvim")
	-- use("rebelot/kanagawa.nvim")
	-- use "flazz/vim-colorschemes"
	-- use "navarasu/onedark.nvim"
	-- use "olimorris/onedarkpro.nvim"
	-- use "w0ng/vim-hybrid"
	-- use "NLKNguyen/papercolor-theme"
	-- use ("NTBBloodbath/doom-one.nvim")
	-- use("shaunsingh/nord.nvim")
	-- use("arcticicestudio/nord-vim")
	-- use("rmehri01/onenord.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		print("Installing plugins, restart neovim after.")
		require("packer").sync()
	end
end)
