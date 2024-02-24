return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					"prettier",
					"clang-format",
					"stylua",
					"black",
					"gofumpt",
					"goimports",
				})
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofumpt", "goimports" },
				python = { "black" },
				-- javascript = { { "prettierd", "prettier" } },
				-- typescript = { { "prettierd", "prettier" } },
			},
		},
	},
}
