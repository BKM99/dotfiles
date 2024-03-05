return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"go",
				"gomod",
				"gowork",
				"gosum",
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				gopls = {},
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "goimports", "gofumpt", "gomodifytags", "impl", "delve" })
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				nls.builtins.code_actions.gomodifytags,
				nls.builtins.code_actions.impl,
				nls.builtins.formatting.goimports,
				nls.builtins.formatting.gofumpt,
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			{ "leoluz/nvim-dap-go", config = true },
		},
	},
}
