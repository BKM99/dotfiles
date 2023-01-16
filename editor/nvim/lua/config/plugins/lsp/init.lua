return {
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "b0o/SchemaStore.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.plugins.lsp.lspconfig")
			require("config.plugins.lsp.lsp-handlers").setup()
			require("config.plugins.lsp.null-ls")
		end,
	},
}
