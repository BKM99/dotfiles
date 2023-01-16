return {
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "b0o/SchemaStore.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim", event = "BufReadPre" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			require("config.lsp")
		end,
	},
}
