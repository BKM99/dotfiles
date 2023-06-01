return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mfussenegger/nvim-jdtls", ft = "java" },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			require("config.plugins.lsp.setup")
		end,
	},
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
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
				"yaml-language-server",

				"bash-language-server",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
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
					null_ls.builtins.formatting.google_java_format,
					null_ls.builtins.formatting.clang_format,
				},
			})
		end,
	},
}
