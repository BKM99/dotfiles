return {
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			formatters_by_ft = {
				c = { name = "clangd", timeout_ms = 500, lsp_format = "prefer" },
				javascript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
				javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
				json = { "prettier", stop_on_first = true, name = "dprint", timeout_ms = 500 },
				jsonc = { "prettier", stop_on_first = true, name = "dprint", timeout_ms = 500 },
				less = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
				rust = { name = "rust_analyzer", timeout_ms = 500, lsp_format = "prefer" },
				scss = { "prettier" },
				sh = { "shfmt" },
				typescript = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
				typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
				["_"] = { "trim_whitespace", "trim_newlines" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	config = function(_, _)
	-- 		local nls = require("null-ls")
	--
	-- 		nls.setup({
	-- 			sources = {
	-- 				nls.builtins.code_actions.gomodifytags,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
