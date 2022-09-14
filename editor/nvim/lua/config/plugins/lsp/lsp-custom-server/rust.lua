return {
	on_initialized = function()
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
			pattern = { "*.rs" },
			callback = function()
				vim.lsp.codelens.refresh()
			end,
		})
	end,

	server = {
		on_attach = require("config.plugins.lsp.lsp-functions").on_attach,
		capabilities = require("config.plugins.lsp.lsp-functions").capabilities,
		settings = {
			["rust-analyzer"] = {
				lens = {
					enable = true,
				},
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
}
