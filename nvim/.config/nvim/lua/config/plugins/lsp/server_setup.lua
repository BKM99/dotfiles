local lspconfig = require("lspconfig")
local handlers = require("config.plugins.lsp.handlers")
handlers.setup()

lspconfig.lua_ls.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.vimls.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.tsserver.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.pyright.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.clangd.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.rust_analyzer.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.gopls.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.omnisharp.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})

lspconfig.bashls.setup({
	on_attach = handlers.custom_on_attach,
	capabilities = handlers.custom_capabilities,
})
