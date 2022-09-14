local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>o", ":SymbolsOutline<CR>", opts)

symbols_outline.setup()
