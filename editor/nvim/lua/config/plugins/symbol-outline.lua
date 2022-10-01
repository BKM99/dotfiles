local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

symbols_outline.setup({})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>o", ":SymbolsOutline<CR>", opts)
