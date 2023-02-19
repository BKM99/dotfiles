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
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		config = function()
			local null_ls = require("null-ls")

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics

			null_ls.setup({
				debug = false,
				sources = {
					formatting.prettierd.with({
						extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
					}),
					formatting.black.with({ extra_args = { "--fast" } }),
					diagnostics.flake8,
					formatting.stylua,
					formatting.goimports,
					formatting.gofumpt,
				},
			})
		end,
	},
}
