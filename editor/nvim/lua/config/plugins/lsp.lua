return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			require("config.lsp")
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "b0o/SchemaStore.nvim" },
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	{ "folke/neodev.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim", event = "BufReadPre" },
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
