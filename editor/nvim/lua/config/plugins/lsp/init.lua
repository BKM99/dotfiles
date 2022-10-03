local _ , lua_dev = pcall(require, "lua-dev")
lua_dev.setup()

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- set border for lsp windows
require('lspconfig.ui.windows').default_options.border = 'single'

require("config.plugins.lsp.mason")
require("config.plugins.lsp.lsp-functions").setup()
require("config.plugins.lsp.null-ls")
