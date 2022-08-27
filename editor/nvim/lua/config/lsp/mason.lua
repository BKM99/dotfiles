local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"jsonls",
	"sumneko_lua",
	"clangd",
	"tsserver",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"bashls",
	"yamlls",
	"cssls",
	"eslint",
	"emmet_ls",
	"jdtls",
}

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = servers,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("config.lsp.lsp-functions").on_attach,
		capabilities = require("config.lsp.lsp-functions").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("config.lsp.lsp-custom-server.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("config.lsp.lsp-custom-server.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "jdtls" then
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
