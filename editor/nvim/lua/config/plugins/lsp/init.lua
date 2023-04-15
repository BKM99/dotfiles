return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("config.plugins.lsp.setup")
			require("config.plugins.lsp.handlers").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			{
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				config = function()
					require("mason-tool-installer").setup({
						ensure_installed = {
							"lua-language-server",
							"stylua",

							"typescript-language-server",
							"js-debug-adapter",
							"eslint-lsp",
							"prettier",

							"rust-analyzer",

							"clangd",

							"pyright",
							"black",
							"flake8",

							"gopls",

							"shellcheck",

							"java-debug-adapter",
							"java-test",
							"google-java-format",

							"json-lsp",
						},
					})
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
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
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.eslint,
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.formatting.google_java_format,
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
}
