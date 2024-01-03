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

lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = false,
				-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
