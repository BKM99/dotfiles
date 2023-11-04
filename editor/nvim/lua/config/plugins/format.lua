return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports", "gofmt" },
				sh = { "shfmt" },
				["_"] = { "trim_whitespace", "trim_newlines" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = true,
			-- 	timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = true,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
