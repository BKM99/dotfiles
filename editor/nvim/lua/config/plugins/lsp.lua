return {
	{ "jose-elias-alvarez/null-ls.nvim", event = "BufReadPre" },
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
}
