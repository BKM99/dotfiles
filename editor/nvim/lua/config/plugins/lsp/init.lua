return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.plugins.lsp.setup")
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

							"vim-language-server",

							"typescript-language-server",
							"prettier",
							"eslint_d",

							"rust-analyzer",

							"clangd",
							"clang-format",

							"pyright",
							"black",
							"flake8",
							"debugpy",

							"gopls",

							"shellcheck",

							"jdtls",
							"java-debug-adapter",
							"java-test",
							"google-java-format",

							"json-lsp",

							"bash-language-server",
						},
					})
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "folke/neodev.nvim" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.formatting.google_java_format,
					null_ls.builtins.formatting.clang_format,
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
}
