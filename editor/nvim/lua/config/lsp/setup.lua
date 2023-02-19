-- NOTE: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
	library = { plugins = { "neotest" }, types = true },
})

local lspconfig = require("lspconfig")
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"tsserver",
		"pyright",
	},
})

local tools = {
	"stylua",
	"eslint_d",
}

-- Install tools
local mr = require("mason-registry")
for _, tool in ipairs(tools) do
	local p = mr.get_package(tool)
	if not p:is_installed() then
		p:install()
	end
end

local capabilities = require("config.lsp.handlers").capabilities
local on_attach = require("config.lsp.handlers").on_attach

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

lspconfig.eslint.setup({})

lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
