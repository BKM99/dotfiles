-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
pcall(require("neodev").setup({
	library = { plugins = { "neotest" }, types = true },
}))

local lspconfig = require("lspconfig")
require("mason").setup({})
require("mason-lspconfig").setup()

local capabilities = require("config.plugins.lsp.handlers").capabilities
local on_attach = require("config.plugins.lsp.handlers").on_attach

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.vimls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
	end,
	capabilities = capabilities,
	settings = {
		format = {
			enable = true,
		},
	},
})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
