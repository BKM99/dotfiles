return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lspconfig.ui.windows").default_options.border = "single"
			require("config.plugins.lsp.server_setup")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			doc_lines = 0,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "Hoffs/omnisharp-extended-lsp.nvim", ft = "cs" },
	{ "b0o/SchemaStore.nvim" },
}
