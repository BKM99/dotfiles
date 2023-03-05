return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("config.plugins.lsp.setup")
			require("config.plugins.lsp.handlers").setup()
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.formatting.eslint_d,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.formatting.google_java_format,
					null_ls.builtins.formatting.prettierd,
				},
			})
		end,
	},
}
