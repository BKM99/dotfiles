require("config.core.options")
require("config.core.keymaps")
require("config.core.autocommands")
if not vim.g.vscode then
	require("config.core.lazy")
end
